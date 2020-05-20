<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!--
	Validación de Fecha
	http://bootstrapvalidator.votintsev.ru/validators/date/
	Validación de Correo
	http://bootstrapvalidator.votintsev.ru/validators/emailAddress/
 -->
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<title>Registra Alumno</title>
</head>
<body>

<div class="container">
<h1>Registra Alumno</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="insertaAlumno" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellido">Apellidos</label>
				<input class="form-control" type="text" id="id_apellido" name="apellido" placeholder="Ingrese el apellido">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fecha">Fecha Nacimiento</label>
				<input class="form-control" type="text" id="id_fecha" name="fecha" placeholder="Ingrese la fecha">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_correo">Correo</label>
				<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese el correo">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Alumno</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	nombre :{
          		selector : '#id_nombre',
        		validators :{
        			notEmpty :{
        				message :"El nombre es obligatorio"
        			},
        			stringLength :{
                     	message:"El nombre es de 2 a 20 caracteres",
                     	min : 2,
                     	max : 20
                    }
        		}
        	},
        	apellido :{
          		selector : '#id_apellido',
        		validators :{
        			notEmpty :{
        				message :"El apellido es obligatorio"
        			},
        			stringLength :{
                     	message:"El apellido es de 2 a 20 caracteres",
                     	min : 2,
                     	max : 20
                    }
        		}
        	},
        	fecha :{
        		selector : '#id_fecha',
        		validators :{
        			notEmpty :{
        				message :"La fecha es obligatorio"
        			},
        			date: {
                        format: 'YYYY-MM-DD',
                        message: 'La fecha tiene formato YYYY-MM-DD'
                    }
        		}
        	},
        	correo :{
        		selector : '#id_correo',
        		validators :{
        			notEmpty :{
        				message :"El correo es obligatorio"
        			},
        			emailAddress: {
                        message: 'El correo no tiene formato adecuado'
                    }
        		}
        	},
        }
  
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>




