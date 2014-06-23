using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class Tags
    {
        private int _nTagsID = 0;
        private string _sTagsName = string.Empty;
        private string _sTagsURL = string.Empty;
        private int _nSubCategoryIDFK = 0;
        private int _nTagsStatus = 0;


        public int TagsID
        {
            set { _nTagsID = value; }
            get { return _nTagsID; }
        }


        public string TagsName
        {
            set { _sTagsName = value; }
            get { return _sTagsName; }
        }

        public string TagsURL
        {
            set { _sTagsURL = value; }
            get { return _sTagsURL; }
        }

        public int SubCategoryIDFK
        {
            set { _nSubCategoryIDFK = value; }
            get { return _nSubCategoryIDFK; }
        }

        public int TagsStatus
        {
            set { _nTagsStatus = value; }
            get { return _nTagsStatus; }
        }

    }
}
