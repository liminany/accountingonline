using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NLog;
using DALC4NET;
using System.Collections;
using Entity;
using System.Data;

namespace DAL
{
    public class DBDashboardStatstic
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();
        DBHelper _dbHelper = null;

        public DBDashboardStatstic()
        {
            _dbHelper = DBHelper.GetInstance();
        }


        public DataSet GetHeaderDashboardStatistic(string sFromDate, string sToDate)
        {
            DataSet objDataSetReturn = new DataSet();
            try
            {
                DBParameter param1 = new DBParameter("@FromDate", sFromDate);
                DBParameter param2 = new DBParameter("@ToDate", sToDate);
                DBParameterCollection paramCollection = new DBParameterCollection();
                paramCollection.Add(param1);
                paramCollection.Add(param2);
                objDataSetReturn = _dbHelper.ExecuteDataSet("sp_DashboardStatstic", paramCollection, CommandType.StoredProcedure);
                return objDataSetReturn;
            }
            catch (Exception ex)
            {
                _logger.Error("DAL:::DBDashboardStatstic:::GetHeaderDashboardStatistic:::" + ex.Message);
                return objDataSetReturn;
            }
        }
    }
}
