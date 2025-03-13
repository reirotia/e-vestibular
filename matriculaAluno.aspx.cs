using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data;

public partial class matriculaAluno : System.Web.UI.Page
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {
        VerificarUpdatePanel();
        ds = bd.ConsultaSQL("select sigla from vfaculdade where faculdadeId=" + Session["faculdadeId"].ToString());
        Session.Add("sigla", ds.Tables[0].Rows[0]["sigla"].ToString());
        Session.Add("logo", "assets/img/logo/" + Session["faculdadeId"].ToString() + ".png");
        string str = "select codEletronico,nome,cpf from CadastroEletronico where codEletronico=" + Session["codEletronico"];
        ds = bd.ConsultaSQL(str);
        Session.Add("nome", ds.Tables[0].Rows[0]["nome"]);
        Session.Add("cpf", ds.Tables[0].Rows[0]["cpf"]);

        
    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        string COD = ds.Tables[0].Rows[0]["codEletronico"].ToString();
        string caminho = AppDomain.CurrentDomain.BaseDirectory + System.Configuration.ConfigurationManager.AppSettings["caminhoArquivo"] + "\\Matricula\\"; 
        string caminhoRG = caminho   + "RG\\" +  COD + "_" + fileRG.FileName;
        fileRG.SaveAs(caminhoRG);
        string caminhoCpf  = caminho + "CPF\\" + COD + "_" + filecpf.FileName;
        fileRG.SaveAs(caminhoCpf);
        string caminhoTituloEleitor = caminho + "TituloEleitor\\" + COD + "_" + fileTituloEleitor.FileName;
        fileTituloEleitor.SaveAs(caminhoTituloEleitor);

        string caminhoCarteiraReservista = caminho + "CarteiraReservista\\" + COD + "_" + fileCarteiraReservista.FileName;
        fileCarteiraReservista.SaveAs(caminhoCarteiraReservista);
        string ComprovanteResidencia = caminho + "ComprovanteResidencia\\" + COD + "_" + fileComprovanteResidencia.FileName;
        fileComprovanteResidencia.SaveAs(ComprovanteResidencia);

        string caminhofileCertidaoNascimento = caminho + "fileCertidaoNascimento\\" + COD + "_" + fileCertidaoNascimento.FileName;
        fileCertidaoNascimento.SaveAs(caminhofileCertidaoNascimento);

        string caminhofileHistorico = caminho + "CarteiraReservista\\" + COD + "_" + fileHistorico.FileName;
        fileHistorico.SaveAs(caminhofileHistorico);

        string caminhofileFoto = caminho + "foto\\" + COD + "_" + fileFoto.FileName;
        fileFoto.SaveAs(caminhofileFoto);

        string caminhofileContrato = caminho + "Contrato\\" + COD + "_" + fileContrato.FileName;
        fileContrato.SaveAs(caminhofileContrato);
        string caminhofileBolsa = caminho + "Bolsa\\" + COD + "_" + fileBolsa.FileName;
        fileBolsa.SaveAs(caminhofileBolsa);


    }
    private void VerificarUpdatePanel()
    {
        var scriptManager = ScriptManager.GetCurrent(Page); if (scriptManager != null) scriptManager.RegisterPostBackControl(btnEnviar);
        fplImagem.Attributes.Add("OnClick", "javascript:document.forms[0].encoding='multipart/form-data';");
    }
}