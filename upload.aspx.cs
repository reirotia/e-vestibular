using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        string arquivo = Request["arquivo"];
        /*
        var extensao = System.IO.Path.GetExtension(arquivo);
        if (extensao.Equals(".png",StringComparison.CurrentCultureIgnoreCase)
            || extensao.Equals(".jpg", StringComparison.CurrentCultureIgnoreCase)
            || extensao.Equals(".jpeg",StringComparison.CurrentCultureIgnoreCase))
        {
         * 99346
3660
daniel
            var nomeUni = String.Format("{0}_{1}{2}",
               System.IO.Path.GetFileNameWithoutExtension(arquivo),
               DateTime.Now.Ticks,
               extensao);
        }
        */

        string caminho = AppDomain.CurrentDomain.BaseDirectory + System.Configuration.ConfigurationManager.AppSettings["caminhoArquivo"] + "\\"+fileArquivo.FileName ;
        fileArquivo.SaveAs(caminho); 
        
    }
}