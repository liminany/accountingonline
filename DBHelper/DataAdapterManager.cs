using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Reflection;
using System.Data.SqlClient;

namespace DALC4NET
{
    /// <summary>
    /// Provides the appropriate IDataAdapter
    /// </summary>
    internal class DataAdapterManager
    {
        private CommandBuilder _commandBuilder = new CommandBuilder();
        

        /// <summary>
        /// Creates and returns the IDataAdapter for the specified Sql Command
        /// </summary>
        /// <param name="sqlCommand">Sql Command</param>
        /// <param name="connection">connection</param>
        /// <returns>IDataAdapter</returns>
        internal IDataAdapter GetDataAdapter(string sqlCommand, IDbConnection connection)
        {
            return GetDataAdapter(sqlCommand, connection, CommandType.Text);
        }


        /// <summary>
        /// Creates and returns the IDataAdapter for the specified Sql Command/ Stored Proc
        /// </summary>
        /// <param name="sqlCommand">Sql Command/ Stored Proc</param>
        /// <param name="connection">Connection</param>
        /// <param name="param">DBParameter</param>
        /// <param name="commandType">Type of Command (Text/ StoredProc)</param>
        /// <returns>IDataAdapter</returns>
        internal IDataAdapter GetDataAdapter(string sqlCommand, IDbConnection connection, DBParameter param , CommandType commandType)
        {            
            IDataAdapter adapter = null;
            IDbCommand command = _commandBuilder.GetCommand(sqlCommand, connection, param , commandType);
            adapter = GetDataAdapter(command);
            return adapter;
        }


        /// <summary>
        /// Creates and returns the IDataAdapter for the specified Sql Command/ Stored Proc
        /// </summary>
        /// <param name="sqlCommand">Sql Command/ Stored Proc</param>
        /// <param name="connection">Connection</param>
        /// <param name="paramCollection">Database Parameter collection</param>
        /// <param name="commandType">Type of Command (Text/ StoredProc)</param>
        /// <returns>IDataAdapter</returns>
        internal IDataAdapter GetDataAdapter(string sqlCommand, IDbConnection connection, DBParameterCollection paramCollection, CommandType commandType)
        {
            IDataAdapter adapter = null;
            IDbCommand command = _commandBuilder.GetCommand(sqlCommand, connection, paramCollection, commandType);
            adapter = GetDataAdapter(command);            
            return adapter;
        }


        /// <summary>
        /// Creates and returns the IDataAdapter for the specified Sql Command/ Stored Proc
        /// </summary>
        /// <param name="sqlCommand">Sql Command/ Stored Proc name</param>
        /// <param name="connection">Connection</param>
        /// <param name="commandType">Type of Command (Text/ StoredProc)</param>
        /// <returns></returns>
        internal IDataAdapter GetDataAdapter(string sqlCommand, IDbConnection connection, CommandType commandType)
        {          
            IDataAdapter adapter = null;
            IDbCommand command = _commandBuilder.GetCommand(sqlCommand, connection, commandType);
            adapter = GetDataAdapter(command);           
            return adapter;
        } 


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlCommand"></param>
        /// <param name="paramCollection"></param>
        /// <param name="connection"></param>
        /// <param name="tableName"></param>
        /// <param name="commandType"></param>
        /// <returns></returns>
        internal DataTable GetDataTable(string sqlCommand, DBParameterCollection paramCollection, IDbConnection connection, string tableName, CommandType commandType)
        {
            DataTable table = null;

            if(tableName != string.Empty)
                table = new DataTable(tableName);
            else
                table = new DataTable();

            IDbCommand command = null;
            if (paramCollection != null)
            {
                if(paramCollection.Parameters.Count > 0)
                    command = _commandBuilder.GetCommand(sqlCommand, connection, paramCollection, commandType);
                else
                    command = _commandBuilder.GetCommand(sqlCommand, connection, commandType);
            }
            else
                command = _commandBuilder.GetCommand(sqlCommand, connection, commandType);


            IDataAdapter adapter = GetDataAdapter(command);
            string typeName = AssemblyProvider.GetInstance().GetDataAdapterType();


            Type cmdType = AssemblyProvider.GetInstance().DBProviderAssembly.GetType(AssemblyProvider.GetInstance().GetCommandType());
            Type dataAdapterType = AssemblyProvider.GetInstance().DBProviderAssembly.GetType(AssemblyProvider.GetInstance().GetDataAdapterType());

            ConstructorInfo constructor = dataAdapterType.GetConstructor(new Type[] { cmdType });
            adapter = (IDataAdapter)constructor.Invoke(new object[] { command });
            MethodInfo method = dataAdapterType.GetMethod("Fill", new Type[] {typeof(DataTable) });

            try
            {
                method.Invoke(adapter, new object[] { table });
            }
            catch (Exception err)
            {
                throw err;
            }
            return table;
        }

        internal DataTable GetDataTable(string sqlCommand, DBParameter param, IDbConnection connection, string tableName, CommandType commandType)
        {
            DBParameterCollection paramCollection = new DBParameterCollection();
            paramCollection.Add(param);
            return GetDataTable(sqlCommand, paramCollection , connection, tableName, commandType);
        }

        internal DataTable GetDataTable(string sqlCommand, IDbConnection connection, string tableName, CommandType commandType)
        {            
            return GetDataTable(sqlCommand, new DBParameterCollection(), connection, tableName, commandType);
        }

        internal DataTable GetDataTable(string sqlCommand, IDbConnection connection, CommandType commandType)
        {
            return GetDataTable(sqlCommand, new DBParameterCollection(), connection, string.Empty, commandType);
        }

        internal DataTable GetDataTable(string sqlCommand, IDbConnection connection)
        {
            return GetDataTable(sqlCommand, new DBParameterCollection(), connection, string.Empty, CommandType.Text);
        }


        private ConstructorInfo GetDataAdapterConstructor()
        {
            string typeName = AssemblyProvider.GetInstance().GetDataAdapterType();
            Type cmdType = AssemblyProvider.GetInstance().DBProviderAssembly.GetType(AssemblyProvider.GetInstance().GetCommandType());
            Type dataAdapterType = AssemblyProvider.GetInstance().DBProviderAssembly.GetType(AssemblyProvider.GetInstance().GetDataAdapterType());
            ConstructorInfo constructor = dataAdapterType.GetConstructor(new Type[] { cmdType });
            return constructor;
        }

        private IDataAdapter GetDataAdapter(IDbCommand command)
        {            
            IDataAdapter adapter = null;            
            ConstructorInfo constructor = GetDataAdapterConstructor();
            adapter = (IDataAdapter)constructor.Invoke(new object[] { command });                        
            return adapter;
        }
    }
}
