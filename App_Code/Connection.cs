using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Sql;


/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    private static SqlConnection _conexao;

	public Connection()
	{

        _conexao = new SqlConnection("Server=mssql.unibolsasbrasil.com.br,1433;Database=unibolsasbrasil;User ID=unibolsasbrasil;Password=Alex1980;");
    }

    public static SqlConnection getConexacao()
    {
        if (_conexao == null)
        {
             new Connection();

        }
        return _conexao;
     
    }
}