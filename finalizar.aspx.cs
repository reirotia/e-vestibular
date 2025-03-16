using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD;
using System.Net;
using System.Net.Mail;
public partial class finalizar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DateTime dtCadastro = DateTime.Now;
        DataSet ds = new DataSet();
        ManipulacaoBanco bd = new ManipulacaoBanco();
        string str = "";
        string Id = Request["id"].ToString();
        if (Id!= null)
        {
            if (Session["penalizado"] == null)
            {
                str = "update CadastroEletronico set dtProvafinalizada = '" + dtCadastro.ToString("yyyy/dd/MM hh:mm:ss") + "' where codEletronico="
                    + Id;
                if (bd.ExecutarSQL(str))
                {
                    str = "select * from  vMensagemTipoIngresso  where tipoIngressoId=" + Session["formaIngresso"] + " order by mensagemID ";
                    ds = bd.ConsultaSQL(str);
                    Session.Add("ds", ds);
                
                }
            }
        }
        else
        {
            Response.Redirect("singin.aspx");
        }


    }

    public static void EnviarContatoPorEmail(string nome, string texto, string email, string assunto, string semestre, string clienteLogo, string inicio,
        string fim, string gravavao, string cpf, string obj, string redacao, string situacao, string escore)
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
        + "shrink-to-fit=no\" ><link rel= \"stylesheet\" href= \"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\""
        + "integrity= \"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin= \"anonymous\" ><title>Evestibular</title>"
        + "<script src= \"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity= \"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\""
        + "crossorigin= \"anonymous\" ></script> <script src= \"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity= \""
        + "sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin= \"anonymous\" > </script> <script src= \""
        + "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\" integrity= \"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\""
        + " crossorigin= \"anonymous\" ></script> </head> <body> <div class=\"container\"> <div class=\"form-group\"> <div style=\"text-align: center; padding-top: 100px;\">"
        + "<img src=\"https://evestibular.com.br/assets/img/logo/logo-meio-paginas-2.png\" /> <p></p> <h2>Boletim de desempenho</h2><p></p> <h2>Vestibular "
        + semestre + " </h2><p></p><img src=\"https://evestibular.com.br/assets/img/logo/" + clienteLogo + "\"/><p></p> <h3>O candidato participou do evestibular On-line</h3>"
        + "<div style=\"text-align: justify; padding-top: 30px;\"> <h4>Data e hora do início de Vestibular On-line: " + inicio + " </h4> <h4>Data e hora do fim do Vestibular "
        + "On-line: " + fim + " </h4> <h4>Gravação da Prova: " + gravavao + " </h4><p></p> <h4>NOME DO CANDIDATO(A): " + nome + " </h4> <h4>CPF: " + cpf + " </h4> "
        + "<h4>NOTA DA PROVA OBJETIVA: " + obj + "</h4> <h4>NOTA DA PROVA SUBJETIVA(REDAÇÃO): " + redacao + "</h4> <h4>SITUAÇÃO DO CANDIDATO(A): " + situacao + " </h4> "
        + "<h4>ESCORE GLOBAL: " + escore + "</h4> </div> <div style=\"text-align: center; padding-top: 100px;\"> <p>e-vestibular tecnologia em aplicação de provas</p> "
        + "<p>sac@evestibular.com.br</p> </div> </div> </div> </div> </body> </html> ";
        MailMessage mensagem = new MailMessage();
        mensagem.From = new MailAddress("sac@evestibular.com.br");
        mensagem.To.Add(email.ToUpper());
        mensagem.Subject = assunto;
        mensagem.Body = corpoMsg;

        mensagem.IsBodyHtml = true;
        //comentário para teste de cadastro 06/09/2022
        //smtp.Send(mensagem);
    }

}