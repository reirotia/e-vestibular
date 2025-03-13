<%@ Page Language="C#" AutoEventWireup="true" CodeFile="video.aspx.cs" Inherits="video" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


        </div>
    </form>
</body>

    
    <video width="600" height="400" autoplay></video>


    <script>
        function ver() {
            alert('oi');
            var v = document.getElementsByTagName("video");
            v.play();
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
      document.writeln("Há um problema para acessar os dispositivos.")
  }
  );
    }
    else {
        document.writeln("Captura não é suportada!");
    }
    document.querySelector('#stopbt').addEventListener(
        'click',
        function (e) {
            video.src = '';
            cameraStream.stop();
        });
</script>
    <script>
        var v = document.getElementsByTagName("video")[0];
        v.play();
    </script>


    <input type="button" id="stopbt" value="stop"/>

<input type="button" value="Ver Video" onclick="ver();" />

</html>
