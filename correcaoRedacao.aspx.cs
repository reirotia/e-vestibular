using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD;
using System.Collections;
using System.Net;
using System.Net.Mail;
public partial class correcaoRedacao : System.Web.UI.Page
{
    ManipulacaoBanco bd = new ManipulacaoBanco();
    DataSet dsQuestao, ds, dsResposta, questao, dsRedacao, dsLiberacao;

    string str = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        str = "select v.redacao, c.nome , c.cpf, c.codEletronico ,v.TipoProva8 "
        + " from vestibularEletronico v inner join CadastroEletronico c on c.codEletronico =v.codEletronico"
        + " where v.TipoProva8 is null and v.redacao is not null";
        ds = bd.ConsultaSQL(str);
        Session.Add("ds", ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session.Add("codEletronico", ds.Tables[0].Rows[0]["codEletronico"].ToString());
        }
        else {
            Session.Add("codEletronico", "0");
        }

    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        string str2 = "";
        if (Request["txtNota"] != "0")
        {
            str = "update vestibularEletronico set STATUSRED=1,TipoProva8=" + Request["txtNota"] + ",provacompleta=1 where codEletronico=" + Session["codEletronico"];
            str2 = "update CadastroEletronico set statusnum=1 where  codEletronico=" + Session["codEletronico"];
            bd.ExecutarSQL(str2);
        }
        else {
            str = "update vestibularEletronico set STATUSRED=1,TipoProva8=" + Request["txtNota"] + ",provacompleta=1 where codEletronico=" + Session["codEletronico"];
           
            str2 = "update CadastroEletronico set statusnum=2 where  codEletronico=" + Session["codEletronico"];
            bd.ExecutarSQL(str2);
        }
            bd.ExecutarSQL(str);
    }



}