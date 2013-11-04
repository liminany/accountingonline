using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class DashboardStatstic
    {
        private string _sDateForm = string.Empty;
        private string _sDateTo = string.Empty;

        private int _sAllAdsRegister = 0;
        private int _sAdsPendding = 0;
        private int _sUserRegister = 0;
        private int _sUserPennding = 0;


        public string DateTo
        {
            set
            {
                _sDateTo = value;
            }
            get
            {
                return _sDateTo;
            }
        }
        public string DateForm
        {
            set
            {
                _sDateForm = value;
            }
            get
            {
                return _sDateForm;
            }
        }

        public int AllAdsRegister
        {
            set
            {
                _sAllAdsRegister = value;
            }
            get
            {
                return _sAllAdsRegister;
            }
        }
        public int AdsPendding
        {
            set
            {
                _sAdsPendding = value;
            }
            get
            {
                return _sAdsPendding;
            }
        }
        public int UserRegister
        {
            set
            {
                _sUserRegister = value;
            }
            get
            {
                return _sUserRegister;
            }
        }
        public int UserPennding
        {
            set
            {
                _sUserPennding = value;
            }
            get
            {
                return _sUserPennding;
            }
        }

    }
}
