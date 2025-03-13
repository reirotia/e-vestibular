using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CAD;

public partial class masterIes : System.Web.UI.MasterPage
{
    DataSet ds;
    ManipulacaoBanco bd = new ManipulacaoBanco();
    protected void Page_Load(object sender, EventArgs e)
    {

    
        Session.Add("logo", "assets/img/logo/" + Session["faculdadeId"].ToString() + ".png");

    }
}
