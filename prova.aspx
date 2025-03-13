<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prova.aspx.cs" Inherits="_prova" %>


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
            <%System.Data.DataSet dsResposta; %>
            
            <%CAD.ManipulacaoBanco bd = new CAD.ManipulacaoBanco(); %>
            <%int teste = 0; %>
            <div class="stepwizard">
                <div class="stepwizard-row setup-panel">



                    <div class="stepwizard-step col-xs-1">
                        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
                        <p></p>
                    </div>
                    <%for (int i = 1; i < ds.Tables[0].Rows.Count ; i++) %>
                    <%{ %>
                    <div class="stepwizard-step col-xs-1">
                        <%int p = i + 1; %>
                        <a href="#step-<%=p%>" type="button" class="btn btn-default btn-circle" onclick="step(<%=p%>);" disabled="disabled"><%=p%></a>
                        <p></p>
                    </div>
                    <%} %>

                </div>
            </div>

            <input type="text" id="codEletronico" name="codEletronico" style="display:none" value="<%=Session["codEletronico"].ToString()%>"  />
            <input type="text" id="faculdadeId" name="faculdadeId" style="display:none" value="<%=Session["faculdadeId"].ToString()%>"  />



            
            <div class="panel panel-primary setup-content" id="step-1">
                <div class="panel-heading" style="text-align: center">
               
                         <%System.Data.DataSet dsTipoProva; %>
                    <%dsTipoProva = bd.ConsultaSQL("select tipo from vTipoProva where tipoProvaid=" + ds.Tables[0].Rows[0]["tipo-prova"].ToString()); %>
                    <%=dsTipoProva.Tables[0].Rows[0]["tipo"].ToString()%>
                    <span class="form-group">Tempo restante<p class="form-group" id="time"></p>
                    </span>

                </div>
                <div class="panel-heading">
                    <h3 class="panel-title">1 - <%=ds.Tables[0].Rows[0]["pergunta"].ToString()%></h3>
                </div>
                <%if (ds.Tables[0].Rows[0]["img"].ToString() != "0") %>
                <%{ %>
                <%string img = "img/" + ds.Tables[0].Rows[0]["img"].ToString() + ".png";%>
                <div style="text-align: center; overflow: auto; height: 230px">
                    <img src="<%=img%>" />
                </div>
                <%} %>
                <div class="panel-body">

                    <div class="form-group">
                        <div class="radio">
                            <fieldset id="group1">
                                <%dsResposta = bd.ConsultaSQL("select * from vresposta where [cod-pergunta]=" + ds.Tables[0].Rows[0]["cod-pergunta"].ToString()); %>
                                <%for (int x = 0; x < dsResposta.Tables[0].Rows.Count; x++)%>
                                <% {%>

                                <div class="form-group">
                                    <label class="radio" for="<%=dsResposta.Tables[0].Rows[x]["resposta"].ToString()%>">
                                        <input type="radio" name="rd1" id="<%=x%>" value="<%=dsResposta.Tables[0].Rows[x]["respostaCod"].ToString()%>" onchange="valor(<%=x%>,<%=ds.Tables[0].Rows[0]["cod-pergunta"].ToString()%>)" />
                                        <%=dsResposta.Tables[0].Rows[x]["resposta"].ToString()%>
                                    </label>

                                </div>

                                <%} %>
                                <fieldset id="Fieldset1">

                                    <input id="ques1" name="ques1" maxlength="200" style="display: none" type="text" required="required" class="form-control" placeholder="Enter Company Name" />
                        </div>

                    </div>
                    <button class="btn btn-primary nextBtn pull-right" type="button">Avançar</button>
                </div>
            </div>
            <%for (int y = 1; y < ds.Tables[0].Rows.Count ; y++)%>
            <%{ %>
            <%int pp = y + 1; %>
            <div class="panel panel-primary setup-content" id="step-<%=pp%>">
                <div class="panel-heading" style="text-align: center">

                    <%dsTipoProva = bd.ConsultaSQL("select tipo from vTipoProva where tipoProvaid=" + ds.Tables[0].Rows[y]["tipo-prova"].ToString()); %>
                    <%=dsTipoProva.Tables[0].Rows[0]["tipo"].ToString()%>
                    <span class="form-group">Tempo restante<p class="form-group"></p>

                </div>
                <div class="panel-heading">
                    <h3 class="panel-title"><%=pp %> - <%=ds.Tables[0].Rows[y]["pergunta"].ToString() %></h3>

                </div>
                <%if (ds.Tables[0].Rows[y]["img"].ToString() != "0") %>
                <%{ %>
                <%string img = "img/" + ds.Tables[0].Rows[y]["img"].ToString() + ".png";%>
                <div style="text-align: center; overflow: auto; height: 230px">
                    <img src="<%=img%>" />
                </div>
                <%} %>

                <div class="panel-body">
                    <div class="form-group">
                        <div class="radio">
                            <fieldset id="Fieldset2">
                                <%dsResposta = bd.ConsultaSQL("select * from vresposta where [cod-pergunta]=" + ds.Tables[0].Rows[y]["cod-pergunta"].ToString()); %>
                                <%for (int x = 0; x < dsResposta.Tables[0].Rows.Count; x++)%>
                                <% {%>
                                <div class="form-group">
                                
                                <label class="radio">
                                    <input type="radio" name="rd<%=y%>" id="<%=dsResposta.Tables[0].Rows[x]["respostaCod"].ToString() %>" value="<%=dsResposta.Tables[0].Rows[x]["respostaCod"].ToString() %>" onchange="valor2(<%=pp%>,<%=dsResposta.Tables[0].Rows[x]["respostaCod"].ToString() %>,<%=ds.Tables[0].Rows[y]["cod-pergunta"].ToString() %>)"><%=dsResposta.Tables[0].Rows[x]["resposta"].ToString() %>
                                </label>
                                </div>
                                    <%} %>
                                <input id="ques<%=pp%>" name="ques<%=pp%>" maxlength="200" style="display: none" type="text" required="required" class="form-control" placeholder="Enter Company Name" />

                            </fieldset>
                        </div>
                    </div>
                    <%if (y < 9) %>
                    <% {%>

                    <button class="btn btn-primary nextBtn pull-right" type="button">Avançar</button>
                    <%} else { %>
                    <div class="form-group">
                        <div class="radio">
                            <div id="Div1" class="alert alert-danger" role="alert" style="display: none">
                                Existe uma ou mais questões não respondidas!
                            </div>

                            <div id="Div2" class="alert alert-success" role="alert" style="display: none">
                                Parabéns você concluio a prova com sucesso!
                            </div>
                            <button class="btn btn-success pull-right" type="button" onclick="finalizar();">Finalizar!</button>
                            <asp:LinkButton ID="LinkButton1" CssClass="fadeIn fourth" name="lnkLogin" runat="server" OnClick="lnkLogin_Click" Style="display: none">LinkButton</asp:LinkButton>


                        </div>
                    </div>
                    <%} %>
                </div>

            </div>
            <%} %>



            <div class="panel panel-primary setup-content" id="step-10">
               
                <div class="panel-body">
                    <div class="form-group">
                        <div class="radio">

                            <input type="text" id="resposta" name="resposta" style="display: none" />
                            <div id="mensagem" class="alert alert-danger" role="alert" style="display: none">
                                Existe uma ou mais questões não respondidas!
                            </div>
                            <div id="redacao" class="alert alert-danger" role="alert" style="display: none">
                                A redação deve conter no mínimo 300 e no máximo 1500 caracteres.
                            </div>
                            <div id="sucesso" class="alert alert-success" role="alert" style="display: none">
                                Parabéns você concluio a prova com sucesso!
                            </div>
                            <button class="btn btn-success pull-right" type="button" onclick="finalizar();">Finalizar!</button>
                            <asp:LinkButton ID="lnkLogin" CssClass="fadeIn fourth" name="lnkLogin" runat="server" OnClick="lnkLogin_Click" Style="display: none">LinkButton</asp:LinkButton>


                        </div>
                    </div>
                </div>
            </div>


        </form>
    </div>
