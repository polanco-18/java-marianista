package Controlador;

import Modelo.Bean.DatoBean;
import Modelo.dao.HorarioDao;
import Modelo.dao.PagoDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PagoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                PagoDao objDao = new PagoDao();
                ArrayList<DatoBean> lista = objDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Pago/FrmCronograma.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                ArrayList<DatoBean> lista = new ArrayList<DatoBean>();
                PagoDao objMatriculaDAO = new PagoDao();
                lista = objMatriculaDAO.MostrarBuscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Pago/FrmBuscar.jsp";
                break;
            }
            case 8: {
                String Usuario = request.getParameter("txtcod");
                System.out.println(Usuario);
                String tipo = request.getParameter("txttip");
                PagoDao objMatriculaDAO = new PagoDao();
                ArrayList<DatoBean> lista = objMatriculaDAO.CronogramaAlumno(Usuario);
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Pago/CronogramaAlumno.jsp";
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
