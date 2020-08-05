package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Bean.DatoBean;
import Modelo.dao.AlumnoDao;
import Modelo.dao.DocenteDao;
import Modelo.dao.MatriculaDao;
import Modelo.dao.PersonaDao;
import Modelo.dao.UsuarioDao;
import java.util.ArrayList;

public class AlumnoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                AlumnoDao objAlumnoDao = new AlumnoDao();
                ArrayList<DatoBean> lista = objAlumnoDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Alumno/FrmAlumno.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                AlumnoDao objAlumnoDAO = new AlumnoDao();
                ArrayList<DatoBean> lista = objAlumnoDAO.Buscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Alumno/FrmBuscar.jsp";
                break;
            }
            case 4: {
                DatoBean objBean = new DatoBean();
                String Tcodigo = request.getParameter("codigo");
                objBean.setBDDATOPersona(Integer.parseInt(Tcodigo));
                PersonaDao objDao = new PersonaDao();
                objBean = objDao.DatosModificar(objBean);
                request.setAttribute("Datos", objBean);
                pagina = "/Vista/Mantenimiento/Alumno/FrmAlumnoModificar.jsp";
                break;
            }
            case 8: {
                AlumnoDao objAlumnoDao = new AlumnoDao();
                ArrayList<DatoBean> lista = objAlumnoDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Alumno/Alumno.jsp";
                break;
            }
            case 9: {
                String Ttxt1 = request.getParameter("txt1");
                AlumnoDao objAlumnoDAO = new AlumnoDao();
                ArrayList<DatoBean> lista = objAlumnoDAO.Buscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Alumno/AlumnoBus.jsp";
                break;
            }
        }
        getServletContext().getRequestDispatcher(pagina).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
