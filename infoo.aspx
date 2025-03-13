<%@ Page Language="C#" AutoEventWireup="true" CodeFile="infoo.aspx.cs" Inherits="infoo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/styloInfo.css" rel="stylesheet" />
    <!------ Include the above in your HEAD tag ---------->
    <link href="css/styleMaster.css" rel="stylesheet" />


    <script language="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById('optionsRadios3').checked == false) {

                var display = document.getElementById('msg2').style.display;
                document.getElementById('msg2').style.display = "block";
                return false;
            } else {
                var display = document.getElementById('msg2').style.display;
                document.getElementById('msg2').style.display = "none";

            }
        }
    </script>

</head>
<body>
    <form runat="server"> 
    <nav class="navbar navbar-center">

        <a class="navbar-brand navbar-center">
            <img src="assets/img/favicons/e.png" />
        </a>


    </nav>
    <div class="container">
        <h2>Regras para realização do Processo Seletivo On-line</h2>
        <div class="row">

            usuario[] usuarios = apicosultausuartios.getUsuario(cpf); 
                 
             
            <%System.Data.DataSet dsDados = Session["dsDados"] as System.Data.DataSet; %>           
            <%string img = "assets/img/logo/"  + dsDados.Tables[0].Rows[0]["faculdadeId"]    +  ".png";%>
            
            <div class="col-md-12 col-lg-12">
                <div id="tracking-pre"></div>
                
                <div id="tracking">
                    
                    <%System.Data.DataSet ds = Session["ds"] as System.Data.DataSet; %>
                    
                    <div class="tracking-list">
                
                           <table class="table">
                              
                   <tbody>
    <tr>
      <th scope="row"></th>
       
      <td><img src="<%=img%>" width="200px" /></td>
    </tr>
    <tr>
      <th scope="row" >Candidato</th>
      <td><%=dsDados.Tables[0].Rows[0]["nome"].ToString() %></td>
    </tr>
    <tr>
      <th scope="row">CPF</th>
      <td colspan="2"><%=dsDados.Tables[0].Rows[0]["cpf"].ToString()%></td>
    </tr>
  </tbody>
                        
                </table>
            
                       
                                <%for (int i=0; i<ds.Tables[0].Rows.Count; i++) { %>
                        <div class="tracking-item">
                        
                                        <div class="tracking-icon status-intransit">
                                <svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path>
                                </svg>
                                <!-- <i class="fas fa-circle"></i> -->
                            </div>
                            <div class="tracking-content">
                                <span><%=ds.Tables[0].Rows[i]["regras"]%>
                                </span>
                            </div>
                        </div>
                        <%}%>
                        
                        <div class="tracking-item">
                            <div class="tracking-icon status-intransit">
                                <svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path>
                                </svg>
                                <!-- <i class="fas fa-circle"></i> -->
                            </div>

                            <div class="tracking-content">
                                <span>
                                    <input type="checkbox" name="optionsRadios3" id="optionsRadios3" onclick="mensagem2()" value="0" />
                                    Li os termos e concordo.
                                <div class="alert alert-danger" name="msg2" id="msg2" style="display: none">
                                    <strong>Atenção!</strong> Para fazer a prova é necessário ler os termos e concordar.
                                </div>

                                </span>
                            </div>
                            
                                         
    
                                       </div>
                        <div class="tracking-item">
                            <div >
                                
                                            </div>
                            <div class="tracking-content">
                                <span>Boa sorte!
                                </span>
                            </div>
                                                       <asp:Button ID="btnEnviar" CssClass="btn col-md-4 pull-right btn-info" runat="server" Text="Fazer a Prova" OnClientClick=" return validate()" OnClick="btnEnviar_Click" />
                              
                        </div>
                              
                    </div>
                </div>
            </div>
        </div>
    </div>
            </form>
</body>

</html>
