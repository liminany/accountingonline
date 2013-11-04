using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class Users
    {
        private int _sUserID = 0;
        private string _sUserFullName = string.Empty;
        private string _sUserEmailAddress = string.Empty;
        private string _sUserPassword = string.Empty;
        private int _sUserPermission = 0;
        private int _nUserStatus = 0;
        private DateTime _dtCreateDateTime = new DateTime();

        public int UserID
        {
            set { _sUserID = value; }
            get { return _sUserID; }
        }

        public string UserFullName
        {
            set { _sUserFullName = value; }
            get { return _sUserFullName; }
        }

        public string UserEmailAddress
        {
            set { _sUserEmailAddress = value; }
            get { return _sUserEmailAddress; }
        }

        public string UserPassword
        {
            set { _sUserPassword = value; }
            get { return _sUserPassword; }
        }
        public int UserPermission
        {
            set { _sUserPermission = value; }
            get { return _sUserPermission; }
        }
        public int UserStatus
        {
            set { _nUserStatus = value; }
            get { return _nUserStatus; }
        }

        public DateTime CreateDateTiem
        {
            set { _dtCreateDateTime = value; }
            get { return _dtCreateDateTime; }
        }

    }
}
