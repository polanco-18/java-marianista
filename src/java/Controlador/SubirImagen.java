package Controlador;

import Modelo.Bean.DatoBean;
import Modelo.dao.PersonaDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import java.util.List;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.io.File;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

@WebServlet(name = "SubirImagen", urlPatterns = {"/SubirImagen"})
public class SubirImagen extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        String url = "D:\\Ua\\6 CICLO\\IMPLEMENTACION DE ARQUITECTURA EMPRESARIAL\\Final\\Colegio Marianista\\web\\Imagen\\Personas";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024);
        factory.setRepository(new File(url));
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> partes = upload.parseRequest(request);
            for (FileItem items : partes) {
                PersonaDao objPersonaDao = new PersonaDao();
                DatoBean objPersona = new DatoBean();
                int codigoPersona = objPersonaDao.GenerarCodigoPersona();
                objPersona.setBDDATOPersona(codigoPersona + 1);
                objPersona.setBDDATO1((codigoPersona + 1) + ".jpg");
                int estado = objPersonaDao.InsertarFoto(objPersona);
                File file = new File(url, (codigoPersona + 1) + ".jpg");
                items.write(file);
                out.println("<!DOCTYPE html>");
                out.println("<head>");
                out.println("<html>");
                out.println("<link rel=\"shortcut icon\" href=\"<%=request.getContextPath()%>/Imagen/logoM1.png\"/>");
                out.println("<title>Foto Subida</title>");
                out.println(" <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">\n");
                out.println("</head>");
                out.println("<body onLoad=\"JavaScript:Cerraraliniciar()\">\n"
                        + "<script language=\"JavaScript\">\n"
                        + "function Cerraraliniciar(){\n"
                        + "var id;\n"
                        + "id = setTimeout(\"cerrar()\", 800);\n"
                        + "}\n"
                        + "function cerrar() {\n"
                        + "var ventana = window.self;\n"
                        + "ventana.opener = window.self;\n"
                        + "ventana.close();\n"
                        + "}\n"
                        + "</script>");
                out.println("<div class='container'>");
                out.println("<br>");
                if (estado != 0) {
                    out.println("<div class=\"alert alert-primary\" role=\"alert\"> Se subio Correctamente</div>");
                } else {
                    out.println("<div class=\"alert alert-danger\" role=\"alert\"> Error en subir</div>");
                }
                out.println("<br>");
                out.println("</div>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            out.println("<div class=\"alert alert-primary\" role=\"alert\"> " + e.getMessage() + "</div>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
