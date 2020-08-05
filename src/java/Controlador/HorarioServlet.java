package Controlador;

import Modelo.Bean.DatoBean;
import Modelo.dao.CursoDao;
import Modelo.dao.HorarioDao;
import Modelo.dao.SeccionDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HorarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                HorarioDao obj = new HorarioDao();
                ArrayList<DatoBean> lista = obj.Listar();
                request.setAttribute("Listar", lista);
                SeccionDao objS = new SeccionDao();
                ArrayList<DatoBean> listaS = objS.ListarSeccionLi();
                request.setAttribute("Seccion", listaS);
                pagina = "/Vista/Mantenimiento/Horario/FrmHorario.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                HorarioDao obj = new HorarioDao();
                ArrayList<DatoBean> lista = obj.Buscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Horario/FrmBuscar.jsp";
                break;
            }
            case 2: {
                CursoDao obj = new CursoDao();
                ArrayList<DatoBean> lista = obj.ListarCursoD();
                request.setAttribute("Curso", lista);
                SeccionDao objS = new SeccionDao();
                ArrayList<DatoBean> listaS = objS.ListarSeccionLi();
                request.setAttribute("Seccion", listaS);
                pagina = "/Vista/Mantenimiento/Horario/FrmHorarioNuevo.jsp";
                break;
            }
            case 3: {
                String Seccion = request.getParameter("txt1");
                HorarioDao obj = new HorarioDao();
                ArrayList<DatoBean> lista = obj.ListarHorarioN(Seccion);
                request.setAttribute("Horario", lista);
                pagina = "/Vista/Mantenimiento/Horario/CreacionHorario.jsp";
                break;
            }
            case 4: {
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                String Ttxt4 = request.getParameter("txt4");
                String Ttxt5 = request.getParameter("txt5");
                DatoBean objBean = new DatoBean();
                objBean.setBDDATO1(Ttxt1);
                objBean.setBDDATO2(Ttxt2);
                objBean.setBDDATO3(Ttxt3);
                objBean.setBDDATO4(Ttxt4);
                objBean.setBDDATO5(Ttxt5);
                HorarioDao obj = new HorarioDao();
                int estado = obj.Insertar(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Horario Creado");
                } else {
                    request.setAttribute("Mensaje", "Ningun Registro Insertado");
                }
                ArrayList<DatoBean> lista = obj.ListarHorarioN(Ttxt1);
                request.setAttribute("Horario", lista);
                pagina = "/Vista/Mantenimiento/Horario/CreacionHorario.jsp";
                break;
            }
            case 5: {
                String codigocad = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigocad);
                DatoBean objBean = new DatoBean();
                objBean.setBDDATOHorario(codigo);
                HorarioDao objDao = new HorarioDao();
                int estado = objDao.Eliminar(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Horario Eliminado");
                } else {
                    request.setAttribute("Mensaje", "Horario no Eliminado");
                }
                String Seccion = request.getParameter("txt1");
                HorarioDao obj = new HorarioDao();
                ArrayList<DatoBean> lista = obj.ListarHorarioN(Seccion);
                request.setAttribute("Horario", lista);
                pagina = "/Vista/Mantenimiento/Horario/CreacionHorario.jsp";
                break;
            }
            case 8: {
                String Usuario = request.getParameter("txtcod");
                String tipo = request.getParameter("txttip");
                HorarioDao objPersoDAO = new HorarioDao();
                String cod = objPersoDAO.CodAlumno(Usuario);
                ArrayList<DatoBean> lista = objPersoDAO.HorarioAlumno(cod);
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Horario/HorarioAlumno.jsp";               
                break;
            }
            case 9: {
                String Usuario = request.getParameter("txtcod");
                String tipo = request.getParameter("txttip");
                HorarioDao objPersoDAO = new HorarioDao();
                ArrayList<DatoBean> lista = objPersoDAO.HorarioDocente(Usuario);
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Horario/HorarioDocente.jsp";
               
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
