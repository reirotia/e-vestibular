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
    string semestre;
    protected void Page_Load(object sender, EventArgs e)
    {
        ds = bd.ConsultaSQL("select processo from tb_processo where btAtivo=1");
        semestre = ds.Tables[0].Rows[0][0].ToString();
        string str = "select c.codEletronico, c.nome, c.cpf,tp.Processo,s.[status] ,c.nomeArquivo,c.celular,c.email   from CadastroEletronico c inner join " 
        + "vProcesso2 tp on c.tipoIngresso = tp.tipoProcessoID inner join vstatus s on s.statusnum=c.statusnum where c.faculdadeid="
        + Session["faculdadeId"] + " and c.semestre='" + semestre + "'" + " order by c.codEletronico desc";
        ds = bd.ConsultaSQL(str);
        Session.Add("ds", ds);
        carregarCampus();
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        semestre = Request.Form["semestre"].ToString();
        string nome = Request.Form["inputNome"].ToString();
        string campus = Request.Form["selCampus"].ToString();
        string str = "";
        if (!String.IsNullOrEmpty(campus))
        {
            str = "select c.codEletronico, c.nome, c.cpf,tp.Processo,s.[status] ,c.nomeArquivo,c.celular,c.email "
            + " from CadastroEletronico c inner join vProcesso2 tp on c.tipoIngresso = tp.tipoProcessoID inner join "
            + " vstatus s on s.statusnum=c.statusnum left join vCampus ca on ca.campusID = c.campusId where c.faculdadeid=" + Session["faculdadeId"] + " and c.semestre='"
            + semestre + "' and c.nome like '%" + nome + "%' and ca.campusId=" + campus + " order by c.codEletronico desc";
        }
        else
        {
            str = "select c.codEletronico, c.nome, c.cpf,tp.Processo,s.[status] ,c.nomeArquivo,c.celular,c.email "
            + " from CadastroEletronico c inner join vProcesso2 tp on c.tipoIngresso = tp.tipoProcessoID inner join "
            + " vstatus s on s.statusnum=c.statusnum left join vCampus ca on ca.campusID = c.campusId where c.faculdadeid=" + Session["faculdadeId"] + " and c.semestre='"
            + semestre + "' and c.nome like '%" + nome + "%'  order by c.codEletronico desc";
        }
        ds = bd.ConsultaSQL(str);
        Session.Add("ds", ds);
    }
    protected void carregarCampus()
    {
        string str = "select campusID, campus from vcampus where faculdadeid=" + Session["faculdadeId"];
        DataSet  dsCampus = bd.ConsultaSQL(str);
        Session.Add("dsCampus", dsCampus); 
    }
    
}