</body>

   
<script>
    function finalizar() {
        var i;
        var resposta;
        document.getElementById('mensagem').style = "display:none";
        document.getElementById('resposta').value = '';
        for (i = 1; i < 11; i++) {
            if (document.getElementById('ques' + i).value == "") {
                document.getElementById('mensagem').style = "display:block";
                return;
            } else {

                document.getElementById('mensagem').style = "display:none";
                document.getElementById('resposta').value = document.getElementById('resposta').value + document.getElementById('ques' + i).value + '|';

            }
        }
        
        //alert(document.getElementById('textarea').value);
        document.getElementById('<%=lnkLogin.ClientID%>').click();

    }
</script>

<script>
    function valor(opp, opp1) {

        document.getElementById('ques1').value = document.getElementById(opp).value + '-' + opp1;

    }
    function valor2(nome, op2, op3) {

        document.getElementById('ques' + nome).value = document.getElementById(op2).value + '-' + op3;

    }
</script>

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
        (function () {
            var count = 0;
            var hidden = "hidden";
            if (hidden in document) document.addEventListener("visibilitychange", onchange);
            else if ((hidden = "mozHidden") in document) document.addEventListener("mozvisibilitychange", onchange);
            else if ((hidden = "webkitHidden") in document) document.addEventListener("webkitvisibilitychange", onchange);
            else if ((hidden = "msHidden") in document) document.addEventListener("msvisibilitychange", onchange);
            else if ('onfocusin' in document) document.onfocusin = document.onfocusout = onchange;
            else window.onpageshow = window.onpagehide = window.onfocus = window.onblur = onchange;

            function onchange(evt) {
                var evtMap = {
                    focus: true,
                    focusin: true,
                    pageshow: true,
                    blur: false,
                    focusout: false,
                    pagehide: false
                };

                evt = evt || window.event;
                if (evt.type in evtMap) evtMap[evt.type] ? functionVisible() : functionHidden();
                else this[hidden] ? functionHidden() : functionVisible();
            }
            var s_item = "";
            
            function functionVisible() {
                console.log('Visible');
                //alert(JSON.parse(localStorage.getItem(s_item)));
                var count = JSON.parse(localStorage.getItem(s_item));
                count++;
                
                if (count > 5) {
                    window.location.href = "info.aspx";
                    localStorage.setItem(s_item, 0);
                    return;
                           }
                localStorage.setItem(s_item, count);

                window.location.reload();

            }

            function functionHidden() {
                console.log('Hidden');
            }
        })();

    </script>

    <script>
        /*
        setTimeout(function () {
            window.location.href = "info.aspx";
        }, 3000000);
        */
    </script>




    <script>
        $(function () {
            function num(number) {
                return (number >= 10) ? number : '0' + number;
            }

            function convertEmTempo(segundos) {
                var hora = Math.floor((segundos / 3600));
                var qtdSec = hora * 3600;
                var restante = segundos - qtdSec;
                var minutos = Math.floor((restante / 60));
                qtdSec = minutos * 60;
                var segundos = restante - qtdSec;
                return num(hora) + ':' + num(minutos) + ':' + num(segundos);
            }

            function convertEmSegundos(time) {

                var tempo = time.split(':');
                var horaSec = (tempo[0] * 60) * 60;
                var minSec = (tempo[1] * 36);
                return horaSec + minSec + tempo[2];
            }



            var segundos = convertEmSegundos('00:02:01');
            var t = setInterval(function () {
                segundos -= 1;
                $('.form-group p').html(convertEmTempo(segundos));

                if (segundos == 0) {
                    var icon = 'https://unibolsasbrasil.com.br/assets/img/logo-unibolsas.png';
                    var title = 'Evestibular';
                    var mensagem = "Tempo encerrado";
                    var link = 'index.aspx';
                    notifyMe(icon, title, mensagem, link);
                    
                    clearInterval(t);
                    window.location.href = "info.aspx";
                }
            }, 1000);

        });



    </script>

    <video width="600" height="400" autoplay></video>


    <script>
        function ver() {
            /*
            var v = document.getElementsByTagName("video");
            v.play();
            */
        }
    </script>
    <script type="text/javascript">
        navigator.getUserMedia = (
        navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia ||
        navigator.msGetUserMedia);

        var video = document.querySelector('video');
        var cameraStream = '';
        if (navigator.getUserMedia) {
            navigator.getUserMedia(
            {
                audio: true,
                video: true
            },

      function (stream) {
          var url = window.URL || window.webkitURL;
          cameraStream = stream;
          video.src = window.URL.createObjectURL(stream);
          video.play();
      },

      function (error) {
          //document.writeln("Há um problema para acessar os dispositivos.")

      }
      );
        }
        else {
            //document.writeln("Captura não é suportada!");

        }
        /*
        document.querySelector('#stopbt').addEventListener(
            'click',
            function (e) {
                video.src = '';
                cameraStream.stop();
            });
            */
    </script>

    <script>
        /*
        var v = document.getElementsByTagName("video")[0];
        v.play();
        */
    </script>


</footer>
</html>
