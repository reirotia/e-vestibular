<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy (2) of singin.aspx.cs" Inherits="singin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>E-vestibular</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/3.2.1/jquery.min.js"></script>
    <link href="css/styleMaster.css" rel="stylesheet" />
    <link href="css/StyleSingin.css" rel="stylesheet" />
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/jquery.maskedinput.min.js"></script>
    <script src="assets/js/jquery.validate.min.js"></script>




    <script type="text/javascript">
        jQuery(function ($) {
            $("#inputData").mask("99/99/9999");
            $("#inputCelular").mask("(99) 99999-9999");
            $("#inputTelefoneFixo").mask("(99) 9999-9999");

            $("#inputCpf").mask("999.999.999-99");
            $("#inputCep").mask("99999-999");
        });
    </script>

</head>
<body>
    <nav class="navbar navbar-center">

        <a class="navbar-brand navbar-center">
            <img src="assets/img/favicons/e.png" />
        </a>


    </nav>

    
        <form id="form1" runat="server">

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    

    <!-- Login Form -->

      <input type="text"  class="fadeIn second" name="inputCpf" id="inputCpf" maxlength="14" placeholder="Para fazer o login digite CPF" required autofocus>
      
      <button type="button" class="btn btn-primary btn-block" onclick="logar();">Entrar </button>
        
        <asp:LinkButton ID="lnkLogin" CssClass="fadeIn fourth" name="lnkLogin" runat="server" OnClick="lnkLogin_Click" Style="display: none">LinkButton</asp:LinkButton>

    
    <!-- Remind Passowrd -->
    <div id="formFooter">
    <p> Dúvida ?  Fale conosco pelo e-mail <br> <spam> <img src="assets/img/favicons/email.png" height="32" /> </spam>sac@evestibular.com.br</p>
                                            
    </div>

  </div>
</div>
        </form>

</body>

    <script>
        function logar() {
            //document.getElementById('mensagem').style = "display:block"

            document.getElementById('<%=lnkLogin.ClientID%>').click();


    }

</script>
    

</html>
