using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using System.Data.OleDb;
using System.Data;
public partial class importarExecel : System.Web.UI.Page
{
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string con = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\backup\perguntas.xls;Extended Properties='Excel 8.0;HDR=Yes;'";
        using (OleDbConnection connection = new OleDbConnection(con))
        {
            connection.Open();
            OleDbCommand command = new OleDbCommand("select * from [Plan1$]", connection);
            using (OleDbDataReader dr = command.ExecuteReader())
            {
                while (dr.Read())
                {
                    string str = "";
                    DataSet ds;
                    string t;
                    int cod = 0;
                    int tipo = 0;
                    int area = 0;
                    int assunto = 0;
                    int img = 0;
                    int texto = 0;
                    if (!String.IsNullOrEmpty(dr[0].ToString()))
                    {
                        cod = Convert.ToInt32(dr[0]);
                    }
                    if (!String.IsNullOrEmpty(dr[1].ToString()))
                    {
                        tipo = Convert.ToInt32(dr[1]);
                    }
                    if (!String.IsNullOrEmpty(dr[2].ToString()))
                    {
                        area = Convert.ToInt32(dr[2]);
                    }
                    if (!String.IsNullOrEmpty(dr[3].ToString()))
                    {
                        assunto = Convert.ToInt32(dr[3]);
                    }
                    if (!String.IsNullOrEmpty(dr[4].ToString()))
                    {
                        img = Convert.ToInt32(dr[4]);
                    }
                    if (!String.IsNullOrEmpty(dr[5].ToString()))
                    {
                        texto = Convert.ToInt32(dr[5]);
                    }
                    //str = "insert into pergunta (cod,tipo,area,assunto,img,texto,pergunta) values (" + cod + "," + tipo
                    //+ "," + area + "," + assunto + "," + img + "," + texto + ",'" + dr[6].ToString().Replace("'", "") + "')";
                    ds = bd.ConsultaSQL("select [cod-pergunta] from vpergunta where [cod-pergunta]=" + dr[0]);

                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        if (!bd.ExecutarSQL(str))
                        {
                            t = str;
                        }
                    }
                    else
                    {
                        int controle = Convert.ToInt32(dr[0]);
                        if (controle == 52)
                        {
                         string info =   dr[6].ToString().Replace("'", "").Replace(";\r\n", "");
                        }
                        str = "update vpergunta set pergunta='" + dr[6].ToString().Replace("'", "").Replace(";\r\n", "") + "' where [cod-pergunta] =" + Convert.ToInt32(dr[0]);
                        bd.ExecutarSQL(str);
                    }
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string con = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\backup\resposta-perguntas.xls;Extended Properties='Excel 8.0;HDR=Yes;'";
        using (OleDbConnection connection = new OleDbConnection(con))
        {
            connection.Open();
            OleDbCommand command = new OleDbCommand("select * from [Plan1$]", connection);
            using (OleDbDataReader dr = command.ExecuteReader())
            {
                while (dr.Read())
                {
                    string str = "";
                    DataSet ds;
                    string t;
                    int cod = 0;
                    int seq = 0;
                    string resposta = "";
                    int gabarito = 0;

                    if (!String.IsNullOrEmpty(dr[0].ToString()))
                    {
                        seq = Convert.ToInt32(dr[0]);
                    }
                    if (!String.IsNullOrEmpty(dr[1].ToString()))
                    {
                        cod = Convert.ToInt32(dr[1]);
                    }
                    if (!String.IsNullOrEmpty(dr[2].ToString()))
                    {
                        resposta = dr[2].ToString();
                    }

                    if (!String.IsNullOrEmpty(dr[3].ToString()))
                    {
                        if (Convert.ToBoolean(dr[3]) == false)
                        {
                            gabarito = 0;
                        }
                        else
                        {
                            gabarito = 1;
                        }
                    }

                    str = "insert into perguntaResposta (seq,Perguntacod,resposta,gabarito) values (" + seq + "," + cod + ",'" + resposta
                    + "'," + gabarito + ")";
                    ds = bd.ConsultaSQL("select Perguntacod from perguntaResposta where seq=" + dr[0]);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        if (!bd.ExecutarSQL(str))
                        {
                            t = str;
                        }
                    }
                }
            }
        }
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        string text = System.IO.File.ReadAllText(@"C:\backup\pergunta.txt");
        
        // Display the file contents to the console. Variable text is a string.
        System.Console.WriteLine("Contents of WriteText.txt = {0}", text);

        // Example #2
        // Read each line of the file into a string array. Each element
        // of the array is one line of the file.
        string[] lines = System.IO.File.ReadAllLines(@"C:\backup\pergunta.txt", System.Text.Encoding.UTF7     );

        // Display the file contents by using a foreach loop.
        System.Console.WriteLine("Contents of WriteLines2.txt = ");
        foreach (string line in lines)
        {
            // Use a tab to indent each line of the file.
            string[] dados = line.Split(new char[] { '|' });
            string str1 = "update vpergunta set pergunta='" + dados[1] + "' where [cod-pergunta]=" + dados[0];
            bd.ExecutarSQL(str1);
  
        }

        string teste = "oi";

    }
}