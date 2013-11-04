using System;
using System.Collections.Generic;
using System.Data;
using System.Text;


namespace DALC4NET
{
    internal class DBParamBuilder
    {                
        internal IDataParameter GetParameter(DBParameter parameter)
        {            
            IDbDataParameter dbParam = GetParameter();         
            dbParam.ParameterName = parameter.Name;         
            dbParam.Value = parameter.Value;
            dbParam.Direction = parameter.ParamDirection;            
            dbParam.DbType = parameter.Type;

            return dbParam;            
        }

        internal List<IDataParameter> GetParameterCollection(DBParameterCollection parameterCollection)
        {
            List<IDataParameter> dbParamCollection = new List<IDataParameter>();
            IDataParameter dbParam = null;
            foreach(DBParameter param in parameterCollection.Parameters)
            {
                dbParam = GetParameter(param);
                dbParamCollection.Add(dbParam);
            }
            
            return dbParamCollection;
        }

        #region Private Methods
        private IDbDataParameter GetParameter()
        {
            string typeName = AssemblyProvider.GetInstance().GetParameterType();
            IDbDataParameter dbParam = (IDbDataParameter)AssemblyProvider.GetInstance().DBProviderAssembly.CreateInstance(typeName);
            return dbParam;
        }

  

        #endregion
    }
}
