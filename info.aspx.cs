using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;

public partial class info : System.Web.UI.Page
{
    string str = "";
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime dtCadastro = DateTime.Now;


        if (Session["codEletronico"] != null)
        {
            if (Session["penalizado"] == null)
            {
                str = "update CadastroEletronico set dtprova = '" + dtCadastro.AddDays(1).ToString("yyyy/dd/MM hh:mm:ss") + "' where codEletronico="
                    + Session["codEletronico"];
                bd.ExecutarSQL(str);
            }
        }
        else
        {
            Response.Redirect("singin.aspx");
        }
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        
    }
}