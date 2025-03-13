using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD;
using System.Collections;
using System.Net;
using System.Net.Mail;
public partial class _redacao : System.Web.UI.Page
{
    ManipulacaoBanco bd = new ManipulacaoBanco();
    DataSet dsQuestao, ds, dsResposta, questao, dsRedacao, dsLiberacao;

    string str = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime dtCadastro = DateTime.Now;
        DateTime d1;

       

        if (Request["codEletronico"] != null)
        {
            Session.Add("codEletronico", Request["codEletronico"]);
        }

        if (Session["codEletronico"] == null)
        {
            Response.Redirect("singin.aspx");
        }
        else
        {

            str = "select dtProvafinalizada,faculdadeId from CadastroEletronico where codEletronico=" + Session["codEletronico"];
            dsLiberacao = bd.ConsultaSQL(str);
            Session.Add("faculdadeId", dsLiberacao.Tables[0].Rows[0]["faculdadeId"].ToString()); 
            if (!String.IsNullOrEmpty(dsLiberacao.Tables[0].Rows[0]["dtProvafinalizada"].ToString()))
            {
                Response.Redirect("finalizar.aspx");
                return;
            }



            str = "select dtprova from CadastroEletronico where codEletronico=" + Session["codEletronico"];
            dsLiberacao = bd.ConsultaSQL(str);
            if (!String.IsNullOrEmpty(dsLiberacao.Tables[0].Rows[0]["dtprova"].ToString()))
            {
                d1 = Convert.ToDateTime(dsLiberacao.Tables[0].Rows[0]["dtprova"]);
                if (dtCadastro <= d1)
                {
                    Session.Add("penalizado", "1");
                    Response.Redirect("info.aspx");
                }
                else
                {
                    str = "update CadastroEletronico set dtprova = NULL where codEletronico=" + Session["codEletronico"];
                    bd.ExecutarSQL(str);
                }
            }



        }

        string vQuestoes = questoes();

        ds = bd.ConsultaSQL("select * from vpergunta where [cod-Pergunta] in (" + vQuestoes + ") order by [tipo-prova]");
        dsResposta = bd.ConsultaSQL("select * from vresposta where [cod-Pergunta] in (" + vQuestoes + ")");

        Session.Add("ds", ds);

        Session.Add("dsResposta", dsResposta);
    }


    public string questoes()
    {
        ArrayList questoes = new ArrayList();
        string query = "";
        dsQuestao = bd.ConsultaSQL("select [tipo-prova],min([numeroQuestao]) as mini ,max([numeroQuestao]) as maxi from vpergunta where [tipo-prova]=8 group by [tipo-prova] order by [tipo-prova]");
        Random x1 = new Random();
        int y1 = x1.Next(Convert.ToInt32(dsQuestao.Tables[0].Rows[0]["mini"]), Convert.ToInt32(dsQuestao.Tables[0].Rows[0]["maxi"]));
        questao = bd.ConsultaSQL("select [cod-pergunta] from vpergunta where [tipo-prova]=" + dsQuestao.Tables[0].Rows[0]["tipo-prova"].ToString() + " and "
            + "numeroQuestao=" + y1);
        
        dsRedacao = bd.ConsultaSQL("select * from vpergunta where [cod-pergunta]=" + questao.Tables[0].Rows[0][0] );
        Session.Add("dsRedacao", dsRedacao);
        return "";
        //return query.Substring(0, query.Length - 1);
    }
    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        str = "insert into vestibularEletronico (redacao,codEletronico) values ('"
            + Request["textarea"].ToString().Replace("'"," ").Replace(","," ")    + "'," + Session["codEletronico"] + ")";

        bd.ExecutarSQL(str);
             DateTime dtCadastro = DateTime.Now;



             str = "update CadastroEletronico set dtProvafinalizada='" + dtCadastro.ToString("yyyy/dd/MM hh:mm:ss")
                 + "',statusnum=3 where codEletronico=" + Session["codEletronico"];
             bd.ExecutarSQL(str);
             DataSet ds = bd.ConsultaSQL("select nome,cpf,faculdadeID,email,tipoIngresso from CadastroEletronico where codEletronico=" + Session["codEletronico"]);
        string nome = ds.Tables[0].Rows[0]["nome"].ToString();
        string assunto = "PROVA CONCLUÍDA COM SUCESSO";
        string semestre = "2025.2";
        string faculdadeID =  ds.Tables[0].Rows[0]["faculdadeID"].ToString() + ".png";
        string cpf = ds.Tables[0].Rows[0]["cpf"].ToString();
        string email = ds.Tables[0].Rows[0]["email"].ToString();
        Session.Add("formaIngresso", ds.Tables[0].Rows[0]["tipoIngresso"].ToString());


        //COMENTADO PARA TESTE DIA 03/09/2022 
        //EnviarContatoPorEmail(nome, assunto, semestre, faculdadeID, cpf, email, dtCadastro.ToString("yyyy/dd/MM hh:mm:ss"));    
        Response.Redirect("finalizar.aspx");
    }


    public static void EnviarContatoPorEmail(string nome,  string assunto, string semestre, string clienteLogo,  string cpf, string email,string fim  )
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
        + semestre + " </h2><p></p><img src=\"https://evestibular.com.br/assets/img/logo/" + clienteLogo + "\" width=\"200px\"\"/><p></p> <h3>PROVA CONCLUÍDA COM SUCESSO</h3>"
        + "<div style=\"text-align: justify; padding-top: 30px;\">"
        + "<p><strong> NOME DO CANDIDATO(A): </strong>  " + nome + " </p> <p><strong> CPF: </strong>" + cpf + "<p> <strong> DATA DA FINALIZAÇÃO DA PROVA: </strong>"
        + fim + "</p> <p><strong>LINK DE ACOMPANHAMENTO DO RESULTADO: </strong> https://www.evestibular.com.br/singin.aspx</p>"

        

        + " </div> <div style=\"text-align: center; padding-top: 100px;\"> <p>e-vestibular tecnologia em aplicação de provas</p> "
        + "<p>sac@evestibular.com.br</p> </div> </div> </div> </div> </body> </html> ";
        MailMessage mensagem = new MailMessage();
        mensagem.From = new MailAddress("sac@evestibular.com.br");
        mensagem.To.Add(email.ToLower());
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

}