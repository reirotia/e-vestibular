<%@ Page Title="" Language="C#" MasterPageFile="~/masterAluno.master" AutoEventWireup="true" CodeFile="resultado.aspx.cs" Inherits="resultado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Resultado</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
      <script src="js/jquery-3.3.1.min.js"></script>

    <script>
        function processarAluno(codEletronico) {
            alert(codEletronico);


        }
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
        <div class="col-md-12">

          <div class="box">
            <div class="box-header">
             
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              
                       <div id="boletim" class="form-group" >

                <div style="text-align: left; padding-top: 100px;">
                     <img src="assets/img/logo/logo-meio-paginas-2.png" />
                     
                    <h2>Boletim de desempenho</h2>
                    <h2>Vestibular online 2025.2</h2>
                   
                    <h2>O candidato participou do e-vestibular online</h2>
                                    <div style="text-align: left; padding: 30px;">
                    <%System.Data.DataSet ds = Session["ds"] as System.Data.DataSet; %>
                    <%if (ds.Tables[0].Rows[0]["respostaPergunta"].ToString().Length ==0) %>
                    <%{ %>
                        <%if (ds.Tables[0].Rows[0]["STATUSRED"].ToString().Length  == 0) %>
                        <%{ %>
                              <p>Nome : <%=ds.Tables[0].Rows[0]["nome"].ToString() %></p> 
                              <p>Data inscrição : <%=ds.Tables[0].Rows[0]["dtinscricao"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                   
                                <p>Situação do processamento : Aguardando corrreção da redação.</p> 
                          <%} %>
                           <%else {%>
                                 <p>Código do candidato : <%= Session["codEletronico"]%></p> 
                              
                                  <p>Nome : <%=ds.Tables[0].Rows[0]["nome"].ToString() %></p> 
                              <p>Data inscrição : <%=ds.Tables[0].Rows[0]["dtinscricao"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                               
                                <%if (Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva8"]) < 400)%>
                                <%{ %>
                                <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na prova de redação.</p>
                                 <%}  else {%>
                                  <p>Nota Redação : <%=ds.Tables[0].Rows[0]["TipoProva8"]%></p>
                                   <p>Situação do processamento : Aprovado.</p>
                                    <%if (ds.Tables[0].Rows[0]["dsLink"].ToString().Length  > 0) { %>
                                    <a href="<%=ds.Tables[0].Rows[0]["dsLink"].ToString()%>"><input type="button" class="btn btn-success" value="Faça sua matrícula" /> </a>
                                    <%} %>
                                        <%string boletim = "arquivos/boletim/" + Session["codEletronico"] + ".pdf"; %>
                                        <a href="<%=boletim%>" target="_blank" ><input type="button" class="btn btn-info" value="Boletim de desempenho" /> </a>
                                    
                                 <%} %> 
                           <%} %>    
                    <%} else {%>
                     <%if (ds.Tables[0].Rows[0]["STATUSRED"].ToString().Length  == 0 || ds.Tables[0].Rows[0]["STATUSOBJ"].ToString().Length==0) %>
                        <%{ %>
                              <p>Nome : <%=ds.Tables[0].Rows[0]["nome"].ToString() %></p> 
                              <p>Data inscrição : <%=ds.Tables[0].Rows[0]["dtinscricao"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                   
                                <p>Situação do processamento : Aguardando corrreção das provas .</p> 
                          <%} %>
                           <%else {%>
                              <p>Código do candidato : <%= Session["codEletronico"]%></p> 
                              
                              <p>Nome : <%=ds.Tables[0].Rows[0]["nome"].ToString() %></p> 
                              <p>Data inscrição : <%=ds.Tables[0].Rows[0]["dtinscricao"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                                <%int nota = Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva1"]) + Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva4"]);  %>
                               
                                <%if (Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva8"]) < 400 && nota < 400 )%>
                                <%{ %>
                                <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na prova de redação e nas Provas objetivas.</p>
                                 <%}  else if (Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva8"]) < 400) {%>
                                   <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na prova de redação.</p>
                                 
                                 <%} else if (nota<400) {%>
                                   <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na provas de objetivas.</p>
                                <%} else {%>
                                         <p>Prova Objetiva de Lingua Portuguesa: <%=ds.Tables[0].Rows[0]["TipoProva1"]%></p> 
                                <p>Prova Objetiva de Matemática: <%=ds.Tables[0].Rows[0]["TipoProva4"]%></p> 
                                <p>Nota Redação : <%=ds.Tables[0].Rows[0]["TipoProva8"]%></p> 
                                <p>Escore Global : <%=nota + Convert.ToInt32 (  ds.Tables[0].Rows[0]["TipoProva8"])%></p>
                                <p>Situação do processamento : Aprovado.</p>
                                        <%if (ds.Tables[0].Rows[0]["dsLink"].ToString().Length > 0) { %>
                                 <a href="<%=ds.Tables[0].Rows[0]["dsLink"].ToString()%>"><input type="button" class="btn btn-success" value="Faça sua matrícula" /> </a>
                                    <%} %>
                                            <%string boletim = "arquivos/boletim/" + Session["codEletronico"] + ".pdf"; %>
                                        <a href="<%=boletim%>" target="_blank" ><input type="button" class="btn btn-info" value="Boletim de desempenho" /> </a>
                                    
                                <% }%> 

                            <%} %>
                    <%} %>
                  </div>

                  


                    <div style="text-align: center; padding-top: 100px;">

                        <p>e-vestibular tecnologia em aplicação de provas</p>
                        <p>sac@evestibular.com.br</p>
                    </div>
                </div>
            </div>
                 
            </div>
                    
            <!-- /.box-body -->
          </div>


        </div>
      </div>

</asp:Content>

