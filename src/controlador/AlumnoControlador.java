package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Alumno;
import model.AlumnoModel;




@WebServlet("/insertaAlumno")
public class AlumnoControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//1 Recibe los parámetros
			//Son los nombres de las caja de textos en el JSP
			String nom = request.getParameter("nombre");
			String ape = request.getParameter("apellido");
			String fec = request.getParameter("fecha");
			String cor = request.getParameter("correo");
			
			//2 Se crea el objeto Alumno
			Alumno obj = new Alumno();
			obj.setNombre(nom);
			obj.setApellido(ape);
			obj.setFecha(fec);
			obj.setCorreo(cor);
			
			AlumnoModel m = new AlumnoModel();
			int s = m.insertaAlumno(obj);
			if (s>0)
				request.getSession().setAttribute("MENSAJE", "registro exitoso");
			else
				request.getSession().setAttribute("MENSAJE", "registro erróneo");
			
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("MENSAJE", "registro erróneo");
		} finally {
			response.sendRedirect("registraAlumno.jsp");
		}
	}

}
