package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Bean.DatoBean;
import Modelo.dao.AlumnoDao;
import Modelo.dao.MatriculaDao;
import Modelo.dao.PagoDao;
import Modelo.dao.PersonaDao;
import Modelo.dao.UsuarioDao;
import java.util.ArrayList;

public class MatriculaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        String pagina = "";
        switch (op) {
            case 0: {
                MatriculaDao objMatriculaDao = new MatriculaDao();
                ArrayList<DatoBean> lista = objMatriculaDao.ListarMatricula();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Matricula/FrmMatricula.jsp";
                break;
            }
            case 1: {
                String Ttxt1 = request.getParameter("txt1");
                ArrayList<DatoBean> lista = new ArrayList<DatoBean>();
                MatriculaDao objMatriculaDAO = new MatriculaDao();
                lista = objMatriculaDAO.MostrarBuscar(Ttxt1);
                if (lista == null || lista.isEmpty()) {
                    request.setAttribute("Mensaje", " No se encontraron datos solicitados ");
                }
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Matricula/FrmBuscar.jsp";
                break;
            }
            case 2: {
                MatriculaDao objDao = new MatriculaDao();
                ArrayList<DatoBean> listaS = objDao.ListarSeccion();
                request.setAttribute("Seccion", listaS);
                pagina = "/Vista/Mantenimiento/Matricula/FrmMatriculaNueva.jsp";
                break;
            }
            case 3: {
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
                String TtxtS = request.getParameter("txtSeccion");
                String TtxtC = request.getParameter("txtCategoria");
                String Ttxt14 = request.getParameter("txt14");
                String Ttxt15 = request.getParameter("txt15");
                String Ttxt16 = request.getParameter("txt16");
                String Ttxt17 = request.getParameter("txt17");
                String Ttxt18 = request.getParameter("txt18");
                DatoBean objPersona = new DatoBean();
                PersonaDao objPersonaDao = new PersonaDao();
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
                    DatoBean objBean = new DatoBean();
                    objBean.setBDDATOUsuario(codigoUsuario);
                    objBean.setBDDATOTPersona(5);
                    objBean.setBDDATO1(Ttxt16 + Ttxt2);
                    objBean.setBDDATOPersona(codigoPersona);
                    int estadoUsuario = objUsuarioDao.Insertar(objBean);
                    if (estadoUsuario == 1) {
                        request.setAttribute("Mensaje", "Persona y Usuario Creado !!");
                        AlumnoDao objADao = new AlumnoDao();
                        int codigoAlumno = objADao.GenerarCodigoAlumno();
                        objBean.setBDDATOAlumno(codigoAlumno);
                        objBean.setBDDATOPersona(codigoPersona);
                        int estadoAlumno = objADao.Insertar(objBean);
                        if (estadoAlumno == 1) {
                            request.setAttribute("Mensaje", "Persona y Alumno Creado !!");
                            DatoBean objMatricula = new DatoBean();
                            MatriculaDao objMatriculaDao = new MatriculaDao();
                            objMatricula.setBDDATOAlumno(codigoAlumno);
                            objMatricula.setBDDATOSeccion(Integer.parseInt(TtxtS));
                            objMatricula.setBDDATOCategoria(Integer.parseInt(TtxtC));
                            objMatricula.setBDDATO14(Ttxt14);
                            objMatricula.setBDDATO15(Ttxt15);
                            objMatricula.setBDDATO16(Ttxt16);
                            objMatricula.setBDDATO17(Ttxt17);
                            objMatricula.setBDDATO18(Ttxt18);
                            int estadoMatricula = objMatriculaDao.Insertar(objMatricula);
                            if (estadoMatricula == 1) {
                                request.setAttribute("Mensaje", "Matricula Creada");
                                PagoDao objPDao = new PagoDao();
                                int EstadoPago = objPDao.InsertarCronograma(objMatricula);
                                if (EstadoPago == 1) {
                                    request.setAttribute("Mensaje", "Exito");
                                } else {
                                    request.setAttribute("Mensaje", "Exito, Fallo de Cronogramas de Pago");
                                }
                            } else {
                                request.setAttribute("Mensaje", "Matricula no Insertado");
                            }

                        } else {
                            request.setAttribute("Mensaje", "persona creada, error crear Alumno");
                        }
                    } else {
                        request.setAttribute("Mensaje", "Matricula Creada, error crear Usuario");
                    }
                } else {
                    request.setAttribute("Mensaje", "Matricula no Creada");
                }
                MatriculaDao objMatriculaDao = new MatriculaDao();
                ArrayList<DatoBean> lista = objMatriculaDao.ListarMatricula();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Matricula/FrmMatricula.jsp";
                break;
            }
            case 4: {
                MatriculaDao objDao = new MatriculaDao();
                ArrayList<DatoBean> listaS = objDao.ListarSeccion();
                request.setAttribute("Seccion", listaS);
                AlumnoDao objAlumnoDao = new AlumnoDao();
                ArrayList<DatoBean> lista = objAlumnoDao.Listar();
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Matricula/FrmMatriculaActualizar.jsp";
                break;
            }
            case 5: {
                String Ttxt1 = request.getParameter("txt1");
                AlumnoDao objAlumnoDAO = new AlumnoDao();
                ArrayList<DatoBean> lista = objAlumnoDAO.Buscar(Ttxt1);
                request.setAttribute("Listar", lista);
                pagina = "/Vista/Mantenimiento/Matricula/FrmAlumnoDatos.jsp";
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
