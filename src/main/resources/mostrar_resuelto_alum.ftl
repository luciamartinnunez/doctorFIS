<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Doctor FIS</title>
    <link href="https://github.com/AuroralH2020/kg-builder/raw/main/src/main/resources/spark/template/freemarker/css/favicon.ico" rel="shortcut icon" type="image/png">
    <!--leaflet -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js" integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
    <style type="text/css">
      #map { height: 500px; }
    </style>

   
  </head>
  <body>
    <div class="container-fluid">
      #include("./navbar.html")
      
      <div class="jumbotron" style="margin-top:20px">
        <h1 class="display-4">Solución</h1>
		<div class="mb-3">
		    <label for="archivo" class="form-label">Selecciona un archivo:</label>
		    <input type="file" class="form-control" id="archivo">
	    </div>
  		<button type="submit" style="margin-top:20px" class="btn btn-primary" id="enviar" onclick="verificarArcivo()">
  			Enviar</button>
  			<div class="spinner-border text-success" style="visibility:hidden;" id="spinner-submit" role="status">
          <span class="sr-only">Loading...</span>
          </div>
  		<div style="visibility:hidden;" id="divMsgError"><h3 id="msgError"></h3></div>
  		
  		 <!--toast-->
        <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false" style="position: absolute; right: 20px;">
		  <div class="toast-header">
		    <strong class="mr-auto">Atención</strong>
		    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
		      <span aria-hidden="true">&times;</span>
		    </button>
		  </div>
		  <div class="toast-body">
		    No es valida esa selección.
		  </div>
		</div>
       <!--toast-->
  		
        <table class="table" style="margin-top:30px">
  		  <thead>
   			<tr>
		      <th scope="col">X</th>
		      <th scope="col">Error</th>
    		</tr>
  		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row"></th>
		      <td></td>
		    </tr>
		  </tbody>
		</table>
	  </div>
  	</div>
  </body>
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript">
    $("#linkhome").css('text-decoration', 'underline')
    </script>
    <script>
    		function verificarArcivo(){
			const archivo = $("#archivo")[0].files[0];
			if(archivo){
				$('.toast').toast('hide');
		  		enviar();}
			else {
				$("#divMsgError").css("visibility", "hidden");
				$('.toast').toast('show');};
			}
    		
            function enviar() {
		            var archivo = $("#archivo")[0].files[0];
		  		    console.log(archivo);
		            var formData = new FormData();
		            formData.append("archivo", archivo);
		            
                    var xmlHttp = new XMLHttpRequest();
                  xmlHttp.onreadystatechange = function() { 
                      console.log(xmlHttp.responseText);
                      if (xmlHttp.readyState == 4){
                          if(xmlHttp.status < 300){
                          console.log(xmlHttp.responseText);
                          $("#spinner-submit").css("visibility", "hidden");
                          $("#divMsgError").css("visibility", "visible");
                          $("#divMsgError").css("color", "green");
                          $("#msgError").text( xmlHttp.responseText );
                        }else{
                           $("#spinner-submit").css("visibility", "hidden");
                          $("#divMsgError").css("visibility", "visible");
                          $("#divMsgError").css("color", "red");
                          $("#msgError").value = xmlHttp.responseText;
                        }
                      }
                  	};
                  	console.log(formData);
		            xmlHttp.open("POST", "/guardar-archivo-alumno", true); // true for asynchronous 
		            xmlHttp.send(formData);
                  
                }
        </script>
</html>