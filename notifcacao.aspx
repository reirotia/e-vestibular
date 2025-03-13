<%@ Page Language="C#" AutoEventWireup="true" CodeFile="notifcacao.aspx.cs" Inherits="notifcacao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    
       <title></title>

    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript" src="js/jquery.min.js"> </script>  
    <script type="text/javascript" src="js/notification.js"> </script>  
      <script type="text/javascript" src="js/timer.js"> </script>  
    
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <spam clas="form-group"><p>Tempo restante :</p></spam>

    </div>
    </form>
</body>
    
    <script>
 $(function() {
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
     
 
     
     var segundos = convertEmSegundos('00:01:01');
     var t = setInterval(function () {
         segundos -= 1;
         $('p').html(convertEmTempo(segundos));
         if (segundos == 0) {
             var icon = 'https://unibolsasbrasil.com.br/assets/img/logo-unibolsas.png';
             var title = 'Evestibular';
             var mensagem = "Tempo encerrado";
             var link = 'index.aspx';
             notifyMe(icon, title, mensagem, link);
             clearInterval(t);
         }
     }, 1000);

 });


 
        </script>
</html>
