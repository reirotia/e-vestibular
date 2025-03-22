using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Singleton
/// </summary>
public class Singleton
{    
    //private  static Singleton instance;
    private static SqlConnection _conexao = null;


	private Singleton()
	{

        _conexao = new SqlConnection("Server=mssql.unibolsasbrasil.com.br,1433;Database=unibolsasbrasil;User ID=unibolsasbrasil;Password=Alex1980;");
    }


   
    
}