
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="matriculaAluno.aspx.cs" Inherits="matriculaAluno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">


      
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>e-vestibular</title>
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
       <script language="javascript" type="text/javascript">
           function validate() {
               var msgRG = document.querySelector('.validaUploadRg');
               var msgCpf = document.querySelector('.validaUploadCpf');
               var msgTituloEleitor = document.querySelector('.validaUploadTituloEleitor');
               var msgCarteira = document.querySelector('.validaUploadCarteira');
               var msgComprovanteResidencia = document.querySelector('.validaUploadComprovanteResidencia');
               var msgCertidaoNascimento = document.querySelector('.validaUploadCertidaoNascimento');
               var msgHistorico = document.querySelector('.validaUploadHistorico');
               var msgFoto = document.querySelector('.validaUploadFoto');
               var msgContrato = document.querySelector('.validaUploadContrato');
               var msgBolsa = document.querySelector('.validaUploadBolsa');
               
               

               
           
               if (document.getElementById('fileRG').value == '') {
                   msgRG.style.display = "block";
                   document.getElementById('fileRG').focus();
                   return false;
               } else {
                   msgRG.style.display = "none";

               }

                
               if (document.getElementById('filecpf').value == '') {
                   msgCpf.style.display = "block";
                   document.getElementById('filecpf').focus();
                   return false;
               } else {
                   msgCpf.style.display = "none";

               }

               if (document.getElementById('fileTituloEleitor').value == '') {
                   msgTituloEleitor.style.display = "block";
                   document.getElementById('fileTituloEleitor').focus();
                   return false;
               } else {
                   msgTituloEleitor.style.display = "none";

               }


               if (document.getElementById('fileCarteiraReservista').value == '') {
                   msgCarteira.style.display = "block";
                   document.getElementById('fileCarteiraReservista').focus();
                   return false;
               } else {
                   msgCarteira.style.display = "none";

               }

               if (document.getElementById('fileComprovanteResidencia').value == '') {
                   msgComprovanteResidencia.style.display = "block";
                   document.getElementById('fileComprovanteResidencia').focus();
                   return false;
               } else {
                   msgComprovanteResidencia.style.display = "none";

               }

               if (document.getElementById('fileCertidaoNascimento').value == '') {
                   msgCertidaoNascimento.style.display = "block";
                   document.getElementById('fileCertidaoNascimento').focus();
                   return false;
               } else {
                   msgCertidaoNascimento.style.display = "none";

               }

               if (document.getElementById('fileHistorico').value == '') {
                   msgHistorico.style.display = "block";
                   document.getElementById('fileHistorico').focus();
                   return false;
               } else {
                   msgHistorico.style.display = "none";

               }
               if (document.getElementById('fileFoto').value == '') {
                   msgFoto.style.display = "block";
                   document.getElementById('fileFoto').focus();
                   return false;
               } else {
                   msgFoto.style.display = "none";

               }

               if (document.getElementById('fileContrato').value == '') {
                   msgContrato.style.display = "block";
                   document.getElementById('fileContrato').focus();
                   return false;
               } else {
                   msgContrato.style.display = "none";

               }
               if (document.getElementById('fileBolsa').value == '') {
                   msgBolsa.style.display = "block";
                   document.getElementById('fileBolsa').focus();
                   return false;
               } else {
                   msgBolsa.style.display = "none";

               }
               

           }
   </script>

