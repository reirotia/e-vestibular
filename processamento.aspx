<%@ Page Language="C#" AutoEventWireup="true" CodeFile="processamento.aspx.cs" Inherits="processamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-vestibular</title>
    <link rel="stylesheet" href="resources/lib/bootstrap-4.2.1-dist/css/bootstrap.min.css">

</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
            <input type="button" class="btn btn-success" value="Processar" onclick="processar()" />
    </div>
    </form>
</body>
      <script src="resources/lib/jquery3.3.1/jquery-3.3.1.min.js"></script>

    
    <script>
        
        function processar() {

            var NMHOST = "Service.asmx?op=Processamento";

            var URLWEBSERVICE = "https://" + NMHOST;
            var soapRequest = '<?xml version="1.0" encoding="utf-8"?><soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"> <soap12:Body>    <Processamento xmlns="http://tempuri.org/"> </Processamento>  </soap12:Body></soap12:Envelope>'

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

                var nova = $(req.responseXML).find("ProcessamentoResult").text();
                //document.getElementById('mensagem').innerHTML = nova;
                alert(nova);


            }
            function processError(data, status, req) {

            }


        }

</script>
    
</html>
