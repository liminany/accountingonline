using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class ContactUs
    {
        private int _sContactUsID = 0;
        private string _sUserName= string.Empty;
        private string _sEmailAddress= string.Empty;
        private string _sUserMessage= string.Empty;

        public int ContactUsID
        {
            set { _sContactUsID = value; }
            get { return _sContactUsID; }
        }
        public string UserName
        {
            set { _sUserName = value; }
            get { return _sUserName; }
        }
        public string EmailAddress
        {
            set { _sEmailAddress = value; }
            get { return _sEmailAddress; }
        }
        public string UserMessage
        {
            set { _sUserMessage = value; }
            get { return _sUserMessage; }
        }
    }
}