</head>
    <body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">HCODE</span>
      <!-- logo for regular state and mobile devices -->
     
        <img src="<%=Session["logo"].ToString() %>" class="logo-lg" alt="User Image" width="200px" height="50px">
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="dist/img/avatar5.png" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs"><%=Session["sigla"] %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="dist/img/avatar5.png" class="img-circle" alt="User Image">

                <p>
                  Fulano Junior - Web Developer
                  <small>Membro desde Abr. 2018</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Perfil</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sair</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
           <img src="<%=Session["logo"].ToString() %>" class="logo-lg" alt="User Image" width="200px" height="50px">
        </div>
        <div class="pull-left info">
          <p><%=Session["sigla"].ToString()%></p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="resultado.aspx"><i class="fa fa-users"></i> <span>Resultado</span></a></li>
          <li class="active"><a href="matriculaAluno.aspx"><i class="fa fa-users"></i> <span>Matrícula</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   

    <!-- Main content -->
    <section class="content container-fluid">

 

    <div class="container-fluid" >
        <div class="row">
            <div class="col">
                <h1 style="text-align:center">Matrícula</h1>
                <h2>mensagem para aluno</h2>
                <p>Nome : <%=Session["nome"].ToString() %></p>
                <p>CPF : <%=Session["cpf"].ToString() %></p>
                <form runat="server" id="fplImagem">
                RG    <asp:FileUpload ID="fileRG" name="fileRG" cssClass="form-control" runat="server"></asp:FileUpload>
                    <span class="alert-danger validaUploadRg" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span> 
                CPF    <asp:FileUpload ID="filecpf" name="fileCpf" cssClass="form-control" runat="server" /> 
                <span class="alert-danger validaUploadCpf" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span> 
                Título de eleitor    <asp:FileUpload ID="fileTituloEleitor" name="fileTituloEleitor" cssClass="form-control" runat="server" />
                    <span class="alert-danger validaUploadTituloEleitor" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span>  
                Carteira de reservista    <asp:FileUpload ID="fileCarteiraReservista" name="fileCarteiraReservista" cssClass="form-control" runat="server" />
                    <span class="alert-danger validaUploadCarteira" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span>  
                Comprovante de resisdência    <asp:FileUpload ID="fileComprovanteResidencia" name="fileComprovanteResidencia" cssClass="form-control" runat="server" />
                    <span class="alert-danger validaUploadComprovanteResidencia" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span>  
                Certidão de nascimento    <asp:FileUpload ID="fileCertidaoNascimento" name="fileCertidaoNascimento" cssClass="form-control" runat="server" />
                    <span class="alert-danger validaUploadCertidaoNascimento" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span>  
                Histórico escolar (autenticado)    <asp:FileUpload ID="fileHistorico" name="fileHistorico" cssClass="form-control" runat="server" /> 
                    <span class="alert-danger validaUploadHistorico" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span> 
                Foto 3/4    <asp:FileUpload ID="fileFoto" name="fileFoto" cssClass="form-control" runat="server" />
                    <span class="alert-danger validaUploadFoto" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span>
                   <%string arquivo = "arquivos/Contrato/contrato_" + Session["faculdadeId"].ToString() + ".docx"; %> 
                    <%if (Session["faculdadeId"].ToString() == "1" || Session["faculdadeId"].ToString() =="2") {%>
                <a href="<%=arquivo %>"><input type="button" class="btn btn-primary" value="Clique aqui para Baixar contrato" /> </a> <br>
                 


                Contrato    <asp:FileUpload ID="fileContrato" name="fileContrato" cssClass="form-control" runat="server" />
                    <span class="alert-danger validaUploadContrato" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span>  
                    <%} %>


                    UPLOAD DA CARTA DE ADESÃO PARA ALUNOS BOLSISTAS
                    <asp:FileUpload ID="fileBolsa" name="fileBolsa" cssClass="form-control" runat="server" />
                    <span class="alert-danger validaUploadBolsa" style="display:none"><strong>Selecione o arquivo a ser enviado.</strong>
                            </span> 
                 <div class="row">
                    
                    <div class="col" style="padding:15px">
                       <p> SCANEAR os documentos abaixo e fazer um UPLOAD dos documentos em um único arquivo. Na ordem que segue abaixo.</p>
                        <ul>
                            <li>RG;</li>
                             <li>CPF;</li>
                            <li>Título de eleitor; </li> 
                            <li>Carteira de Reservista;</li>
                             <li>Comprovante de residência;</li> 
                            <li>Certidão de Nascimento;</li>
                             <li>Histórico Escolar Autenticado;</li>
                             <li>2 fotos 3/4;</li>
                         <li>Boletim de Desempenho</li>
                      
                            </ul>
                        <p style="text-align:justify">
Contrato Preenchido e assinado
Para aluno ingressante, com bolsa de estudo, além dos documentos pessoais acima citados, solicitamos comprovante de pagamento e Carta de Adesão ou contrato da bolsa
ENVIAR PARA matriculafatec@evestibular.com.br</p>
                    </div>
                </div>
                <div class="row">
                    
                    <div class="col-lg-3">
                   <asp:Button ID="btnEnviar" CssClass="btn btn-primary btn-block" runat="server" Text="Enviar" OnClientClick=" return validate()" OnClick="btnEnviar_Click" />
                </div>
                    </div>    
                </form>
                
                
            </div>
        </div>
    </div>

        </section>

  <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      <a target="_blank" href="#"></a>
    </div>
    <!-- Default to the left -->

  </footer>

</div>

</body>

</html>
