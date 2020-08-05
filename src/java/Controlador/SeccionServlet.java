package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Bean.DatoBean;
import Modelo.dao.CursoDao;
import Modelo.dao.SeccionDao;
import Modelo.dao.DocenteDao;
import Modelo.dao.SalonDao;
import java.util.ArrayList;

public class SeccionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                SeccionDao objDao = new SeccionDao();
                ArrayList<DatoBean> lista = objDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Seccion/FrmSeccion.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                ArrayList<DatoBean> lista = new ArrayList<DatoBean>();
                SeccionDao objSeccionDAO = new SeccionDao();
                lista = objSeccionDAO.MostrarBuscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Seccion/FrmBuscar.jsp";
                break;
            }
            case 2: {
                DocenteDao objDDao = new DocenteDao();
                SalonDao objSADao = new SalonDao();
                ArrayList<DatoBean> lista = objDDao.ListarDocente();
                ArrayList<DatoBean> lista2 = objSADao.ListarSalonD();
                request.setAttribute("ListarSA", lista2);
                request.setAttribute("ListarDO", lista);
                pagina = "/Vista/Mantenimiento/Seccion/FrmSeccionRegistrar.jsp";
                break;
            }
            case 3: {
                SeccionDao objDao = new SeccionDao();
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                String Ttxt4 = request.getParameter("txt4");
                DatoBean objBean = new DatoBean();
                objBean.setBDDATO1(Ttxt1);
                objBean.setBDDATO2(Ttxt2);
                objBean.setBDDATO3(Ttxt3);
                objBean.setBDDATO4(Ttxt4);
                int estado = objDao.Insertar(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Seccion Creada");
                } else {
                    request.setAttribute("Mensaje", "Seccion no Insertado");
                }
                ArrayList<DatoBean> lista = objDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Seccion/FrmSeccion.jsp";
                break;
            }
            case 4: {
                String Tcodigo = request.getParameter("codigoS");
                String Tcodigo1 = request.getParameter("codigoSA");
                String TD1 = request.getParameter("D1");
                String TD2 = request.getParameter("D2");
                String TD3 = request.getParameter("D6");
                String TD4 = request.getParameter("D3");
                String TD5 = request.getParameter("D4");
                String TD6 = request.getParameter("D5");
                CursoDao objDDao = new CursoDao();
                SalonDao objSADao = new SalonDao();
                ArrayList<DatoBean> lista = objDDao.DocentesD(TD3);
                ArrayList<DatoBean> lista2 = objSADao.ListarSalonD();
                request.setAttribute("ListarSA", lista2);
                request.setAttribute("ListarDO", lista);
                request.setAttribute("codigoS", Tcodigo);
                request.setAttribute("codigoDO", TD3);
                request.setAttribute("D1", TD1);
                request.setAttribute("D2", TD2);
                request.setAttribute("D3", TD4);
                request.setAttribute("D4", TD5);
                request.setAttribute("D5", TD6);
                request.setAttribute("D6", Tcodigo1);
                pagina = "/Vista/Mantenimiento/Seccion/FrmSeccionModificar.jsp";
                break;
            }
            case 5: {
                String Tcodigo = request.getParameter("codigo");
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                String Ttxt4 = request.getParameter("txt4");
                DatoBean objHorarioBean = new DatoBean();
                objHorarioBean.setBDDATO3(Ttxt4);
                objHorarioBean.setBDDATOSeccion(Integer.parseInt(Tcodigo));
                objHorarioBean.setBDDATOSalon(Integer.parseInt(Ttxt3));
                objHorarioBean.setBDDATO1(Ttxt1);
                objHorarioBean.setBDDATO2(Ttxt2);
                SeccionDao objHorarioDao = new SeccionDao();
                int flag = objHorarioDao.Modificar(objHorarioBean);
                if (flag == 1) {
                    request.setAttribute("Mensaje", "Registro Modificado!!");
                } else {
                    request.setAttribute("Mensaje", "Registro No Modificado!!");
                }
                SeccionDao objDao = new SeccionDao();
                ArrayList<DatoBean> lista = objDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Seccion/FrmSeccion.jsp";
                break;
            }
            case 6: {
                String codigocad = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigocad);
                DatoBean objDatoBean = new DatoBean();
                objDatoBean.setBDDATOHorario(codigo);
                SeccionDao objHorarioDao = new SeccionDao();
                int estado = objHorarioDao.Eliminar(objDatoBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Registro Eliminado");
                } else {
                    request.setAttribute("Mensaje", "Registro no Eliminado");
                }
                ArrayList<DatoBean> lista = objHorarioDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Seccion/FrmSeccion.jsp";
                break;
            }
        }
        getServletContext().getRequestDispatcher(pagina).forward(request, response);
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
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
