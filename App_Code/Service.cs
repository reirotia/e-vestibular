using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using CAD;
using System.Collections;
using System.Net;
using System.Net.Mail;
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]

public class Service : System.Web.Services.WebService
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    public Service()
    {


        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld(string ok)
    {
        return "Hello World";
    }

    [WebMethod]
    public string MensagemTipoVestibular(string mensagemID, string faculdadeID)
    {
        if (mensagemID != "0")
        {
            string str = "select [mensagemTipoVestibular] from  [mensagemTipoVestibular] where [tipoVestibular]=" + mensagemID
            + " and faculdadeID=" + faculdadeID;
            ds = bd.ConsultaSQL(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0][0].ToString();
            }
        }
        return "";
    }

    [WebMethod]
    public string cursoCampus(string campusId)
    {
        string sql = "select cursoID,curso from vCurso where campusQuery='" + campusId + "'";
        ds = bd.ConsultaSQL(sql);
        string html = ""; 
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            html += "<option value="+ ds.Tables[0].Rows[i]["cursoID"].ToString() +">"
                + ds.Tables[0].Rows[i]["curso"].ToString() + "</option>"; 
        }
            return html;
    }


    [WebMethod]
    public string wsIndeferir(string cpf, string faculdadeID)
    {
        string html = "";
        string str = "update CadastroEletronico set statusnum=2 where cpf='" + cpf + "' and faculdadeID=" + faculdadeID;
        bd.ExecutarSQL(str);
        str = "select c.codEletronico, c.nome, c.cpf,tp.Processo,s.[status] ,c.nomeArquivo,c.celular,c.email   from CadastroEletronico c inner join "
        + "vProcesso2 tp on c.tipoIngresso = tp.tipoProcessoID inner join vstatus s on s.statusnum=c.statusnum where c.faculdadeid=" + faculdadeID
        + " and c.cpf='" + cpf + "'";
        ds = bd.ConsultaSQL(str);

        html = "<td>" + ds.Tables[0].Rows[0]["nome"] + "</td> <td>" + ds.Tables[0].Rows[0]["cpf"] + "</td> <td>" + ds.Tables[0].Rows[0]["celular"]
            + "</td> <td>" + ds.Tables[0].Rows[0]["email"] + "</td> <td>" + ds.Tables[0].Rows[0]["processo"] + "</td> <td >" + ds.Tables[0].Rows[0]["status"]
            + "</td><td><button type=\"button\" class=\"btn btn-success btn-xs btn-flat\" onclick=\"aprovar('" + cpf + "')\">Aprovar</button>"
            + "</td> <td> <button type=\"button\" class=\"btn btn-danger btn-xs btn-flat\" onclick=\"indeferir('" + cpf + "')\">Indeferir</button> </td>";



        return html;
    }
    [WebMethod]
    public string wsAprovar(string cpf, string faculdadeID)
    {
        string html = "";
        string str = "update CadastroEletronico set statusnum=1 where cpf='" + cpf + "' and faculdadeID=" + faculdadeID;
        bd.ExecutarSQL(str);
        str = "select c.codEletronico, c.nome, c.cpf,tp.Processo,s.[status] ,c.nomeArquivo,c.celular,c.email   from CadastroEletronico c inner join "
        + "vProcesso2 tp on c.tipoIngresso = tp.tipoProcessoID inner join vstatus s on s.statusnum=c.statusnum where c.faculdadeid=" + faculdadeID
        + " and c.cpf='" + cpf + "'";
        ds = bd.ConsultaSQL(str);

        html = "<td>" + ds.Tables[0].Rows[0]["nome"] + "</td> <td>" + ds.Tables[0].Rows[0]["cpf"] + "</td> <td>" + ds.Tables[0].Rows[0]["celular"]
            + "</td> <td>" + ds.Tables[0].Rows[0]["email"] + "</td> <td>" + ds.Tables[0].Rows[0]["processo"] + "</td> <td >" + ds.Tables[0].Rows[0]["status"]
            + "</td><td><button type=\"button\" class=\"btn btn-success btn-xs btn-flat\" onclick=\"aprovar('" + cpf + "')\">Aprovar</button>"
            + "</td> <td> <button type=\"button\" class=\"btn btn-danger btn-xs btn-flat\" onclick=\"indeferir('" + cpf + "')\">Indeferir</button> </td>";



        return html;
    }


    public string montarQuestao(string faculdadeID)
    {
        DataSet dsQuestao, questao, dsRedacao;

        ArrayList questoes = new ArrayList();
        dsQuestao = bd.ConsultaSQL("select tipoProvaID,minimo,maximo,qtdQuestao from vQuestoes  where faculdadeID=" + faculdadeID);
        string query = "";
        for (int i = 0; i < dsQuestao.Tables[0].Rows.Count; i++)
        {
            for (int z = 0; z < Convert.ToInt32(dsQuestao.Tables[0].Rows[i]["qtdQuestao"]); z++)
            {
                Random x = new Random();
                int y = x.Next(Convert.ToInt32(dsQuestao.Tables[0].Rows[i]["minimo"]), Convert.ToInt32(dsQuestao.Tables[0].Rows[i]["maximo"]));
                questao = bd.ConsultaSQL("select [cod-pergunta] from vpergunta where [tipo-prova]=" + dsQuestao.Tables[0].Rows[i]["tipoProvaID"].ToString() + " and "
                    + "numeroQuestao=" + y);
                if (questao.Tables[0].Rows.Count == 0)
                {
                    string teste = "select [cod-pergunta] from vpergunta where [tipo-prova]=" + dsQuestao.Tables[0].Rows[i]["tipoProvaID"].ToString() + " and "
                    + "numeroQuestao=" + y;
                }
                if (!questoes.Contains(Convert.ToInt32(questao.Tables[0].Rows[0][0])))
                {
                    questoes.Add(Convert.ToInt32(questao.Tables[0].Rows[0][0]));
                }
                else
                {
                    z--;
                }
            }

        }
        foreach (int c in questoes)
        {
            query = query + c.ToString() + ",";
        }
        dsQuestao = bd.ConsultaSQL("select [tipo-prova],min([numeroQuestao]) as mini ,max([numeroQuestao]) as maxi from vpergunta where [tipo-prova]=8 group by [tipo-prova] order by [tipo-prova]");


        Random x1 = new Random();
        int y1 = x1.Next(Convert.ToInt32(dsQuestao.Tables[0].Rows[0]["mini"]), Convert.ToInt32(dsQuestao.Tables[0].Rows[0]["maxi"]));
        questao = bd.ConsultaSQL("select [cod-pergunta] from vpergunta where [tipo-prova]=" + dsQuestao.Tables[0].Rows[0]["tipo-prova"].ToString() + " and "
            + "numeroQuestao=" + y1);

        dsRedacao = bd.ConsultaSQL("select * from vpergunta where [cod-pergunta]=" + questao.Tables[0].Rows[0][0]);
        // Session.Add("dsRedacao", dsRedacao);
        return query.Substring(0, query.Length - 1);
    }

    [WebMethod]
    public string questoes(string faculdadeID)
    {


        string html = "";
        int quest = 0;
        string link = "";
        for (int i = 0; i < 20; i++)
        {
            quest = i + 1;
            link = "#step-" + quest;

            if (quest == 1)
            {
                html += "<div class=\"stepwizard-step col-xs-1\"><a href=\"#step-1\" type=\"button\" class=\"btn btn-success btn-circle\">1</a>"
                 + "<p></p> </div>";
            }
            else
            {
                html += "  <div class=\"stepwizard-step col-xs-1\"><a href=\"" + link + "\" type=\"button\" class=\"btn btn-default btn-circle\" onclick=\"step(" + quest + ");\""
                    + "disabled=\"disabled\">" + quest + "</a><p></p></div>";
            }
        }

        html += "<div class=\"stepwizard-step col-xs-1\"><a href=\"#step-21\" type=\"button\" class=\"btn btn-default\" onclick=\"step(21);\" disabled=\"disabled\">"
        + "Redação</a><p></p></div>";
        return html;
    }

    [WebMethod]
    public string resposta(string faculdadeID)
    {
        string html = "";
        string vQuestoes = montarQuestao(faculdadeID);
        DataSet dsResposta;
        ds = bd.ConsultaSQL("select * from vpergunta where [cod-Pergunta] in (" + vQuestoes + ") order by [tipo-prova]");
        dsResposta = bd.ConsultaSQL("select * from vresposta where [cod-Pergunta] in (" + vQuestoes + ")");

        int quest = 0;
        string link = "";


        for (int i = 0; i < dsResposta.Tables[0].Rows.Count; i++)
        {
            quest = i + 1;
            link = "step-" + quest;
            html += "<div class=\"panel panel-primary setup-content\" id=\"" + link + " \"><div class=\"panel-heading\" style=\"text-align: center\">"
                + "<span class=\"form-group\">Tempo restante<p class=\"form-group\"></p></div><div class=\"panel-heading\">"
                + "<h3 class=\"panel-title\">" + quest + " - " + ds.Tables[0].Rows[i]["pergunta"].ToString() + "</h3></div>";
            if (ds.Tables[0].Rows[i]["img"].ToString() != "0")
            {
                string img = "img/" + ds.Tables[0].Rows[i]["img"].ToString() + ".png";
                html += "<div style=\"text-align: center; overflow: auto; height: 230px\"><img src=\" " + img + "\" /></div>";
            }
            html += "<div class=\"panel-body\"> <div class=\"form-group\"> <div class=\"radio\"><fieldset id=\"Fieldset2\">";
            dsResposta = bd.ConsultaSQL("select * from vresposta where [cod-pergunta]=" + ds.Tables[0].Rows[i]["cod-pergunta"].ToString());
            for (int x = 0; x < dsResposta.Tables[0].Rows.Count; x++)
            {
                html += "<div class=\"form-group\"><label class=\"radio\">";
                string rd = "rd" + x;
                html += "<input type=\"radio\" name=\" " + rd + "\" id=\"" + dsResposta.Tables[0].Rows[x]["respostaCod"].ToString() + " \""
                + "value=\" " + dsResposta.Tables[0].Rows[x]["respostaCod"].ToString() + " \" onchange=\" valor2(" + quest + "," + dsResposta.Tables[0].Rows[i]["respostaCod"].ToString() + "," + ds.Tables[0].Rows[i]["cod-pergunta"].ToString() + ")> <" + dsResposta.Tables[0].Rows[x]["resposta"].ToString()
                + "</label></div>";
            }
            string ques = "ques" + quest;
            html += "<input id=\" " + quest + "\" name=\"" + ques + "\" maxlength=\"200\" style=\"display: none\" type=\"text\" required=\"required\""
            + "class=\"form-control\" placeholder=\"Enter Company Name\" /></fieldset></div></div>";
            if (i < 20)
            {

                html += "<button class=\"btn btn-primary nextBtn pull-right\" type=\"button\">Avançar</button>";
            }
            html += "</div></div>";

        }

        return html;
    }

    [WebMethod]
    public string Processamento()
    {
        int countTipo1 = 0;
        int countTipo4 = 0;
        int questao = 0;
        DataSet dsResposta;
        DataSet dsEmail;
        string str = "select evestibularcod,respostaPergunta,redacao,codeletronico from vestibularEletronico where tipoProva1 is null and respostaPergunta is not null";
        ds = bd.ConsultaSQL(str);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            countTipo1 = 0;
            countTipo4 = 0;
            string[] respostaPerguntas = ds.Tables[0].Rows[i]["respostaPergunta"].ToString().Split(new char[] { '|' });
            foreach (string respostaPergunta in respostaPerguntas)
            {
                questao += 1;
                if (respostaPergunta != "")
                {
                    string[] partes = respostaPergunta.Split(new char[] { '-' });
                    str = "select gabarito from  vResposta where [cod-pergunta]=" + partes[1] + " and respostaCod=" + partes[0];
                    dsResposta = bd.ConsultaSQL(str);
                    if (dsResposta.Tables[0].Rows[0]["gabarito"].ToString() == "1")
                    {
                        if (questao < 11)
                        {
                            countTipo1 += 1;
                        }
                        else
                        {
                            countTipo4 += 1;
                        }
                    }
                }

            }
            countTipo1 = countTipo1 * 200;
            countTipo4 = countTipo4 * 200;
            if (ds.Tables[0].Rows[i]["redacao"].ToString().Length == 0)
            {
                if ((countTipo1 + countTipo4) == 0)
                {
                    bd.ExecutarSQL("update CadastroEletronico set statusnum=2 where codeletronico=" + ds.Tables[0].Rows[i]["codeletronico"]);
                }
                else
                {
                    bd.ExecutarSQL("update CadastroEletronico set statusnum=1 where codeletronico=" + ds.Tables[0].Rows[i]["codeletronico"]);
                }
            }

            bd.ExecutarSQL("update vestibularEletronico set tipoProva1=" + countTipo1 + ",tipoProva4=" + countTipo4 + ",statusobj=1,provaCompleta=1 where evestibularCod="
                + ds.Tables[0].Rows[i]["evestibularCod"].ToString());
            dsEmail = bd.ConsultaSQL("select * from CadastroEletronico where codeletronico=" + ds.Tables[0].Rows[i]["codeletronico"]);
            if (dsEmail.Tables[0].Rows[0]["email"].ToString().ToString().Length > 0)
            {
                // COMENTADO PARA TESTE DIA 03/09/2022
                //EnviarContatoPorEmail(dsEmail.Tables[0].Rows[0]["nome"].ToString(), "", "Processo seletivo", "Vestibular 2024.1",
                //dsEmail.Tables[0].Rows[0]["faculadeID"] + ".png", "", dsEmail.Tables[0].Rows[0]["cpf"].ToString(), dsEmail.Tables[0].Rows[0]["email"].ToString(), "", "");
                /*
                EnviarContatoPorEmail(dsEmail.Tables[0].Rows[0]["nome"].ToString(), "", "Processo seletivo", "Vestibular 2024.1",
                  dsEmail.Tables[0].Rows[0]["faculdadeID"] + ".png", "", dsEmail.Tables[0].Rows[0]["cpf"].ToString(), "glauberty@fsssacramento.br", "", "");
                EnviarContatoPorEmail(dsEmail.Tables[0].Rows[0]["nome"].ToString(), "", "Processo seletivo", "Vestibular 2024.1",
                  dsEmail.Tables[0].Rows[0]["faculdadeID"] + ".png", "", dsEmail.Tables[0].Rows[0]["cpf"].ToString(), "informatica@fsssacramento.br", "", "");
                */   
            }
        }

        return "ok";
    }
    public static void EnviarContatoPorEmail(string nome, string texto, string assunto, string semestre, string clienteLogo, string inicio, string cpf, string email, string tipoSelecao, string tipoSelecaoId)
    {


        SmtpClient smtp = new SmtpClient("smtp.uni5.net", 587);
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("sac@evestibular.com.br", "Aags1759");
        //smtp.EnableSsl = true;

        DateTime dtCadastro = DateTime.Now;

        string corpoMsg = "<!DOCTYPE html> <html lang=\"en\"><head><meta charset= \"utf-8\" > <meta name= \"viewport\" content= \"width=device-width, initial-scale=1, "
        + "shrink-to-fit=no\" ><link rel= \"stylesheet\" href= \"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\">"
        + "<title>Evestibular</title>"
        + "</head> <body> <div class=\"container\"> <div class=\"form-group\"> <div style=\"text-align: left; padding-top: 100px;\">"

        + "<h3>" + semestre + "</h3> </h2><p></p><img src=\"https://evestibular.com.br/assets/img/logo/" + clienteLogo + "\" width=\"200px\"\"/><p></p> "
        + "<div style=\"text-align: justify; padding-top: 30px;\">"
        + "<p>Resultado disponibilizado </p> <p><strong> NOME DO CANDIDATO(A): </strong>  " + nome
        + " </p> <p><strong> CPF: </strong>" + cpf + " </p> <p><strong>Data de finalização da prova: </strong>" + dtCadastro.ToString("dd/MM/yyyy hh:mm:ss") + " </p> ";



        corpoMsg += "<p><strong>LINK DE ACOMPANHAMENTO DO RESULTADO: </strong> https://www.evestibular.com.br/singin.aspx </p>";



        corpoMsg += " </div> <div style=\"text-align: center; padding-top: 100px;\"> <p>e-vestibular tecnologia em aplicação de provas</p> "
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