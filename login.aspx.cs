using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data;
using System.Text.RegularExpressions;
public partial class login : System.Web.UI.Page
{
    ManipulacaoBanco bd = new ManipulacaoBanco();
    DataSet ds;
    string sql;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        string cpf = String.Join("", Regex.Split(Request.Form["inputCpf"].ToString(), @"[^\d]"));
        sql = "select * from vLoginIes where cpf='" + cpf + "' and senha='" + Request.Form["inputSenha"].ToString() + "'";
        ds = bd.ConsultaSQL(sql);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Redirect("menu2.aspx");
        }
        else
        {
           
            Session.Add("faculdadeId", ds.Tables[0].Rows[0]["faculdadeId"].ToString());
            ds = bd.ConsultaSQL("select faculdade,sigla from vfaculdade where faculdadeID=" + ds.Tables[0].Rows[0]["faculdadeId"].ToString());

            Session.Add("sigla", ds.Tables[0].Rows[0]["sigla"].ToString());
            Response.Redirect("menu2.aspx");
        }

    }
}