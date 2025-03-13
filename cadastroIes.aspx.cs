using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data;
using System.Text.RegularExpressions;
public partial class cadastroIes : System.Web.UI.Page
{
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        cadastrar();
    }

    public void cadastrar()
    {

         
        string str="";
        DataSet ds;

        int campus = 0;
        if (Request["chkCampus"] == "false")
        {
            campus = 0;
        }
        else
        {
            campus = 1;
        }


        str = "insert into vCadastroIes (nome,telefone,whatsApp,site,emailcontato) values ('"
                + Request["inputNome"].ToString().ToUpper() + "','" + Request["inputTelefone"].ToString().ToLower().Trim() + "','"
                + Request["inputCelular"] + "','" + Request["inputSite"] + "','" + Request["inputEmail"] + "')";  
                str = RemoverAcentos(str);

            bd.ExecutarSQL(str);
            Response.Redirect("sucesso.aspx"); 
        

    }


    public string RemoverAcentos(string input)
    {
        if (string.IsNullOrEmpty(input))
            return "";
        else
        {
            byte[] bytes = System.Text.Encoding.GetEncoding("iso-8859-8").GetBytes(input);
            return System.Text.Encoding.UTF8.GetString(bytes);
        }
    }


}




