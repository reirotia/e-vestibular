using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data;

public partial class masterAluno : System.Web.UI.MasterPage
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {

        //ds = bd.ConsultaSQL("select sigla from vfaculdade where faculdadeId=" + Session["faculdadeId"].ToString());
        string str = "select TipoProva1,TipoProva4,TipoProva8 ,STATUSRED,STATUSOBJ,respostaPergunta,c.codEletronico,nome,cpf,dtinscricao,dtProvaFinalizada, "
     + "c.faculdadeid,f.btMatricula,f.dsLink,f.sigla,f.faculdadeId from vestibularEletronico v inner join  CadastroEletronico c on v.codEletronico=c.codEletronico inner join vfaculdade f on f.faculdadeId="
     + " c.faculdadeID  where c.codEletronico=" + Session["codEletronico"];
        ds = bd.ConsultaSQL(str);
        Session.Add("faculdadeId", ds.Tables[0].Rows[0]["faculdadeId"].ToString());
        Session.Add("ds", ds);
        Session.Add("sigla", ds.Tables[0].Rows[0]["sigla"].ToString());
        Session.Add("logo", "assets/img/logo/" + Session["faculdadeId"].ToString() + ".png");
    }
}
