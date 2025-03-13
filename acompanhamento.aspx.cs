using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD;
public partial class acompanhamento : System.Web.UI.Page
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    string Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["Id"];

        string str = "select TipoProva1,TipoProva4,TipoProva8 ,STATUSRED,STATUSOBJ,respostaPergunta , c.codEletronico,nome,cpf,dtinscricao,dtProvaFinalizada "
        + " from vestibularEletronico v inner join  CadastroEletronico c on v.codEletronico=c.codEletronico where c.codEletronico=" + Id;
        ds = bd.ConsultaSQL (str);
        Session.Add("ds",ds);

        
    }
}