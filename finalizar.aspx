<%@ Page Language="C#" AutoEventWireup="true" CodeFile="finalizar.aspx.cs" Inherits="finalizar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/styloInfo.css" rel="stylesheet" />
    <!------ Include the above in your HEAD tag ---------->
    <link href="css/styleMaster.css" rel="stylesheet" />




</head>
<body>
    <form runat="server">
        <nav class="navbar navbar-center">

            <a class="navbar-brand navbar-center">
                <img src="assets/img/favicons/e.png" />
            </a>


        </nav>
        <div class="container">
            <h2></h2>
            <div class="row">

                <div class="col-md-12 col-lg-12">
                    <div id="tracking-pre"></div>
                    <div id="tracking">

                        <div class="tracking-list">
                             <% System.Data.DataSet dsMensagem = Session["ds"] as System.Data.DataSet;  %>
                                           
                             <%for (int i = 0; i < dsMensagem.Tables[0].Rows.Count; i++) %>
                              <%{ %>
                            <div class="tracking-item">
                                <div class="tracking-icon status-intransit">
                                    <svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                        <path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path>
                                    </svg>
                                    <!-- <i class="fas fa-circle"></i> -->
                                </div>
                                <div class="tracking-content">
                                    <span><%=dsMensagem.Tables[0].Rows[i]["mensagem"] %>
                                    </span>
                                </div>
                            </div>
                            <%} %>
                            
                            
                            

                            
                            

                        </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
