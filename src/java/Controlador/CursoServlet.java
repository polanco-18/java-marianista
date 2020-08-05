package Controlador;

import Modelo.Bean.DatoBean;
import Modelo.dao.CursoDao;
import Modelo.dao.DocenteDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CursoServlet", urlPatterns = {"/CursoServlet"})
public class CursoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                CursoDao obj = new CursoDao();
                ArrayList<DatoBean> lista = obj.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Cursos/FrmCurso.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                CursoDao obj = new CursoDao();
                ArrayList<DatoBean> lista = obj.Buscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Cursos/FrmBuscar.jsp";
                break;
            }
            case 2: {
                DocenteDao obj = new DocenteDao();
                ArrayList<DatoBean> lista = obj.ListarDocente();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Cursos/FrmCursoNuevo.jsp";
                break;
            }
            case 3: {
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                DatoBean objBean = new DatoBean();
                objBean.setBDDATO1(Ttxt1);
                objBean.setBDDATO2(Ttxt2);
                objBean.setBDDATO3(Ttxt3);
                CursoDao objDao = new CursoDao();
                int estado = objDao.Insertar(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Curso Creada");
                } else {
                    request.setAttribute("Mensaje", "Ningun Registro Insertado");
                }
                ArrayList<DatoBean> lista = objDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Cursos/FrmCurso.jsp";
                break;
            }

            case 4: {
                String TcodigoP = request.getParameter("codigoCurso");
                String TcodigoD = request.getParameter("codigoDocente");
                String TD1 = request.getParameter("D1");
                String TD2 = request.getParameter("D2");
                CursoDao obj = new CursoDao();
                ArrayList<DatoBean> lista = obj.DocentesD(TcodigoD);
                request.setAttribute("Listar", lista);
                request.setAttribute("codigoCurso", TcodigoP);
                request.setAttribute("codigoDocente", TcodigoD);
                request.setAttribute("D1", TD1);
                request.setAttribute("D2", TD2);
                pagina = "/Vista/Mantenimiento/Cursos/FrmCursoModificar.jsp";
                break;
            }
            case 5: {
                String TcodigoD = request.getParameter("codigo");
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                DatoBean objBean = new DatoBean();
                objBean.setBDDATOCurso(Integer.parseInt(TcodigoD));
                objBean.setBDDATODocente(Integer.parseInt(Ttxt3));
                objBean.setBDDATO1(Ttxt1);
                objBean.setBDDATO2(Ttxt2);
                CursoDao objDao = new CursoDao();
                int flag = objDao.Modificar(objBean);
                if (flag == 1) {
                    request.setAttribute("Mensaje", "Curso Modificado!!");
                } else {
                    request.setAttribute("Mensaje", "Curso No Modificado!!");
                }
                CursoDao obj = new CursoDao();
                ArrayList<DatoBean> lista = obj.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Cursos/FrmCurso.jsp";
                break;
            }
            case 6: {
                String codigocad = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigocad);
                DatoBean objDatoBean = new DatoBean();
                objDatoBean.setBDDATOCurso(codigo);
                CursoDao objPersonaDao = new CursoDao();
                int estado = objPersonaDao.Eliminar(objDatoBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Registro Eliminado");
                } else {
                    request.setAttribute("Mensaje", "Registro no Eliminado");
                }
                CursoDao obj = new CursoDao();
                ArrayList<DatoBean> lista = obj.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Cursos/FrmCurso.jsp";
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
