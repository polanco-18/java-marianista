package Controlador;

import Modelo.Bean.DatoBean;
import Modelo.dao.UsuarioDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsuarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String Usuario, Clave, pagina = "";
        switch (op) {
            case 0: {
                Usuario = request.getParameter("txtusu");
                Clave = request.getParameter("txtcla");
                UsuarioDao objUsuarioDao = new UsuarioDao();
                DatoBean objDatoBean = new DatoBean();
                objDatoBean.setBDDATOUsuario1(Usuario);
                objDatoBean.setBDDATOContraseña(Clave);
                int tipo = objUsuarioDao.Sesion(objDatoBean);
                if (tipo == 0) {
                    request.setAttribute("Mensaje", "El Usuario o La Clave es Incorrecta");
                    pagina = "/index.jsp";
                } else {
                    UsuarioDao objProDao = new UsuarioDao();
                    objDatoBean = objProDao.cargarDatos(objDatoBean);
                    request.setAttribute("Usuario", objDatoBean);
                    request.setAttribute("opciones", "" + tipo);
                    pagina = "/Vista/Seguridad/FrmPrincipal.jsp";
                }
                break;
            }
            case 1: {
                Usuario = request.getParameter("txtcod");
                String tipo = request.getParameter("txttip");
                DatoBean objDatoBean = new DatoBean();
                UsuarioDao objPersoDAO = new UsuarioDao();
                objDatoBean = objPersoDAO.cargarDatos2(Usuario);
                request.setAttribute("Usuario", objDatoBean);
                request.setAttribute("opciones", "" + tipo);
                pagina = "/Vista/Mantenimiento/Inicio.jsp";
                break;
            }
            case 2: {
                Usuario = request.getParameter("txtcod");
                String tipo = request.getParameter("txttip");
                DatoBean objDatoBean = new DatoBean();
                UsuarioDao objPersoDAO = new UsuarioDao();
                objDatoBean = objPersoDAO.cargarDatos2(Usuario);
                request.setAttribute("Usuario", objDatoBean);
                request.setAttribute("opciones", "" + tipo);
                pagina = "/Vista/Mantenimiento/Informacion.jsp";
                break;
            }
            case 3: {
                Usuario = request.getParameter("txtcod");
                String tipo = request.getParameter("txttip");
                DatoBean objPersoBean = new DatoBean();
                UsuarioDao objPersoDAO = new UsuarioDao();
                objPersoBean = objPersoDAO.cargarDatos2(Usuario);
                request.setAttribute("Usuario", objPersoBean);
                request.setAttribute("opciones", "" + tipo);
                pagina = "/Vista/Mantenimiento/CContraseña.jsp";
                break;
            }
            case 4: {
                /*----------------Extraer Datos --------------------------------*/
                Usuario = request.getParameter("codigo");
                String Clave1 = request.getParameter("txt1");
                String Claven = request.getParameter("txt2");
                /*--------Valides de contraseña actual-------------------*/
                DatoBean objDatoBean = new DatoBean();
                UsuarioDao objUsuarioDao = new UsuarioDao();
                objDatoBean.setBDDATOUsuario1(Usuario);
                String Contraseña = objUsuarioDao.VContraseña(objDatoBean);
                if (Contraseña.equals(Clave1)) {
                    DatoBean objUsuarioBean = new DatoBean();
                    objUsuarioBean.setBDDATOUsuario(Integer.parseInt(Usuario));
                    objUsuarioBean.setBDDATO1(Claven);
                    int Estado = objUsuarioDao.ModificarContraseña(objUsuarioBean);
                    if (Estado == 1) {
                        request.setAttribute("mensaje", "Contraseña Modificada!!");
                    } else {
                        request.setAttribute("mensaje", "Contraseña No Modificada!!");
                    }
                } else {
                    request.setAttribute("mensaje", "Contraseña Actual no concide!!");
                }
                int tipo = objUsuarioDao.Sesion1(objDatoBean);
                DatoBean objPersoBean = new DatoBean();
                UsuarioDao objPersoDAO = new UsuarioDao();
                objPersoBean = objPersoDAO.cargarDatos2(Usuario);
                request.setAttribute("Usuario", objPersoBean);
                request.setAttribute("opciones", "" + tipo);
                pagina = "/Vista/Mantenimiento/CContraseña.jsp";
                break;
            }
            case 10: {
                UsuarioDao objUsuarioDao = new UsuarioDao();
                ArrayList<DatoBean> lista = objUsuarioDao.ListarUsuario();
                request.setAttribute("ListarUsuario", lista);
                pagina = "/Vista/Mantenimiento/Usuario/FrmUsuario.jsp";
                break;
            }
            case 11: {
                String Ttxt1 = request.getParameter("txt1");
                ArrayList<DatoBean> lista = new ArrayList<DatoBean>();
                UsuarioDao objUsuarioDAO = new UsuarioDao();
                lista = objUsuarioDAO.MostrarBuscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Usuario/FrmBuscar.jsp";
                break;
            }
            case 14: {
                String Tcodigo = request.getParameter("codigo");
                String TD1 = request.getParameter("D1");
                String TD2 = request.getParameter("D2");
                String TD3 = request.getParameter("D3");
                String TD4 = request.getParameter("D4");
                String TD5 = request.getParameter("D5");
                String TD6 = request.getParameter("D6");
                String TD7 = request.getParameter("D7");
                String TD8 = request.getParameter("D8");
                request.setAttribute("codigo", Tcodigo);
                request.setAttribute("D1", TD1);
                request.setAttribute("D2", TD2);
                request.setAttribute("D3", TD3);
                request.setAttribute("D4", TD4);
                request.setAttribute("D5", TD5);
                request.setAttribute("D6", TD6);
                request.setAttribute("D7", TD7);
                request.setAttribute("D8", TD8);
                pagina = "/Vista/Mantenimiento/Usuario/FrmUsuarioModificar.jsp";
                break;
            }
            case 15: {
                String Tcodigo = request.getParameter("codigo");
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                DatoBean objUsuarioBean = new DatoBean();
                objUsuarioBean.setBDDATOUsuario(Integer.parseInt(Tcodigo));
                objUsuarioBean.setBDDATO1(Ttxt1);
                objUsuarioBean.setBDDATO2(Ttxt2);
                UsuarioDao objUsuarioDao = new UsuarioDao();
                int Estado = objUsuarioDao.Modificar(objUsuarioBean);
                if (Estado == 1) {
                    request.setAttribute("mensaje", "Usuario Modificado!!");
                } else {
                    request.setAttribute("mensaje", "Usuario No Modificado!!");
                }
                ArrayList<DatoBean> lista = objUsuarioDao.ListarUsuario();
                request.setAttribute("ListarUsuario", lista);
                pagina = "/Vista/Mantenimiento/Usuario/FrmUsuario.jsp";
                break;
            }
            case 16: {
                String codigocad = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigocad);
                DatoBean objDatoBean = new DatoBean();
                objDatoBean.setBDDATOUsuario(codigo);
                UsuarioDao objUsuarioDao = new UsuarioDao();
                int estado = objUsuarioDao.Eliminar(objDatoBean);
                if (estado == 1) {
                    request.setAttribute("mensaje", "Registro Eliminado");
                } else {
                    request.setAttribute("mensaje", "Registro no Eliminado");
                }
                ArrayList<DatoBean> lista = objUsuarioDao.ListarUsuario();
                request.setAttribute("ListarUsuario", lista);
                pagina = "/Vista/Mantenimiento/Usuario/FrmUsuario.jsp";
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
