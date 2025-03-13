<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cad.aspx.cs" Inherits="cad" %>

<html lang="pt-br">

<head>
    <meta charset="utf-8">

    <title>E-Vestibular</title>
    <meta name="description" content="E-Vestibular">
    <meta name="author" content="Reinaldo Santana">
    <link rel="stylesheet" href="resources/lib/bootstrap-4.2.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/lib/bootstrap-ecommerce-uikit/css/ui.css" />


    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/jquery.maskedinput.min.js"></script>
    <script src="assets/js/jquery.validate.min.js"></script>



    <link href="css/styleMaster.css" rel="stylesheet" />

    <script type="text/javascript">
        jQuery(function ($) {
            $("#inputData").mask("99/99/9999");
            $("#celular").mask("(99) 99999-9999");
            $("#inputTelefoneFixo").mask("(99) 9999-9999");

            $("#inputCpf").mask("999.999.999-99");
            $("#inputCep").mask("99999-999");
        });
    </script>

    <script language="javascript" type="text/javascript">
        function validate() {

            var nomeUsuario = document.querySelector('.validaNomeCampo');
            var CPFUsuario = document.querySelector('.validaCPFCampo');
            var fac = document.querySelector('.validaFaculdadeCampo');
            var vformaIngresso = document.querySelector('.validaformaIngressoCampo');
            var msgUpload = document.querySelector('.validaUploadCampo');
            var EmailCampo = document.querySelector('.validaEmailCampo');
            var EmailCampo2 = document.querySelector('.validaEmail2');
            var celularUsuario = document.querySelector('.validaCelularCampo');
            //var InstagramCampo = document.querySelector('.validaInstagramCampo');
            var curso = document.querySelector('.validaCursoCampo');





            //NOME
            if (document.getElementById('inputnome').value == "") {
                nomeUsuario.style.display = "block";
                document.getElementById('inputnome').focus();

                return false;

            } else {
                nomeUsuario.style.display = "none";
            }








            if (document.getElementById('inputCpf').value == "" || document.getElementById('inputCpf').value == null) {
                CPFUsuario.style.display = "block";
                document.getElementById('inputCpf').focus();
                return false;

            } else {

                CPFUsuario.style.display = "none";

            }

            var cpf = document.getElementById('inputCpf').value.replace(".", "").replace(".", "").replace("-", "");
            var add;

            if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999") {
                CPFUsuario.style.display = "block";
                return false;
            }
            add = 0;
            for (i = 0; i < 9; i++)
                add += parseInt(cpf.charAt(i)) * (10 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != parseInt(cpf.charAt(9))) {
                CPFUsuario.style.display = "block";
                return false;
            }
            add = 0;
            for (i = 0; i < 10; i++)
                add += parseInt(cpf.charAt(i)) * (11 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
                rev = 0;
            if (rev != parseInt(cpf.charAt(10))) {
                //alert('O CPF INFORMADO É VÁLIDO.');
                return false;
            }

            if (document.getElementById('txtEmail').value.length > 0) {



                var email = $("#txtEmail").val();
                if (email != "") {
                    EmailCampo.style.display = "none";
                    //var filtro = /^([w-]+(?:.[w-]+)*)@((?:[w-]+.)*w[w-]{0,66}).([a-z]{2,6}(?:.[a-z]{2})?)$/i;
                    //var filto = /^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$/i;
                    //var filtro = /^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$/i;
                    var filtro = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

                    if (filtro.test(email)) {
                        EmailCampo2.style.display = "none";

                    } else {
                        EmailCampo2.style.display = "block";
                        return false;
                    }
                }

            } else {

                EmailCampo.style.display = "block";
                return false;
            }

            if (document.getElementById('celular').value == "" || document.getElementById('celular').value == null) {
                celularUsuario.style.display = "block";
                document.getElementById('celular').focus();
                return false;

            } else {

                celularUsuario.style.display = "none";

            }

           /*
            if (document.getElementById('instagram').value == "" || document.getElementById('instagram').value == null) {
                InstagramCampo.style.display = "block";
                document.getElementById('instagram').focus();
                return false;

            } else {

                InstagramCampo.style.display = "none";

            }
            */



            var select = document.getElementById('inputFaculdade');
            var valorFac = select.options[select.selectedIndex].value;



            if (valorFac == "0") {
                fac.style.display = "block";
                document.getElementById('inputFaculdade').focus();
                return false;
            } else {
                fac.style.display = "none";
            }

            var select = document.getElementById('inputCurso');
            var valorCurso = select.options[select.selectedIndex].value;


            if (valorCurso == "0") {
                curso.style.display = "block";
                document.getElementById('inputCurso').focus();
                return false;
            } else {
                curso.style.display = "none";
            }
           

            
            var select = document.getElementById('formaIngresso');
            var valorformaIngresso = select.options[select.selectedIndex].value;


            if (valorformaIngresso == "0") {
                vformaIngresso.style.display = "block";
                document.getElementById('formaIngresso').focus();
                return false;
            } else {
                vformaIngresso.style.display = "none";

            }


            if (valorformaIngresso != 1 && document.getElementById('fileArquivo').value == '') {
                msgUpload.style.display = "block";
                document.getElementById('formaIngresso').focus();
                return false;
            } else {
                msgUpload.style.display = "none";

            }

        }






    </script>
  
    
