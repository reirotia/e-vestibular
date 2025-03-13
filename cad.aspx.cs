using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;
public partial class cad : System.Web.UI.Page
{
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {
        string faculdadeId = Request["id"].ToString();
        DataSet dsCurso = bd.ConsultaSQL("select * from vcurso where faculdadeId=" + faculdadeId);
        Session.Add("dsCurso", dsCurso);
        DataSet dsFaculdade = bd.ConsultaSQL("select * from vFaculdade where faculdadeId=" + faculdadeId);
        Session.Add("dsFaculdade", dsFaculdade);
        DataSet dscampus = bd.ConsultaSQL("select * from vcampus where faculdadeId=" + faculdadeId);
        Session.Add("dscampus", dscampus);
  

        DataSet dsProcesso = bd.ConsultaSQL("select * from vProcesso2 where faculdadeId=" + faculdadeId);
        Session.Add("dsProcesso", dsProcesso);
        Session.Add ("pathImagem","assets/img/logo/" + faculdadeId + ".png");
        Session.Add("faculdadeId", faculdadeId);
        Session.Add("tipoVestibularID", dsFaculdade.Tables[0].Rows[0]["tipoVestibularID"]);

       

    }
    
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        
        cadastrar();
    }

    public void cadastrar()
    {

         
        string str="";
        DataSet ds;
        string cpf = String.Join("", Regex.Split(Request.Form["inputCpf"].ToString(), @"[^\d]"));
        str = "select codEletronico,dtProvafinalizada from CadastroEletronico where cpf='" + cpf + "'";
        ds = bd.ConsultaSQL(str);
        if (ds.Tables[0].Rows.Count == 0)
        {


            DateTime dtCadastro = DateTime.Now;
            //string dt =  dtCadastro.ToString("yyyy/dd/MM hh:mm:ss") 
            //string dtCadastro = "26/04/2020";


            str = "insert into CadastroEletronico (nome,cpf,faculdadeId,curso,dtInscricao,tipoIngresso,nomeArquivo,email,celular,instagram,semestre,campusId) values ('"
               + Request["inputnome"].ToString().ToUpper() + "','" + cpf + "'," + Request["inputFaculdade"] + ",'" + Request["inputCurso"] + "'"
               + ",'" + dtCadastro.ToString("yyyy/dd/MM hh:mm:ss") + "'," + Request["formaIngresso"] + ",'"
               + fileArquivo.FileName + "','" + Request["txtemail"] + "','" + Request["celular"] + "','" + Request["Instagram"] + "','2000.1'," + Request["inputCampus"] + ")";
            str = RemoverAcentos(str);

            bd.ExecutarSQLsemfechar(str);
            int COD = Convert.ToInt32(bd.RetornarIDENTITYeFechar());
            //COMENTADO PARA TESTE DIA 11/10/2023 
            //EnviarContatoPorEmail(Request["inputnome"].ToString().ToUpper(), "", "CADASTRO EVESTIBULAR CONCLUÍDO COM SUCESSO", "2025.2", Request["inputFaculdade"] + ".png", dtCadastro.ToString("yyyy/dd/MM hh:mm:ss"), cpf, Request["txtemail"], Request["textoFormaIngresso"], Request["formaIngresso"]);
            Session.Add("codEletronico", COD);
            Session.Add("formaIngresso", Request["formaIngresso"]);
            if (Request["formaIngresso"] != "1")
            {
                string caminho = AppDomain.CurrentDomain.BaseDirectory + System.Configuration.ConfigurationManager.AppSettings["caminhoArquivo"] + "\\" + COD + "_" + fileArquivo.FileName;
                fileArquivo.SaveAs(caminho);
                Response.Redirect("finalizar.aspx");
            }
            else
            {

                Response.Redirect("infoo.aspx");
            }
        }
        else
        {
            Session.Add("codEletronico", ds.Tables[0].Rows[0]["codEletronico"].ToString());
            if (ds.Tables[0].Rows[0]["dtProvafinalizada"].ToString().Length > 0)
            {
                Response.Redirect("acompanhamento.aspx");
            }

            Response.Redirect("infoo.aspx");
        }

    }

    public static void EnviarContatoPorEmail(string nome, string texto, string assunto, string semestre, string clienteLogo, string inicio, string cpf, string email, string tipoSelecao, string tipoSelecaoId)
    {

        /*
         *
         *smtp.kinghost.net
            Sem SSL/TLS
            Porta: 587
                
        Lucas Rodrigues Abreu (22:50:38) : No painel de controle, no ícone "Email SSL Personalizado e -0rta 465 para usar ssl".
            Lucas Rodrigues Abreu (22:50:45) : Depois de ativar precisa aguardar 2 horas.
             
         */
        SmtpClient smtp = new SmtpClient("smtp.uni5.net", 587);
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("sac@evestibular.com.br", "Aags1759");
        //smtp.EnableSsl = true;

        string corpoMsg = "<!DOCTYPE html> <html lang=\"en\"><head><meta charset= \"utf-8\" > <meta name= \"viewport\" content= \"width=device-width, initial-scale=1, "
        + "shrink-to-fit=no\" ><link rel= \"stylesheet\" href= \"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\">"
        + "<title>Evestibular</title>"
        + "</head> <body> <div class=\"container\"> <div class=\"form-group\"> <div style=\"text-align: left; padding-top: 100px;\">"
        + "<img src=\"https://evestibular.com.br/assets/img/logo/logo-meio-paginas-2.png\" />  <p></p><h2>Vestibular "
        + semestre + " </h2><p></p><img src=\"https://evestibular.com.br/assets/img/logo/" + clienteLogo + "\" width=\"200px\"\"/><p></p> <h3>Cadastro concluido</h3>"
        + "<div style=\"text-align: justify; padding-top: 30px;\">"
        + "<p><strong> Data da inscrição: </strong>" + inicio + " </p> <p><strong> NOME DO CANDIDATO(A): </strong>  " + nome
        + " </p> <p><strong> CPF: </strong>" + cpf + " </p> <p><strong>Tipo de Seleção: </strong>" + tipoSelecao + " </p> ";

        if (tipoSelecaoId == "1")
        {
            corpoMsg += "<p><strong>LINK DE ACESSO A PROVA ON-LINE:</strong> https://www.evestibular.com.br/singin.aspx </p>";
        }
        else
        {
            corpoMsg += "<p><strong>LINK DE ACOMPANHAMENTO DO RESULTADO: </strong> https://www.evestibular.com.br/singin.aspx </p>";

        }

        corpoMsg += " </div> <div style=\"text-align: center; padding-top: 100px;\"> <p>e-vestibular tecnologia em aplicação de provas</p> "
        + "<p>sac@evestibular.com.br</p> </div> </div> </div> </div> </body> </html> ";
        MailMessage mensagem = new MailMessage();
        mensagem.From = new MailAddress("sac@evestibular.com.br");
        mensagem.To.Add(email.ToLower() );
        mensagem.Subject = assunto;
        mensagem.Body = corpoMsg;

        mensagem.IsBodyHtml = true;
        try
        {
        
            //comentário para teste de cadastro 06/09/2022
        //smtp.Send(mensagem);
            }
        catch (Exception ex)
        {
        }
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




