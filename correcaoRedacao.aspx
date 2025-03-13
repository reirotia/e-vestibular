<%@ Page Language="C#" AutoEventWireup="true" CodeFile="correcaoRedacao.aspx.cs" Inherits="correcaoRedacao" %>



<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>


    <script type="text/javascript" src="js/jquery.min.js"> </script>
    <script type="text/javascript" src="js/notification.js"> </script>
    <script type="text/javascript" src="js/timer.js"> </script>


    <style>
.charts, .row {
    margin: -2em 0 0;
}

.form-control1, .form-control_2.input-sm {
    border: 1px solid #ccc;
    padding: 5px 8px;
    color: #616161;
    background: #fff;
    box-shadow: none !important;
    width: 100%;
    font-size: 0.85em;
    font-weight: 300;
    height: 40px;
    font-size: 17px;
    border-radius: 0;
    -webkit-appearance: none;
    resize: none;
}

.notes {
    width: 100%;
    background-attachment: local;
    
    background-image: linear-gradient(to right, white 10px, transparent 10px), linear-gradient(to left, white 10px, transparent 10px),
                        repeating-linear-gradient(white, white 41px, black 41px, black 43px);
    line-height: 43px;

    padding: 8px 10px;
    border: none;
    margin-left: -9px;
    margin-right: 0px;
    outline: none;
	font-size: 20px;
}

.charts, .row {
    margin: 1em 0 0;
}


.text-center .img-responsive {
    margin: 0 auto;
}

</style>


    <link href="css/style.css" rel="stylesheet">
    <!------ Include the above in your HEAD tag ---------->
 

</head>

<body>
    <div class="container">
        <form id="per" runat="server">
            <%System.Data.DataSet ds = Session["ds"] as System.Data.DataSet; %>
    
            <%if (ds.Tables[0].Rows.Count>0 ) {%>
            <input type="text" id="codEletronico" name="codEletronico" style="display:none" value="<%=ds.Tables[0].Rows[0]["codEletronico"].ToString()  %>"  />
            <%} else {%>
            <input type="text" id="Text1" name="Text1" style="display:none" value="---%>"  />
            
            <%} %>

            <div class="stepwizard">
                <div class="stepwizard-row setup-panel">


                    <div class="stepwizard-step col-xs-1">
                        <a href="#step-21" type="button" class="btn btn-success">Correção Redação</a>
                        <p></p>
                    </div>
                </div>
            </div>

       

            <div class="panel panel-primary setup-content" id="step-21">
                <div class="panel-heading">
                    <%if (ds.Tables[0].Rows.Count>0 ) {%>
                    <h3 class="panel-title"> <%=ds.Tables[0].Rows[0]["nome"].ToString()%> - <%=ds.Tables[0].Rows[0]["cpf"].ToString()%>
                    </h3>
                        <%} else { %>
                    <h3 class="panel-title"> Não há correção para fazer
                    </h3>
                        <%} %>
                    
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="radio">
                            <%if (ds.Tables[0].Rows.Count>0 ) {%>
                            <textarea class="notes" name="textarea" id="textarea"
                                rows="20" cols="155"
                                maxlength="1500"><%=ds.Tables[0].Rows[0]["redacao"].ToString() %></textarea>
                            <input type="text" id="resposta" name="resposta" style="display: none" />
                            
                            <%} else { %>
                            <textarea class="notes" name="textarea" id="textarea1"
                                rows="20" cols="155"
                                maxlength="1500">Não há correção para fazer</textarea>
                            
                            <%} %>
                            <div class="row">
                                <div class="col-lg-3">
                                    <button class="btn btn-success pull-right" type="button" onclick="finalizar();">Finalizar!</button>
                                    <asp:LinkButton ID="lnkLogin" CssClass="fadeIn fourth" name="lnkLogin" runat="server" OnClick="lnkLogin_Click" Style="display: none">LinkButton</asp:LinkButton>

                                </div>
                                <div class="col-lg-3">
                                    <input type="text" id="txtNota" name="txtNota" class="form-control" placeholder="Informa a Nota da redação" />
                            
                                </div>

                                
                            </div>
                            <div id="redacao" class="alert alert-danger" role="alert" style="display:none" >
                                Informe a nota da redação.
                                </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>


        </form>
    </div>
</body>

<footer>
    <script src="js/javaScript.js"></script>
    <script>
        function step(op) {
            $(document).ready(function () {
                $('div.setup-panel div a[href="#' + op + '"]').addClass('btn-danger');

            });
        }
    </script>

    <script>
        function finalizar() {
            
                if (document.getElementById('txtNota').value == "") {
                    document.getElementById('redacao').style = "display:block";
                   
                    return;
                }
                else {
                    document.getElementById('redacao').style = "display:none";
                    document.getElementById('<%=lnkLogin.ClientID%>').click();

                }

        }
    </script>
    
    



    

    
</footer>
</html>
