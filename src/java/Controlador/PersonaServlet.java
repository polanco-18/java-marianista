package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Bean.DatoBean;
import Modelo.dao.AlumnoDao;
import Modelo.dao.PersonaDao;
import Modelo.dao.UsuarioDao;
import Modelo.dao.DocenteDao;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class PersonaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                PersonaDao objPersonaDao = new PersonaDao();
                ArrayList<DatoBean> lista = objPersonaDao.ListarPersona();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Persona/FrmPersona.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                PersonaDao objPersonaDAO = new PersonaDao();
                ArrayList<DatoBean> lista = objPersonaDAO.MostrarBuscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Persona/FrmBuscar.jsp";
                break;
            }
            case 2: {
                pagina = "/Vista/Mantenimiento/Persona/FrmPersonaNueva.jsp";
                break;
            }
            case 3: {
                PersonaDao objPersonaDao = new PersonaDao();
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                String Ttxt4 = request.getParameter("txt4");
                String Ttxt5 = request.getParameter("txt5");
                String Ttxt6 = request.getParameter("txt6");
                String Ttxt7 = request.getParameter("txt7");
                String Ttxt8 = request.getParameter("txt8");
                String Ttxt9 = request.getParameter("txt9");
                String Ttxt10 = request.getParameter("txt10");
                String Ttxt11 = request.getParameter("txt11");
                String Ttxt12 = request.getParameter("txt12");
                String Ttxt13 = request.getParameter("txt13");
                String Ttxt14 = request.getParameter("txt14");
                char Ttxt16 = Ttxt1.charAt(0);
                DatoBean objPersona = new DatoBean();
                int codigoPersona = objPersonaDao.GenerarCodigoPersona();
                objPersona.setBDDATOPersona(codigoPersona);
                objPersona.setBDDATO1(Ttxt1);
                objPersona.setBDDATO2(Ttxt2);
                objPersona.setBDDATO3(Ttxt3);
                objPersona.setBDDATO4(Ttxt4);
                objPersona.setBDDATO5(Ttxt5);
                objPersona.setBDDATO6(Ttxt6);
                objPersona.setBDDATO7(Ttxt7);
                objPersona.setBDDATO8(Ttxt8);
                objPersona.setBDDATO9(Ttxt9);
                objPersona.setBDDATO10(Ttxt10);
                objPersona.setBDDATO11(Ttxt11);
                objPersona.setBDDATO12(Ttxt12);
                objPersona.setBDDATO13(Ttxt13);
                int estado = objPersonaDao.InsertarPersona(objPersona);
                if (estado == 1) {
                    request.setAttribute("Mensaje", " Persona Creada!!");
                    //---------------- Creacion de Usuario ------------------------------------------------------------------------------------------------------
                    UsuarioDao objUsuarioDao = new UsuarioDao();
                    int codigoUsuario = objUsuarioDao.GenerarCodigoUsuario();
                    DatoBean objUsuario = new DatoBean();
                    objUsuario.setBDDATOUsuario(codigoUsuario);
                    objUsuario.setBDDATOTPersona(Integer.parseInt(Ttxt14));
                    objUsuario.setBDDATO1(Ttxt16 + Ttxt2);
                    objUsuario.setBDDATOPersona(codigoPersona);
                    int estadoUsuario = objUsuarioDao.Insertar(objUsuario);
                    if (estadoUsuario == 1) {
                        request.setAttribute("Mensaje", "Persona y Usuario Creado !!");
                    } else {
                        request.setAttribute("Mensaje", "Persona Creada y Usuario Fallo");
                    }
                    //---------------------------------------------------------------------------------------------------------------------------              
                    if (Ttxt14.equals("4")) {
                        DocenteDao objDocenteDao = new DocenteDao();
                        DatoBean objDocente = new DatoBean();
                        objDocente.setBDDATOPersona(codigoPersona);
                        int estadoDocente = objDocenteDao.Insertar(objDocente);
                        if (estadoDocente == 1) {
                            request.setAttribute("Mensaje", "Persona, Usuario y Docente Creado");
                        } else {
                            request.setAttribute("Mensaje", "Persona, Usuario Creada y Fallo de Docente");
                        }
                    }
                } else {
                    request.setAttribute("Mensaje", "Ningun Registro Insertado");
                }
                ArrayList<DatoBean> lista = objPersonaDao.ListarPersona();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Persona/FrmPersona.jsp";
                break;
            }
            case 4: {
                DatoBean objBean = new DatoBean();
                String Tcodigo = request.getParameter("codigo");
                objBean.setBDDATOPersona(Integer.parseInt(Tcodigo));
                PersonaDao objDao = new PersonaDao();
                objBean = objDao.DatosModificar(objBean);
                request.setAttribute("Datos", objBean);
                pagina = "/Vista/Mantenimiento/Persona/FrmPersonaModificar.jsp";
                break;
            }
            case 5: {
                String Tcodigo = request.getParameter("codigo");
                String Tcodigo2 = request.getParameter("codigo2");
                String Ttxt1 = request.getParameter("txt1");
                String Ttxt2 = request.getParameter("txt2");
                String Ttxt3 = request.getParameter("txt3");
                String Ttxt4 = request.getParameter("txt4");
                String Ttxt5 = request.getParameter("txt5");
                String Ttxt6 = request.getParameter("txt6");
                String Ttxt7 = request.getParameter("txt7");
                String Ttxt8 = request.getParameter("txt8");
                String Ttxt9 = request.getParameter("txt9");
                String Ttxt10 = request.getParameter("txt10");
                String Ttxt11 = request.getParameter("txt11");
                String Ttxt12 = request.getParameter("txt12");
                String Ttxt13 = request.getParameter("txt13");
                String Ttxt14 = request.getParameter("txt14");
                DatoBean objPersonaBean = new DatoBean();
                objPersonaBean.setBDDATOPersona(Integer.parseInt(Tcodigo));
                objPersonaBean.setBDDATOUsuario(Integer.parseInt(Tcodigo2));
                objPersonaBean.setBDDATO1(Ttxt1);
                objPersonaBean.setBDDATO2(Ttxt2);
                objPersonaBean.setBDDATO3(Ttxt3);
                objPersonaBean.setBDDATO4(Ttxt4);
                objPersonaBean.setBDDATO5(Ttxt5);
                objPersonaBean.setBDDATO6(Ttxt6);
                objPersonaBean.setBDDATO7(Ttxt7);
                objPersonaBean.setBDDATO8(Ttxt8);
                objPersonaBean.setBDDATO9(Ttxt9);
                objPersonaBean.setBDDATO10(Ttxt10);
                objPersonaBean.setBDDATO11(Ttxt11);
                objPersonaBean.setBDDATO12(Ttxt12);
                objPersonaBean.setBDDATO13(Ttxt13);
                objPersonaBean.setBDDATO14(Ttxt14);
                PersonaDao objPersonaDao = new PersonaDao();
                int flag = objPersonaDao.Modificar(objPersonaBean);
                int flag2 = objPersonaDao.ModificarUsuario(objPersonaBean);
                if (flag == 1 && flag2 == 1) {
                    request.setAttribute("Mensaje", "Registro Modificado!!");
                } else {
                    request.setAttribute("Mensaje", "Registro No Modificado!!");
                }
                if (Ttxt12.equals("1") || Ttxt12.equals("2") || Ttxt12.equals("3")) {
                    ArrayList<DatoBean> lista = objPersonaDao.ListarPersona();
                    request.setAttribute("Listar", lista);
                    pagina = "/Vista/Mantenimiento/Persona/FrmPersona.jsp";
                } else if (Ttxt12.equals("5")) {
                    AlumnoDao objAlumnoDao = new AlumnoDao();
                    ArrayList<DatoBean> lista = objAlumnoDao.Listar();
                    request.setAttribute("Listar", lista);
                    pagina = "/Vista/Mantenimiento/Alumno/FrmAlumno.jsp";
                } else {
                    DocenteDao objDocenteDao = new DocenteDao();
                    ArrayList<DatoBean> lista = objDocenteDao.ListarDocente();
                    request.setAttribute("Listar", lista);
                    pagina = "/Vista/Mantenimiento/Docente/FrmDocente.jsp";
                }
                break;
            }
            case 6: {
                String codigocad = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigocad);
                DatoBean objDatoBean = new DatoBean();
                objDatoBean.setBDDATOPersona(codigo);
                PersonaDao objPersonaDao = new PersonaDao();
                int estado = objPersonaDao.Eliminar(objDatoBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Registro Eliminado");
                } else {
                    request.setAttribute("Mensaje", "Registro no Eliminado");
                }
                ArrayList<DatoBean> lista = objPersonaDao.ListarPersona();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Persona/FrmPersona.jsp";
                break;
            }
            case 7: {
                String Usuario = request.getParameter("txttip");
                String tipo = request.getParameter("txtcod");
                File file = new File("D:\\Ua\\6 CICLO\\IMPLEMENTACION DE ARQUITECTURA EMPRESARIAL\\Final\\Colegio Marianista\\web\\Imagen\\Personas\\" + Usuario);
                if (file.delete()) {
                    System.out.println("File deleted successfully");
                } else {
                    System.out.println("Failed to delete the file");
                }
                DatoBean objBean = new DatoBean();
                objBean.setBDDATO1(tipo);
                objBean.setBDDATO2("Sin Foto");
                PersonaDao objDao = new PersonaDao();
                int estado = objDao.ModificarFoto(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Foto Eliminada");
                } else {
                    request.setAttribute("Mensaje", "Foto no Eliminado");
                }
                PersonaDao objPersonaDao = new PersonaDao();
                ArrayList<DatoBean> lista = objPersonaDao.ListarPersona();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Persona/FrmPersona.jsp";
                break;
            }
            case 8: {
                String Usuario = request.getParameter("txttip");
                String tipo = request.getParameter("txtcod");
                File file = new File("D:\\Ua\\6 CICLO\\IMPLEMENTACION DE ARQUITECTURA EMPRESARIAL\\Final\\Colegio Marianista\\web\\Imagen\\Personas\\" + Usuario);
                if (file.delete()) {
                    System.out.println("File deleted successfully");
                } else {
                    System.out.println("Failed to delete the file");
                }
                DatoBean objBean = new DatoBean();
                objBean.setBDDATO1(tipo);
                PersonaDao objDao = new PersonaDao();
                int estado = objDao.ModificarFoto(objBean);
                if (estado == 1) {
                    request.setAttribute("Mensaje", "Foto Eliminada");
                } else {
                    request.setAttribute("Mensaje", "Foto no Eliminado");
                }
                PersonaDao objPersonaDao = new PersonaDao();
                ArrayList<DatoBean> lista = objPersonaDao.ListarPersona();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Persona/FrmPersona.jsp";
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
