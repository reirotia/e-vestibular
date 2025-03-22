using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default3 : System.Web.UI.Page
{
    private SqlConnection _conexao = null;
    private int modified;

    protected void Page_Load(object sender, EventArgs e)
    {
        string nome = Request["nome"].ToString();
        string cpf= Request["cpf"].ToString();
        string rg = Request["rg"].ToString();
        string email = Request["email"].ToString();
        string celular = Request["celular"].ToString();
        string instagram = Request["instagram"].ToString();
        string faculdade = Request["faculdade"].ToString();
        string curso = Request["curso"].ToString();
        string formaIngresso = Request["formaIngresso"].ToString();
        string campusId = Request["campos"].ToString();
        
        


        _conexao = Connection.getConexacao();
        _conexao.Open();

        try
        {


            string str = "insert into CadastroEletronico (nome,cpf,rg,email,celular,instagram,faculdadeid,curso,tipoIngresso,campusId) ";
            str += "values (@nome,@cpf,@rg,@email,@celular,@instagram,@faculdadeId,@curso,@formaIngresso,@campusId);SELECT SCOPE_IDENTITY();";
            SqlCommand cmd = new SqlCommand(str, _conexao);
            cmd.Prepare();
            cmd.Parameters.AddWithValue("@nome", nome);
            cmd.Parameters.AddWithValue("@cpf", cpf);
            cmd.Parameters.AddWithValue("@rg", rg);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@celular", celular);
            cmd.Parameters.AddWithValue("@instagram", instagram);
            cmd.Parameters.AddWithValue("@faculdadeid", faculdade);
            cmd.Parameters.AddWithValue("@curso", curso);
            cmd.Parameters.AddWithValue("@formaIngresso", formaIngresso);
            cmd.Parameters.AddWithValue("@campusId", campusId);

            ScriptSql.modified = Convert.ToInt32(cmd.ExecuteScalar());
        }
        catch (Exception ex)
        {
            _conexao.Close();
            Response.Redirect("novoIndex.aspx");
        }
        finally
        {
            _conexao.Close();
        }

        

        
        

    }
}