</head>

<body>
    <form runat="server">

        <header>
            <nav class="navbar">

                <a class="navbar-brand navbar-center">
                    <img src="assets/img/favicons/e.png" />
                </a>


            </nav>
        </header>

        <main role="main">
            <%System.Data.DataSet dsCurso = Session["dsCurso"] as System.Data.DataSet; %>
             <%System.Data.DataSet dsFaculdade = Session["dsFaculdade"] as System.Data.DataSet; %>
            <%System.Data.DataSet dscampus = Session["dscampus"] as System.Data.DataSet;  %>


            
        <section class="container" style="margin-top: 50px">
            <div class="row">
                <aside class="col-sm-6">
                    
                    <div id="code_register_1">
                        <div class="card">
                            
                            <article class="card-body">
                                <form>
                                    <div class="form-row">
                                        <div class="col form-group">
                                            <div class="text-center"  >
                                            <img src="<%=Session["pathImagem"]%>" width="200px" />
                                            </div>
                                            <input type="text" id="faculdadeID" name="faculdadeID" value="<%=Session["faculdadeID"]%>" style="display:none" /> 
                    <h3 class="subtitle-doc">Formulário para Cadastro
                        
                    </h3>
                                                                    <label>Nome</label>
                                            <input type="text" class="form-control" id="inputnome" name="inputnome" placeholder="" autofocus >

                                            <span class="alert-danger validaNomeCampo" style="display:none">O campo <strong>Nome</strong> é obrigatório. Digite um nome válido.
                            </span>
                                        </div> <!-- form-group end.// -->

                                    </div> <!-- form-row end.// -->
                                    <div class="form-group">
                                        <label>CPF</label>
                                        <input type="tel" class="form-control" id="inputCpf" name="inputCpf" placeholder="">
                                        <span class="alert-danger validaCPFCampo" style="display:none">O <strong>CPF </strong>está errado ou incompleto.
                                        </span>
                                    </div> <!-- form-group end.// -->

                                           <div class="form-group">
                                        <label>E-mail</label>
                                        <input type="text" class="form-control" id="txtEmail" name="txtEmail" placeholder="">
                                        <span class="alert-danger validaEmailCampo" style="display:none">O <strong>E-mail </strong> é obrigatório.
                                        </span>
                                        <span class="alert-danger validaEmail2" style="display:none">Informe um<strong>E-mail</strong> válido.
                                    </div> <!-- form-group end.// -->


                                        <div class="form-group">
                                            <label>Celular</label>
                                            <input type="text" class="form-control" id="celular" name="celular" placeholder="">
                                        <span class="alert-danger validaCelularCampo" style="display:none">O campo <strong>Celular / WhatsApp</strong> é obrigatório.
                            </span>
                                        
                                    </div> <!-- form-group end.// -->

                                    
                                       <div class="form-group">
                                            <label>Instagram</label>
                                            <input type="text" class="form-control" id="instagram" name="instagram" placeholder="">
                                        <span class="alert-danger validaInstagramCampo" style="display:none">O campo <strong>Instagram </strong> é obrigatório.
                            </span>
                                        
                                    </div> <!-- form-group end.// -->
                                
                                                                        
                                   
                                    <div class="form-row">
                                            <label>Faculdade</label>
                                            <select id="inputFaculdade" name="inputFaculdade" class="form-control select2">
                                                <option value="<%=dsFaculdade.Tables[0].Rows[0]["faculdadeId"]%>"><%=dsFaculdade.Tables[0].Rows[0]["faculdade"]%></option>
                                               
                                            </select>
                                             <span class="alert-danger validaFaculdadeCampo" style="display:none"><strong>Escolha uma faculdade</strong> é obrigatório.
                            </span>
                                    </div> <!-- form-row.// -->

                                                             <div class="form-row">
                                            <label>Campus</label>
                                        
                                            <select id="inputCampus" name="inputCampus" class="form-control select2" onchange="cursoCampus()" >
                                                <option value="0">Selecione um curso</option>                                             
                                                    <%for (int i = 0; i < dscampus.Tables[0].Rows.Count; i++) %>
                                                    <%{ %>
                                                    <option value="<%=dscampus.Tables[0].Rows[i]["campusID"]%>"><%=dscampus.Tables[0].Rows[i]["campus"]%></option>
                                                    <%} %>
                                            </select>
                                   
                                    </div> <!-- form-row.// -->


                                           <div class="form-row">
                                            <label>Curso</label>
                                        
                                            <select id="inputCurso" name="inputCurso" class="form-control select2"  >
                                                <option value="0">Selecione um curso</option>                                             
                                                    <%for (int i = 0; i < dsCurso.Tables[0].Rows.Count; i++) %>
                                                    <%{ %>
                                                    <option value="<%=dsCurso.Tables[0].Rows[i]["cursoID"]%>"><%=dsCurso.Tables[0].Rows[i]["curso"]%></option>
                                                    <%} %>
                                            </select>
                                                  <span class="alert-danger validaCursoCampo" style="display:none"><strong>Escolha um curso</strong> é obrigatório.
                            </span>
                                    </div> <!-- form-row.// -->                      
                               

                                         <div class="form-row">
                                            <label>Formas de ingresso</label>
                                             <input type="text" id="textoFormaIngresso" name="textoFormaIngresso" style ="display:none" />
                                            <% System.Data.DataSet dsProcesso = Session["dsProcesso"] as System.Data.DataSet;  %>
                                            <select id="formaIngresso" name="formaIngresso" class="form-control select2" onchange="mensagemTipoVestibular()">
                                                <option value="0">Selecione uma forma de ingresso</option>                                             
                                                    <%for (int i = 0; i < dsProcesso.Tables[0].Rows.Count; i++) %>
                                                    <%{ %>
                                                    <option value="<%=dsProcesso.Tables[0].Rows[i]["processoID"]%>"><%=dsProcesso.Tables[0].Rows[i]["processo"]%></option>
                                                    <%} %>
                                            </select>
                                             <p></p>
                                             
                                     
                                                  <span class="alert-danger validaformaIngressoCampo" style="display:none"><strong>Escolha uma forma de ingresso.</strong></span>

                                         
                                            <p id="mensagem" class="alert-info"></p>
                                     

                                    </div> <!-- form-row.// -->
 

                                    <div id="uploadDiv" class="form-row" style="display:none">
                                    
