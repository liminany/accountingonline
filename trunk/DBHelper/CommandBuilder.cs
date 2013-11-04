using System;
using System.Collections.Generic;
using System.Data;
using System.Text;


namespace DALC4NET
{
    internal class CommandBuilder
    {
        private DBParamBuilder _paramBuilder = new DBParamBuilder();

        #region Inrernal Methods
        internal IDbCommand GetCommand(string commandText, IDbConnection connection)
        {
            return GetCommand(commandText, connection, CommandType.Text);
        }


        internal IDbCommand GetCommand(string commandText, IDbConnection connection, CommandType commandType)
        {
            IDbCommand command = GetCommand();
            command.CommandText = commandText;
            command.Connection = connection;
            command.CommandType = commandType;
            return command;
        }


        internal IDbCommand GetCommand(string commandText, IDbConnection connection, DBParameter parameter)
        {
            return GetCommand(commandText, connection, parameter, CommandType.Text);
        }

        internal IDbCommand GetCommand(string commandText, IDbConnection connection, DBParameter parameter, CommandType commandType)
        {
            IDataParameter param = _paramBuilder.GetParameter(parameter);
            IDbCommand command = GetCommand(commandText, connection, commandType);
            command.Parameters.Add(param);
            return command;
        }

        internal IDbCommand GetCommand(string commandText, IDbConnection connection, DBParameterCollection parameterCollection)
        {
            return GetCommand(commandText, connection, parameterCollection, CommandType.Text);
        }

        internal IDbCommand GetCommand(string commandText, IDbConnection connection, DBParameterCollection parameterCollection, CommandType commandType)
        {
            List<IDataParameter> paramArray = _paramBuilder.GetParameterCollection(parameterCollection);
            IDbCommand command = GetCommand(commandText, connection, commandType);

            foreach (IDataParameter param in paramArray)            
                command.Parameters.Add(param);
            
            return command;
        }


        #endregion

        #region Private Methods"

        private IDbCommand GetCommand()
        {
            string typeName = AssemblyProvider.GetInstance().GetCommandType();
            IDbCommand command = (IDbCommand)AssemblyProvider.GetInstance().DBProviderAssembly.CreateInstance(typeName);                           
            return command;
        }

        #endregion
    }
}
