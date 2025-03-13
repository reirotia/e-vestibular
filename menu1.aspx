<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu1.aspx.cs" Inherits="menu" %>

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
    <script src="js/jquery-3.3.1.min.js"></script>

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
        <li class="active"><a href="#"><i class="fa fa-users"></i> <span>Usuários</span></a></li>
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
              <h3 class="box-title">Lista de Usuários</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Processo</th>
                    <th>Status</th>
                    <th></th>
                    <th></th>
                    
                  </tr>
                </thead>
                <tbody>
                    <%System.Data.DataSet ds = Session["ds"] as System.Data.DataSet; %>
                      <%for (int i=0; i<ds.Tables[0].Rows.Count; i++ ) %>
                      <%{ %>
                  <tr>

                    <td><%=ds.Tables[0].Rows[i]["nome"] %></td>
                    <td><%=ds.Tables[0].Rows[i]["cpf"] %></td>
                    <td><%=ds.Tables[0].Rows[i]["processo"] %></td>
                    <td id="<%=ds.Tables[0].Rows[i]["cpf"] %>"><%=ds.Tables[0].Rows[i]["status"] %></td>
                    <%if (ds.Tables[0].Rows[i]["nomeArquivo"].ToString().Length>0)  %>
                    <%{ %>   
                    <td>
                    
                        <button type="button" class="btn btn-success btn-xs btn-flat" onclick="aprovar('<%=ds.Tables[0].Rows[i]["codEletronico"] %>')">Aprovar</button>
                    </td>
                      <td>
                          <button type="button" class="btn btn-danger btn-xs btn-flat" onclick="pendente()">Indeferir</button>
                    </td>
                      <%} %>
                      <%else %>
                      <%{ %>
                      <td>----</td>
                      <td>----</td>
                              
                      <%} %>
                  </tr>
                    <%if (ds.Tables[0].Rows[i]["nomeArquivo"].ToString().Length>0)  %>
                    <%{ %>
                    <%string img = "arquivos/" + ds.Tables[0].Rows[i]["nomeArquivo"].ToString(); %>
                    <tr id="<%=ds.Tables[0].Rows[i]["codEletronico"]%>"><td><img src="<%=img%>"  /></td></tr>
                    <%} %>
                    <%} %>
                  
                  
                </tbody>
              </table>
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
   
    


    <script>
        var NMHOST = "Service.asmx?op=HelloWorld";
        
        var URLWEBSERVICE = "https://" + NMHOST;
        var soapRequest = '<?xml version="1.0" encoding="utf-8"?><soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"> <soap12:Body>    <HelloWorld xmlns="http://tempuri.org/">      <ok>ioioioi</ok>    </HelloWorld>  </soap12:Body></soap12:Envelope>'
        function pendente() {
           
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
             
                var nova = $(req.responseXML).find("EditardoclancamentoDigitalizacaoResult").text();
                alert(nova);
                document.getElementById('79023665520').innerHTML = "Aprovado";

            }
            function processError(data, status, req) {

            }


        }
        
</script>
             



          







</html>