<asp:FileUpload ID="fileArquivo" name="fileArquivo" cssClass="form-control" runat="server"></asp:FileUpload>
                             <span class="alert-danger validaUploadCampo" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span>
                                                         </div> <!-- form-row.// -->
 
                                    
                                    <p></p>

                                    <div class="form-group">

                                          <asp:Button ID="btnEnviar" CssClass="btn btn-primary btn-block" runat="server" Text="Cadastrar" OnClientClick=" return validate()" OnClick="btnEnviar_Click" />
    
                                    </div> <!-- form-group// -->
                                    
                                </form>
                            </article> <!-- card-body end .// -->
                            <div class="border-top card-body text-center">Já tenho cadastro? <a href="singin.aspx">Entrar</a></div>
                            <div class="text-center">
                                        <p> Dúvida? Fale conosco pelo e-mail <br> <spam> <img src="assets/img/favicons/email.png" height="32" /> </spam>sac@evestibular.com.br</p>
                                 </div>          
                        </div> <!-- card.// -->

                    </div> <!-- code-wrap.// -->
                </aside>
            </div>
        </section>







        <hr class="featurette-divider">

        <!-- FOOTER -->
        <footer class="container">
            <p class="float-right"><a href="#">Back to top</a></p>
            <p>&copy; 2017-2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>
    </main>

        <!-- Bootstrap core JavaScript
              ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->


        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        <script src="resources/lib/holder/holder.min.js"></script>
        <script src="resources/lib/jquery3.3.1/jquery-3.3.1.min.js"></script>
        <script src="resources/lib/popper1.14.6/popper.min.js"></script>
        <script src="resources/lib/bootstrap-4.2.1-dist/js/bootstrap.min.js"></script>

        <script>
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();
            });
        </script>
    </form>
</body>


<script type="text/javascript">
    function onsubmit(event) {
        return false;
    }

    function onKeyDown(event) {
        event.preventDefault();
    }
</script>

    <script>
        var NMHOST = "Service.asmx?op=MensagemTipoVestibular";
       
           function mensagemTipoVestibular() {
              
               var select = document.getElementById('formaIngresso');
               var valorformaIngresso = select.options[select.selectedIndex].value;
             
               var URLWEBSERVICE = "https://" + NMHOST;
               var soapRequest = '<?xml version="1.0" encoding="utf-8"?><soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"> <soap12:Body>    <MensagemTipoVestibular xmlns="http://tempuri.org/">      <mensagemID>' + valorformaIngresso + '</mensagemID> <faculdadeID>' + document.getElementById('faculdadeID').value + '</faculdadeID>    </MensagemTipoVestibular>  </soap12:Body></soap12:Envelope>'

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

                var nova = $(req.responseXML).find("MensagemTipoVestibularResult").text();
                document.getElementById('mensagem').innerHTML = nova;
                validate();

                var select = document.getElementById('formaIngresso');
            var valorformaIngresso = select.options[select.selectedIndex].value;
            var texto = $('#formaIngresso :selected').text();
            document.getElementById('textoFormaIngresso').value = texto;

            if (valorformaIngresso == 1 || valorformaIngresso == 0) {
                document.querySelector('#uploadDiv').style.display = "none";
            } else {
                document.querySelector('#uploadDiv').style.display = "block";
            }
                

            }
            function processError(data, status, req) {

            }


        }

</script>
    

</html>
