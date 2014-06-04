using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;
namespace EmailCollecter
{
    class Program
    {
        static void Main(string[] args)
        {
            com.arabisky.www.ManageEmailShoot objManageEmailShoot = new com.arabisky.www.ManageEmailShoot();
            using (StreamReader sr = File.OpenText("email.txt"))
            {
                string s = String.Empty;
                while ((s = sr.ReadLine()) != null)
                {
                    if (IsValidEmail(s.ToString()))
                    {
                        int nReturnValue = objManageEmailShoot.InsertNewEmailAddress(s.ToString());
                        if (nReturnValue == 1)
                        {
                            Console.WriteLine(s + " - Insert Scuessfully");
                        }
                        else
                        {
                            Console.WriteLine(s + " - Alerady Exists");
                        }   
                    }
                    else
                    {
                        Console.WriteLine(s + " - Incoccrect Email Format");
                    }
                }
            }
        }

        private static bool IsValidEmail(string emailAddress)
        {
            const string validEmailPattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|"
                                             + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)"
                                             + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";

            return new Regex(validEmailPattern, RegexOptions.IgnoreCase).IsMatch(emailAddress);
        }
    }
}
