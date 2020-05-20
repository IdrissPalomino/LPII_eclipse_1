<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
<title>Registra Jugador</title>
</head>
<body>

<div class="container">
<h1>Registra Jugador</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="insertaJugador" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_alias">Alias</label>
				<input class="form-control" type="text" id="id_alias" name="alias" placeholder="Ingrese el alias">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais">País</label>
				<select class="form-control" id="id_pais" name="pais" >
						<option value=""></option>
						<option value="Perú">Perú</option>
						<option value="Brasil">Brasil</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_juego">Juego</label>
				<select class="form-control" id="id_juego" name="juego" >
						<option value=""></option>
						<option value="Dota I">Dota I</option>
						<option value="WoW">WoW</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_experiencia">Experiencia</label>
				<input class="form-control" type="text" id="id_experiencia" name="experiencia" placeholder="Ingrese la experiencia">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Jugador</button>
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
        fields: {
        	nombre:{
           		selector : '#id_nombre',
        		validators :{
        			notEmpty :{
        				message : 'El nombre es obligatorio'
        			},
                    stringLength :{
                    	message : 'El nombre es de 3 a 20 caracteres',
                    	min : 3,
                    	max : 20
                    }
        		}
        	},
        	alias:{
           		selector : '#id_alias',
        		validators :{
        			notEmpty :{
        				message : 'El alias es obligatorio'
        			},
                    stringLength :{
                    	message : 'El alias es de 3 a 20 caracteres',
                    	min : 3,
                    	max : 20
                    }
        		}        		
        	},
        	pais:{
           		selector : '#id_pais',
        		validators :{
        			notEmpty :{
        				message : 'El país es obligatorio'
        			}
        		}        		
        	},
        	juego:{
           		selector : '#id_juego',
        		validators :{
        			notEmpty :{
        				message : 'El juego es obligatorio'
        			}
        		}        		
        	},
        	experiencia:{
           		selector : '#id_experiencia',
        		validators :{
        			notEmpty :{
        				message : 'La experiencia es obligatoria'
        			},
                    lessThan: {
                        value: 20,
                        inclusive: true,
                        message: 'La experiencia es menor o igual a 20'
                    },
                    greaterThan: {
                        value: 1,
                        inclusive: true,
                        message: 'La experiencia es mayor o igual a 1'
                    } 
        	   
        		}  		
        	}
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




