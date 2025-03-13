<%@ Page Title="" Language="C#" MasterPageFile="~/masterIes.master" AutoEventWireup="true" CodeFile="menu2.aspx.cs" Inherits="menu2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Menu2</title>
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
     
    
    
    <form id="form1" runat="server">
        
    
    <div class="row">
                
                <div class="col-md-12">

          <div class="box">
              
            <div class="box-header">
              <h3 class="box-title">Lista de Usuários</h3>
            </div>
            <div class="row">  
            <aside class="col-sm-6">
                <label>Semestre</label>
                                            
                    <select id="semestre" name="semestre" class="form-control select2">
                                                <option value="2020.2">2020.2</option>
                                                <option value="2021.1">2021.1</option>
                                                <option value="2021.2">2021.2</option>
                                                <option value="2022.1">2022.1</option>
                                                <option value="2022.2">2022.2</option>
                                                <option value="2023.1">2023.1</option>
                                                <option value="2023.2">2023.2</option>
                                                <option value="2024.1">2024.1</option>
                                                <option value="2024.2">2024.2</option>
                                                <option value="2025.1">2025.1</option>
                                                <option value="2025.2" selected>2025.2</option>
                                            </select>
             </aside>
                <%System.Data.DataSet dsCampus = Session["dsCampus"] as System.Data.DataSet; %>
            <aside class="col-sm-6">
                              <label>Campus</label>
                                                  
                <select id="selCampus" name="selCampus" class="form-control select2">
                     <%for (int i=0 ; i<dsCampus.Tables[0].Rows.Count; i++) {   %>                           
                    
                    <option value="<%=dsCampus.Tables[0].Rows[i]["campusId"]%>"><%=dsCampus.Tables[0].Rows[i]["campus"] %></option>
                                                <%} %>
                                               <option value="" selected>Selecione um Campus</option>
                                               
                                            </select>
             </aside>
                </div>
              <br />
              <div class="row">
            <aside class="col-sm-6">
                 <label>Nome</label>
                             
                               <input type="text" class="form-control" id="inputNome" name="inputNome" placeholder="" autofocus >
                             
                </aside>
            <aside class="col-sm-6">
         <br />
                       <button type="button" class="btn btn-success btn-xs btn-flat" onclick="filtrar()">Filtrar </button>
               </aside>
  
                                
             </aside>          
                  </div>    
              <br />
            <div class="box-body no-padding">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Telefone</th>
                    <th>E-mail</th>
                    <th>Processo</th>
                    <th>Status</th>
                    <th></th>
                  
                    
                  </tr>
                </thead>
                <tbody>
                    <%System.Data.DataSet ds = Session["ds"] as System.Data.DataSet; %>
                     <input type="text" id="faculdadeId" name="faculdadeId" value="<%=Session["faculdadeId"] %>" style="display:none" />
                      <%for (int i=0; i<ds.Tables[0].Rows.Count; i++ ) %>
                      <%{ %>
                  <tr id="<%=ds.Tables[0].Rows[i]["cpf"] %>">

                    <td><%=ds.Tables[0].Rows[i]["nome"] %></td>
                    <td><%=ds.Tables[0].Rows[i]["cpf"] %></td>
                    <td><%=ds.Tables[0].Rows[i]["celular"] %></td>
                    <td><%=ds.Tables[0].Rows[i]["email"] %></td>

                    <td><%=ds.Tables[0].Rows[i]["processo"] %></td>
                    <td ><%=ds.Tables[0].Rows[i]["status"] %></td>
                    <%if (ds.Tables[0].Rows[i]["nomeArquivo"].ToString().Length>0)  %>
                    <%{ %>   
                    <td>
                    
                        <button type="button" class="btn btn-success btn-xs btn-flat" onclick="aprovar('<%=ds.Tables[0].Rows[i]["cpf"] %>')">Deferida</button>
                    
                          <button type="button" class="btn btn-danger btn-xs btn-flat" onclick="indeferir('<%=ds.Tables[0].Rows[i]["cpf"] %>')">Indeferir</button>
                   
                          <button  type="button" class="btn btn-info btn-xs btn-flat" name="btnImg" id="btnImg" onclick="verDocumento('<%=ds.Tables[0].Rows[i]["codEletronico"] %>')">Ver Documento</button>
                    </td>
                      <%} %>
                      <%else %>
                      <%{ %>
                      <td>
                          <%if (ds.Tables[0].Rows[i]["status"].ToString() == "APROVADO(A)")
                              {%>
                    <button  type="button" class="btn btn-info btn-xs btn-flat" name="btnImg" id="btnImg" 
                       
                        onclick="abrirBoletim('<%=ds.Tables[0].Rows[i]["codEletronico"] %>')">
                    Boletim de desempenho</button>
                        <%}
    else
    {%>
                          ----------
                          <%} %>
                      </td>
                       
                      <%} %>
                  </tr>
                    <%if (ds.Tables[0].Rows[i]["nomeArquivo"].ToString().Length>0)  %>
                    <%{ %>
                    <%string img = "arquivos/" + ds.Tables[0].Rows[i]["nomeArquivo"].ToString(); %>

                    <tr id='<%=ds.Tables[0].Rows[i]["codEletronico"]%>' style="display:none"><td><img src="<%=img%>"  width="400px" /></td></tr>
                    <%} %>
                    <%} %>
                  
                  
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>

        </div>
        
      </div>
        <script>
            function verDocumento(codEletronico) {
               
                if (document.getElementById(codEletronico).style.display == "none") {
                    document.getElementById(codEletronico).style.display = "block";
                  
                } else {
                    document.getElementById(codEletronico).style.display = "none";
                    documento.getElementById('btnImg').value = "090";
                }
            }
            function abrirBoletim(codEletronico) {
                window.open("resultado.aspx?id=" + codEletronico);
            }
            


        </script>



       <script>
           
           function indeferir(cpf) {
             
               var NMHOST = "Service.asmx?op=wsIndeferir";
               var soapRequest = '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><wsIndeferir xmlns="http://tempuri.org/"><cpf>' + cpf + '</cpf> <faculdadeID>' + document.getElementById('faculdadeId').value + '</faculdadeID></wsIndeferir></soap:Body></soap:Envelope>'
             

               $(document).ready(function () {
                   $.ajax({
                       type: "POST",
                       url: NMHOST,
                       contentType: "text/xml",
                       dataType: "xml",
                       data: soapRequest,
                       success: processSuccess,
                       error: processError
                   });
               });

               function processSuccess(data, status, req) {

                   var nova = $(req.responseXML).find("wsIndeferirResult").text();
                 

                   document.getElementById(cpf).innerHTML = nova;

               }
               function processError(data, status, req) {

               }


           }

</script>
 
          <script>

              function aprovar(cpf) {

                  var NMHOST = "Service.asmx?op=wsIndeferir";
                  var soapRequest = '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><wsAprovar xmlns="http://tempuri.org/"><cpf>' + cpf + '</cpf> <faculdadeID>' + document.getElementById('faculdadeId').value + '</faculdadeID></wsAprovar></soap:Body></soap:Envelope>'


                  $(document).ready(function () {
                      $.ajax({
                          type: "POST",
                          url: NMHOST,
                          contentType: "text/xml",
                          dataType: "xml",
                          data: soapRequest,
                          success: processSuccess,
                          error: processError
                      });
                  });

                  function processSuccess(data, status, req) {

                      var nova = $(req.responseXML).find("wsAprovarResult").text();


                      document.getElementById(cpf).innerHTML = nova;

                  }
                  function processError(data, status, req) {

                  }


              }

</script>
 
                                  
        <asp:Button ID="Button1" runat="server" Text="Button" Style="display:none" OnClick="Button1_Click" />
    </form>
    <script>
        function filtrar() {

            document.getElementById('<%=Button1.ClientID%>').click();
        }
        </script>
     

 

</asp:Content>

