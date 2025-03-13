using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data;
public partial class infoo : System.Web.UI.Page
{
    DataSet ds,dsLiberacao;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    private string faculdadeID;
    private string tipoVestibularID;
    private string Id;
    protected void Page_Load(object sender, EventArgs e)
    {

        DateTime dtCadastro = DateTime.Now;
        DateTime d1;
        
        Id = Request["id"].ToString();
        
        string str="";
        if (Id == null)
        {
            Response.Redirect("singin.aspx");
        }
        else
        {

            str = "select dtProvafinalizada from CadastroEletronico where codEletronico=" + Id;
            dsLiberacao = bd.ConsultaSQL(str);
            if (!String.IsNullOrEmpty(dsLiberacao.Tables[0].Rows[0]["dtProvafinalizada"].ToString()))
            {
                Response.Redirect("finalizar.aspx?Id=" + Id);
                return;
            }



            str = "select dtprova from CadastroEletronico where codEletronico=" + Id;
            dsLiberacao = bd.ConsultaSQL(str);
            if (!String.IsNullOrEmpty(dsLiberacao.Tables[0].Rows[0]["dtprova"].ToString()))
            {
                d1 = Convert.ToDateTime(dsLiberacao.Tables[0].Rows[0]["dtprova"]);
                if (dtCadastro <= d1)
                {
                    Session.Add("penalizado", "1");
                    Response.Redirect("info.aspx?Id=" + Id);
                }
                else
                {
                    str = "update CadastroEletronico set dtprova = NULL where codEletronico=" + Id;
                    bd.ExecutarSQL(str);
                }
            }

        }
        str = "select nome,cpf,faculdadeID from CadastroEletronico where codEletronico=" + Id;
        DataSet dsDados = bd.ConsultaSQL(str);
        Session.Add("dsDados", dsDados);

        DataSet dsFaculdade = bd.ConsultaSQL("select tipoVestibularID from vFaculdade where faculdadeId=" + dsDados.Tables[0].Rows[0]["faculdadeID"].ToString());
        faculdadeID = dsDados.Tables[0].Rows[0]["faculdadeID"].ToString();
        Session.Add("faculdadeID", faculdadeID);

        tipoVestibularID = dsFaculdade.Tables[0].Rows[0]["tipoVestibularID"].ToString();

        Session.Add("tipoVestibularID", tipoVestibularID);    
        
        str = "select * from vRegrasIes where ies=" + dsDados.Tables[0].Rows[0]["faculdadeId"].ToString()  + " order by regrasIES";
        ds = bd.ConsultaSQL(str);
        Session.Add("ds", ds);


    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {

        
        if (tipoVestibularID == "1")
        {
            Response.Redirect("redacao.aspx?id=" + Id);
        }
        if (tipoVestibularID == "2")
        {
            Response.Redirect("prova.aspx");
        }
        if (tipoVestibularID == "3")
        {
            Response.Redirect("vestibular.aspx?Id=" + Id);
        }

    }
}