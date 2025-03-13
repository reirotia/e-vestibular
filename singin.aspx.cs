using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data;
using System.Text.RegularExpressions;
public partial class singin : System.Web.UI.Page
{
    ManipulacaoBanco bd = new ManipulacaoBanco();
    DataSet ds;
    string sql;
    string Id;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        string cpf = String.Join("", Regex.Split(Request.Form["inputCpf"].ToString(), @"[^\d]"));
        sql = "select * from CadastroEletronico where cpf='" + cpf + "'";
        ds = bd.ConsultaSQL(sql);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            Id = ds.Tables[0].Rows[0]["codEletronico"].ToString();

            if (ds.Tables[0].Rows[0]["dtProvafinalizada"].ToString().Length > 0)
            {
                Response.Redirect("resultado.aspx?Id=" + Id ); 
            }
           
            Response.Redirect("infoo.aspx?Id=" + Id);
        }

    }
}