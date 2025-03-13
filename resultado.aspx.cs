using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD; 

public partial class resultado : System.Web.UI.Page
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    string Id;
    protected void Page_Load(object sender, EventArgs e)
    {

        Id = Request["Id"];
        

        string str = "select TipoProva1,TipoProva4,TipoProva8 ,STATUSRED,STATUSOBJ,respostaPergunta,c.codEletronico,nome,cpf,dtinscricao,dtProvaFinalizada, "
      + "c.faculdadeid,f.btMatricula,f.dsLink from vestibularEletronico v inner join  CadastroEletronico c on v.codEletronico=c.codEletronico inner join vfaculdade f on f.faculdadeId="
      + " c.faculdadeID  where c.codEletronico=" + Id;
        ds = bd.ConsultaSQL(str);
        Session.Add("codEletronico", Id);
        Session.Add("faculdadeId",ds.Tables[0].Rows[0]["faculdadeId"].ToString()); 
        Session.Add("ds", ds);

        
    }
}