using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class UserMessages
    {
        private string _sMessageTitle = string.Empty;
        private string _sMessageBody = string.Empty;
        private DateTime _dtMessageCreateDate;
        private int _nMessageUserID = 0;
        private int _nMessageSendUsers = 0;
        private int _nMessageFlag = 0;

        public string MessageTitle
        {
            get { return _sMessageTitle; }
            set { _sMessageTitle = value; }
        }
        public string MessageBody
        {
            get { return _sMessageBody; }
            set { _sMessageBody = value; }
        }
        public DateTime MessageCreateDate
        {
            get { return _dtMessageCreateDate; }
            set { _dtMessageCreateDate = value; }
        }
        public int MessageUserID
        {
            get { return _nMessageUserID; }
            set { _nMessageUserID = value; }
        }
        public int MessageSendUsers
        {
            get { return _nMessageSendUsers; }
            set { _nMessageSendUsers = value; }
        }
        public int MessageFlag
        {
            get { return _nMessageFlag; }
            set { _nMessageFlag = value; }
        }

    }
}
