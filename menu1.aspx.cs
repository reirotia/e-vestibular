using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD;
public partial class menu : System.Web.UI.Page
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "select c.codEletronico, c.nome, c.cpf,tp.Processo,s.[status] ,c.nomeArquivo   from CadastroEletronico c inner join vProcesso2 tp on c.tipoIngresso = tp.tipoProcessoID" 
        + " inner join vstatus s on s.statusnum=c.statusnum order by c.nome";
        ds = bd.ConsultaSQL (str);
        Session.Add("ds",ds);

        
    }
}