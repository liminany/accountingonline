using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text.RegularExpressions;
using System.IO.Compression;

namespace Codeproject.Compression
{
    public enum CompressOptions
    {
        GZip,
        Deflate,
        None
    }

    public class WhitespaceFilter : Stream
    {
        private GZipStream _contentGZip;
        private DeflateStream _content_Deflate;
        private Stream _content;
        private CompressOptions _options;

        public WhitespaceFilter(Stream content, CompressOptions options)
        {
            if (options == CompressOptions.GZip)
            {
                this._contentGZip = new GZipStream(content, CompressionMode.Compress);
                this._content = this._contentGZip;
            }
            else if (options == CompressOptions.Deflate)
            {
                this._content_Deflate = new DeflateStream(content, CompressionMode.Compress);
                this._content = this._content_Deflate;
            }
            else
            {
                this._content = content;
            }
            this._options = options;
        }


        public override bool CanRead
        {
            get { return this._content.CanRead; }
        }

        public override bool CanSeek
        {
            get { return this._content.CanSeek; }
        }

        public override bool CanWrite
        {
            get { return this._content.CanWrite; }
        }

        public override void Flush()
        {
            this._content.Flush();
        }

        public override long Length
        {
            get { return this._content.Length; }
        }

        public override long Position
        {
            get
            {
                return this._content.Position;
            }
            set
            {
                this._content.Position = value;
            }
        }

        public override int Read(byte[] buffer, int offset, int count)
        {
            return this._content.Read(buffer, offset, count);
        }

        public override long Seek(long offset, SeekOrigin origin)
        {
            return this._content.Seek(offset, origin);
        }

        public override void SetLength(long value)
        {
            this._content.SetLength(value);
        }

        public override void Write(byte[] buffer, int offset, int count)
        {
            byte[] data = new byte[count + 1];
            Buffer.BlockCopy(buffer, offset, data, 0, count);


            string s = System.Text.Encoding.UTF8.GetString(data);
            s = Regex.Replace(s, "^\\s*",string.Empty, RegexOptions.Compiled | RegexOptions.Multiline);
            s = Regex.Replace(s, "\\r\\n", string.Empty, RegexOptions.Compiled | RegexOptions.Multiline);
            s = Regex.Replace(s, "<!--*.*?-->", string.Empty, RegexOptions.Compiled | RegexOptions.Multiline);
            
            byte[] outdata = System.Text.Encoding.UTF8.GetBytes(s);
            this._content.Write(outdata, 0, outdata.GetLength(0));
        }

    }
}
