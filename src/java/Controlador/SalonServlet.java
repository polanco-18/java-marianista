package Controlador;

import Modelo.Bean.DatoBean;
import Modelo.dao.SalonDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SalonServlet", urlPatterns = {"/SalonServlet"})
public class SalonServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                SalonDao obj = new SalonDao();
                ArrayList<DatoBean> lista = obj.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Salon/FrmSalon.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                SalonDao obj = new SalonDao();
                ArrayList<DatoBean> lista = obj.Buscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Salon/FrmBuscar.jsp";
                break;
            }
            case 2: {
                pagina = "/Vista/Mantenimiento/Salon/FrmSalonNuevo.jsp";
                break;
            }
            case 3: {
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                String Ttxt4 = request.getParameter("txt4");
                DatoBean objBean = new DatoBean();
                objBean.setBDDATO1(Ttxt1);
                objBean.setBDDATO2(Ttxt2);
                objBean.setBDDATO3(Ttxt3);
                SalonDao obj = new SalonDao();
                int estado = obj.Insertar(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Salon Creada");
                } else {
                    request.setAttribute("Mensaje", "Ningun Registro Insertado");
                }
                ArrayList<DatoBean> lista = obj.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Salon/FrmSalon.jsp";
                break;
            }
            case 4: {
                String TcodigoP = request.getParameter("codigo");
                String TD1 = request.getParameter("D1");
                String TD2 = request.getParameter("D2");
                String TD3 = request.getParameter("D3");
                request.setAttribute("codigo", TcodigoP);
                request.setAttribute("D1", TD1);
                request.setAttribute("D2", TD2);
                request.setAttribute("D3", TD3);
                pagina = "/Vista/Mantenimiento/Salon/FrmSalonModificar.jsp";
                break;
            }
            case 5: {
                String TcodigoD = request.getParameter("codigo");
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                DatoBean objBean = new DatoBean();
                objBean.setBDDATOSalon(Integer.parseInt(TcodigoD));
                objBean.setBDDATO1(Ttxt1);
                objBean.setBDDATO2(Ttxt2);
                objBean.setBDDATO3(Ttxt3);
                SalonDao obj = new SalonDao();
                int flag = obj.Modificar(objBean);
                if (flag == 1) {
                    request.setAttribute("Mensaje", "Salon Modificado!!");
                } else {
                    request.setAttribute("Mensaje", "Salon No Modificado!!");
                }
                ArrayList<DatoBean> lista = obj.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Salon/FrmSalon.jsp";
                break;
            }
            case 6: {
                String codigocad = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigocad);
                DatoBean objBean = new DatoBean();
                objBean.setBDDATOSalon(codigo);
                SalonDao objDao = new SalonDao();
                int estado = objDao.Eliminar(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Salon Eliminado");
                } else {
                    request.setAttribute("Mensaje", "Salon no Eliminado");
                }
                ArrayList<DatoBean> lista = objDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Salon/FrmSalon.jsp";
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
