using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Conection
/// </summary>

    using System.Data.SqlClient;

    public sealed class Conection
    {
        private static Conection _instance = null;
        private static readonly object _lock = new object();
        private SqlConnection _conexao;

        private Conection()
        {
            // String de conexão com seu banco de dados
            _conexao = new SqlConnection("Server=mssql.unibolsasbrasil.com.br,1433;Database=unibolsasbrasil;User ID=unibolsasbrasil;Password=Alex1980;");
        }

        public static Conection GetInstance()
        {
            lock (_lock)
            {
                if (_instance == null)
                {
                    _instance = new Conection();
                }
            }
            return _instance;
        }

        public SqlConnection GetConexao()
        {
            return _conexao;
        }

        public void FecharConexao()
        {
            if (_conexao.State != System.Data.ConnectionState.Closed)
            {
                _conexao.Close();
            }
        }
    }