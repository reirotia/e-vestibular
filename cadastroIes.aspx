<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadastroIes.aspx.cs" Inherits="cadastroIes" %>

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
            $("#inputCelular").mask("(99) 99999-9999");
            $("#inputTelefone").mask("(99) 9999-9999");

            $("#inputCpf").mask("999.999.999-99");
            $("#inputCep").mask("99999-999");
        });
    </script>

    <script language="javascript" type="text/javascript">
        function validate() {

            var nomeUsuario = document.querySelector('.validaNomeCampo');
            var celularUsuario = document.querySelector('.validaCelularCampo');
            var telefone = document.querySelector('.validaTelefone');

            var site = document.querySelector('.validaSite');
            var msgemail = document.querySelector('.validaEmail');
            var msgemail2 = document.querySelector('.validaEmail2');
            var campus = document.querySelector('.validaCampus');
            var quanto = document.querySelector('.validaQuantosCampus');







            //NOME
            if (document.getElementById('inputNome').value == "") {
                nomeUsuario.style.display = "block";
                document.getElementById('inputNome').focus();

                return false;

            } else {
                nomeUsuario.style.display = "none";
            }








           
            if (document.getElementById('inputCelular').value == "" || document.getElementById('inputCelular').value == null) {
                celularUsuario.style.display = "block";
                document.getElementById('inputCelular').focus();
                return false;

            } else {

                celularUsuario.style.display = "none";

            }


            if (document.getElementById('inputTelefone').value == "" || document.getElementById('inputTelefone').value == null) {
                telefone.style.display = "block";
                document.getElementById('inputTelefone').focus();
                return false;

            } else {

                telefone.style.display = "none";

            }


            if (document.getElementById('inputSite').value == "") {
                site.style.display = "block";
                document.getElementById('inputSite').focus();
                return false;

            } else {

                site.style.display = "none";

            }


            if (document.getElementById('inputEmail').value == "" || document.getElementById('inputEmail').value == null) {
                msgemail.style.display = "block";
                document.getElementById('inputEmail').focus();
                return false;

            } else {
                msgemail.style.display = "none";

            }
            
            if (document.getElementById('inputEmail').value.length > 0) {



                        var email = $("#inputEmail").val();
                        if (email != "") {
                            //var filtro = /^([w-]+(?:.[w-]+)*)@((?:[w-]+.)*w[w-]{0,66}).([a-z]{2,6}(?:.[a-z]{2})?)$/i;
                            //var filto = /^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$/i;
                            //var filtro = /^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$/i;
                            var filtro = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                     
                            if (filtro.test(email)) {
                                msgemail2.style.display = "none";
                                
                            } else {
                                msgemail2.style.display = "block";
                                return false;
                            }
                        } 
                    
            

            }

                

            


            


            

            

        }






    </script>


</head>

<body>
    <form runat="server" id="form1">
        <header>
            <nav class="navbar">

                <a class="navbar-brand navbar-center">
                    <img src="assets/img/favicons/e.png" />
                </a>


            </nav>
        </header>

        <main role="main">

        <section class="container" style="margin-top: 50px">
            <div class="row">
                <aside class="col-sm-6">
                    <h3 class="subtitle-doc">Cadastro
                        
                    </h3>
                    <div id="code_register_1">
                        <div class="card">
                            
                            <article class="card-body">
                                <form>
                                    <div class="form-row">
                                        <div class="col form-group">
                                            <label>Nome da Instituição</label>
                                            <input type="text" class="form-control" id="inputNome" name="inputNome" placeholder="" autofocus >
                                            <span class="alert-danger validaNomeCampo" style="display:none">O campo <strong>Nome</strong> é obrigatório. Digite um nome válido.
                            </span>
                                        </div> <!-- form-group end.// -->

                                    </div> <!-- form-row end.// -->
                                   
   
                                    <div class="form-group">
                                            <label>Contato / WhatsAPP </label>
                                            <input type="text" class="form-control" id="inputCelular" name="inputCelular" placeholder="">
                                        <span class="alert-danger validaCelularCampo" style="display:none">O campo <strong>Celular / WhatsApp</strong> é obrigatório.
                            </span>
                                        </div>

                                    <div class="form-group">
                                            <label>Telefone fixo </label>
                                            <input type="text" class="form-control" id="inputTelefone" name="inputTelefone" placeholder="">
                                        <span class="alert-danger validaTelefone" style="display:none">O campo <strong>Telefone fixo</strong> é obrigatório.
                            </span>
                                        </div>




                                         <div class="form-group">



                                            <label>Site</label>
                                            <input type="text" class="form-control" id="inputSite" name="inputSite" placeholder="">
                                        <span class="alert-danger validaSite" style="display:none">O campo <strong>Site</strong> é obrigatório.
                            </span>
                                             </div>
                                                   <div class="form-group">
                                            <label>E-mail</label>
                                            <input type="text" class="form-control" id="inputEmail" name="inputEmail" placeholder="">
                                        <span class="alert-danger validaEmail" style="display:none">O campo <strong>E-mail</strong> é obrigatório  .
                            </span>
                                        <span class="alert-danger validaEmail2" style="display:none">Informe um<strong>E-mail</strong> válido.
                            </span>     
                                    </div> <!-- form-group end.// -->
                                    
                                       
   
                                    
                                 

                                    <div class="form-group">

                                          <asp:Button ID="btnEnviar" CssClass="btn btn-primary btn-block" runat="server" Text="Cadastrar" OnClientClick=" return validate()" OnClick="btnEnviar_Click" />
    
                                    </div> <!-- form-group// -->
                                    
                                </form>
                            </article> <!-- card-body end .// -->
                            <div class="border-top card-body text-center">Já tenho cadastro? <a href="singin.aspx">Entrar</a></div>
                                        <p> Dúvida? Fale conosco pelo e-mail <br> <spam> <img src="assets/img/favicons/email.png" height="32" /> </spam>sac@evestibular.com.br</p>
                                           
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

</html>
