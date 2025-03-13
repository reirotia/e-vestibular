<%@ Page Language="C#" AutoEventWireup="true" CodeFile="acompanhamento.aspx.cs" Inherits="acompanhamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Menu</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

    <script>
        function processarAluno(codEletronico) {
            alert(codEletronico);


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
      <span class="logo-lg">HCODE</span>
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
              <span class="hidden-xs">FATEC</span>
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
          <img src="dist/img/avatar5.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>FATEC</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><i class="fa fa-users"></i> <span>Resultado</span></a></li>
          <li class="active"><a href="#"><i class="fa fa-users"></i> <span>Matrícula</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   

    <!-- Main content -->
    <section class="content container-fluid">

      <div class="row">
        <div class="col-md-12">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Acompanhmento do processo seletivo </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              
                       <div id="boletim" class="form-group" >

                <div style="text-align: center; padding-top: 100px;">
                    <img src="assets/img/logo/logo-meio-paginas-2.png" />
                    <h2>Boletim de desempenho</h2>
                    <h2>Vestibular online 2025.2</h2>
                   
                    <h2>O candidato participou do evestibular online</h2>
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
                                  <p>Nome : <%=ds.Tables[0].Rows[0]["nome"].ToString() %></p> 
                              <p>Data inscrição : <%=ds.Tables[0].Rows[0]["dtinscricao"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                                <p>Nota Redação : <%=ds.Tables[0].Rows[0]["TipoProva8"]%></p> 
                                <%if (Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva8"]) < 400)%>
                                <%{ %>
                                <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na prova de redação.</p>
                                 <%}  else {%>
                                   <p>Situação do processamento : Aprovado.</p>
                                 <input type="button" class="btn btn-success" value="Faça sua matrícula" /> 

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
                              <p>Nome : <%=ds.Tables[0].Rows[0]["nome"].ToString() %></p> 
                              <p>Data inscrição : <%=ds.Tables[0].Rows[0]["dtinscricao"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p> 
                               <p>Data prova : <%=ds.Tables[0].Rows[0]["dtProvaFinalizada"]%></p>
                                <%int nota = Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva1"]) + Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva4"]);  %>
                                <p>Nota Objetiva : <%=nota%></p> 
                                     
                                <p>Nota Redação : <%=ds.Tables[0].Rows[0]["TipoProva8"]%></p> 
                                <%if (Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva8"]) < 400 && nota < 400 )%>
                                <%{ %>
                                <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na prova de redação e nas Provas objetivas.</p>
                                 <%}  else if (Convert.ToInt32(ds.Tables[0].Rows[0]["TipoProva8"]) < 400) {%>
                                   <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na prova de redação.</p>
                                 
                                 <%} else if (nota<400) {%>
                                   <p>Situação do processamento : ELIMINADO - Não atingiu nota mínima na provas de objetivas.</p>
                                <%} else {%>
                                <p>Situação do processamento : Aprovado.</p>
                                        <input type="button" class="btn btn-success" value="Faça sua matrícula" /> 

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
