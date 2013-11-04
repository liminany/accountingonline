using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class UsersComments
    {
        private int _sCommentID = 0;
        private int _sCategoryID = 0;
        private int _sArticlsID = 0;
        private string _sUserFullName = string.Empty;
        private string _sEmailAddress = string.Empty;
        private string _sUserComments = string.Empty;
        private int _sCommentStatus = 0;
        private string _sUserImage = string.Empty;

        public int CommentID
        {
            set { _sCommentID = value; }
            get { return _sCommentID; }
        }
        public int CategoryID
        {
            set { _sCategoryID = value; }
            get { return _sCategoryID; }
        }
        public int ArticlsID
        {
            set { _sArticlsID = value; }
            get { return _sArticlsID; }
        }
        public string UserFullName
        {
            set { _sUserFullName = value; }
            get { return _sUserFullName; }
        }
        public string EmailAddress
        {
            set { _sEmailAddress = value; }
            get { return _sEmailAddress; }
        }
        public string UserComments
        {
            set { _sUserComments = value; }
            get { return _sUserComments; }
        }
        public int CommentStatus
        {
            set { _sCommentStatus = value; }
            get { return _sCommentStatus; }
        }
        public string UserImage
        {
            set { _sUserImage = value; }
            get { return _sUserImage; }
        }
    }
}
