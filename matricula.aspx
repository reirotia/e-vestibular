<%@ Page Title="" Language="C#" MasterPageFile="~/masterAcompanhamento.master" AutoEventWireup="true" CodeFile="matricula.aspx.cs" Inherits="matricula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
          meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Menu</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <img src="assets/img/logo/1.png" width="200px" />
                    <h3>O candidato participou do evestibular online</h3>

                    <div style="text-align: justify; padding-top: 30px;">

                        <h4>Data e hora do início de Vestibular online:</h4>
                        <h4>Data e hora do fim do Vestibular online:</h4>
                        <h4>Gravação da Prova: </h4>
                        <p></p>
                        <h4>NOME DO CANDIDATO(A):</h4>
                        <h4>CPF:</h4>
                        <h4>NOTA DA PROVA SUBJETIVA(REDAÇÃO):</h4>
                        <h4>SITUAÇÃO DO CANDIDATO(A):</h4>
                            <h4>ESCORE GLOBAL: </h4>
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

