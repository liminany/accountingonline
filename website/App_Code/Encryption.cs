using System;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace EncryptionMethods
{
    public class Encryption
    {
        #region Variables
        private byte[] key = null;
        private byte[] IV = { 0xa2, 0xf4, 0x74, 0x1b, 0xe7, 0xd8, 0xc, 0x58, 0x98, 0xc2, 0x59, 0x17, 0x7d, 0xda, 0x3b, 0x7e };

        #endregion

        #region xSP Encryption
        /// <summary>
        /// 
        /// </summary>
        /// <param name="key"></param>
        public Encryption(string key)
        {
            if (key.Length > 32)
            {
                this.key = System.Text.Encoding.UTF8.GetBytes(key.Substring(1, 32));
            }
            else
            {
                this.key = System.Text.Encoding.UTF8.GetBytes(key.PadRight(32));
            }
        }

        #endregion

        #region Methods

        /// <summary>
        /// 
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public string EncryptData(string text)
        {
            byte[] array = System.Text.Encoding.UTF8.GetBytes(text);

            // Check arguments.
            if (text == null || text.Length <= 0)
                throw new ArgumentNullException("text");
            if (key == null || key.Length <= 0)
                throw new ArgumentNullException("key");
            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("IV");

            // Declare the streams used
            // to encrypt to an in memory
            // array of bytes.
            MemoryStream ms = null;
            CryptoStream cs = null;
            StreamWriter sw = null;

            // Declare the RijndaelManaged object
            // used to encrypt the data.
            RijndaelManaged aesAlg = null;

            try
            {
                // Create a RijndaelManaged object
                // with the specified key and IV.
                aesAlg = new RijndaelManaged();
                aesAlg.Key = key;
                aesAlg.IV = IV;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                // Create the streams used for encryption.
                ms = new MemoryStream();
                cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write);
                sw = new StreamWriter(cs);

                //Write all data to the stream.
                sw.Write(text);

            }
            finally
            {
                // Clean things up.

                // Close the streams.
                if (sw != null)
                    sw.Close();
                if (cs != null)
                    cs.Close();
                if (ms != null)
                    ms.Close();

                // Clear the RijndaelManaged object.
                if (aesAlg != null)
                    aesAlg.Clear();
            }

            // Return the encrypted bytes from the memory stream and
            // convert to unicode string.
            //UnicodeEncoding encoding = new UnicodeEncoding();
            //string encryptedString = encoding.GetString(ms.ToArray());
            //return encryptedString;
            return ToBase64(ms.ToArray());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public string DecryptData(string text)
        {
            try
            {
                // Check arguments.
                if (text == null || text.Length <= 0)
                    throw new ArgumentNullException("text");
                if (key == null || key.Length <= 0)
                    throw new ArgumentNullException("key");
                if (IV == null || IV.Length <= 0)
                    throw new ArgumentNullException("IV");

                UnicodeEncoding encoding = new UnicodeEncoding();
                //byte[] array = encoding.GetBytes(text);
                byte[] array = FromBase64(text);

                // Declare the streams used
                // to decrypt to an in memory
                // array of bytes.
                using (MemoryStream ms = new MemoryStream(array))
                {

                    using (RijndaelManaged aesAlg = new RijndaelManaged())
                    {
                        aesAlg.Key = key;
                        aesAlg.IV = IV;
                        ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);
                        using (CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                        {
                            using (StreamReader sr = new StreamReader(cs))
                            {
                                return sr.ReadToEnd();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            #region OLD
            //MemoryStream ms = null;
            //CryptoStream cs = null;
            //StreamReader sr = null;

            // Declare the RijndaelManaged object
            // used to decrypt the data.
            //RijndaelManaged aesAlg = null;

            // Declare the string used to hold
            // the decrypted text.
            //string decryptedString = null;

            //try
            //{
            //    // Create a RijndaelManaged object
            //    // with the specified key and IV.
            //    aesAlg = new RijndaelManaged();
            //    aesAlg.Key = key;
            //    aesAlg.IV = IV;

            //    // Create a decrytor to perform the stream transform.
            //    ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

            //    // Create the streams used for decryption.
            //    ms = new MemoryStream(array);
            //    cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read);
            //    sr = new StreamReader(cs);

            //    // Read the decrypted bytes from the decrypting stream
            //    // and place them in a string.
            //    decryptedString = sr.ReadToEnd();
            //}
            //finally
            //{
            //    // Clean things up.

            //    // Close the streams.
            //    if (sr != null)
            //        sr.Close();
            //    if (cs != null)
            //        cs.Close();
            //    if (ms != null)
            //        ms.Close();

            //    // Clear the RijndaelManaged object.
            //    if (aesAlg != null)
            //        aesAlg.Clear();
            //} 
            #endregion

        }

        /// <summary>
        /// converts from a string Base64 representation to an array of bytes
        /// </summary>
        internal byte[] FromBase64(string base64Encoded)
        {
            if (base64Encoded == null || base64Encoded.Length == 0)
            {
                return null;
            }
            try
            {
                return Convert.FromBase64String(base64Encoded);
            }
            catch (System.FormatException ex)
            {
                throw new System.FormatException("The provided string does not appear to be Base64 encoded:" + Environment.NewLine + base64Encoded + Environment.NewLine, ex);
            }
        }

        /// <summary>
        /// converts from an array of bytes to a string Base64 representation
        /// </summary>
        internal string ToBase64(byte[] b)
        {
            if (b == null || b.Length == 0)
            {
                return "";
            }
            return Convert.ToBase64String(b);
        }

        public static string GetSHA(string toEncrypt)
        {
            System.Security.Cryptography.SHA256 sha = System.Security.Cryptography.SHA256.Create();
            byte[] arrSHA = sha.ComputeHash(System.Text.Encoding.ASCII.GetBytes(toEncrypt));
            return Convert.ToBase64String(arrSHA);
        }

        public static string EncodeTo64(string text)
        {
            byte[] textAsBytes = System.Text.ASCIIEncoding.ASCII.GetBytes(text);
            return System.Convert.ToBase64String(textAsBytes);
        }

        public static string DecodeFrom64(string text)
        {
            byte[] textAsBytes = System.Convert.FromBase64String(text);
            return System.Text.ASCIIEncoding.ASCII.GetString(textAsBytes);
        }

        public static string Encrypt(string input)
        {
            try
            {
                MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
                byte[] TDESKey = HashProvider.ComputeHash(UTF8Encoding.UTF8.GetBytes("-GSD*X-"));
                //string key = SystemSettingsTools.GetGSKey();
                byte[] textAsBytes = System.Text.ASCIIEncoding.UTF8.GetBytes(input);
                input = System.Convert.ToBase64String(textAsBytes);
                byte[] inputArray = UTF8Encoding.UTF8.GetBytes(input);
                TripleDESCryptoServiceProvider tripleDES = new TripleDESCryptoServiceProvider();
                tripleDES.Key = TDESKey;
                tripleDES.Mode = CipherMode.ECB;
                tripleDES.Padding = PaddingMode.PKCS7;
                ICryptoTransform cTransform = tripleDES.CreateEncryptor();
                byte[] resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
                tripleDES.Clear();
                return Convert.ToBase64String(resultArray, 0, resultArray.Length);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public static string Decrypt(string input)
        {
            try
            {
                input = input.Replace(" ", "+");
                MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
                byte[] TDESKey = HashProvider.ComputeHash(UTF8Encoding.UTF8.GetBytes("-GSD*X-"));
                byte[] inputArray = Convert.FromBase64String(input);
                TripleDESCryptoServiceProvider tripleDES = new TripleDESCryptoServiceProvider();
                tripleDES.Key = TDESKey;
                tripleDES.Mode = CipherMode.ECB;
                tripleDES.Padding = PaddingMode.PKCS7;
                ICryptoTransform cTransform = tripleDES.CreateDecryptor();
                byte[] resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
                tripleDES.Clear();
                //return UTF8Encoding.UTF8.GetString(resultArray);
                input = UTF8Encoding.UTF8.GetString(resultArray);
                byte[] textAsBytes = System.Convert.FromBase64String(input);
                return System.Text.ASCIIEncoding.UTF8.GetString(textAsBytes);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}
