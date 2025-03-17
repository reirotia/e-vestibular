using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD;

public partial class matricula : System.Web.UI.Page
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    String str;

    protected void Page_Load(object sender, EventArgs e)
    {

        str = ScriptSql.semestreAtual + Parametro.SEMESTRE;
        ds = bd.ConsultaSQL(str);
        Session.Add("semestre", ds.Tables[0].Rows[0]["semestre"].ToString());

    }
}