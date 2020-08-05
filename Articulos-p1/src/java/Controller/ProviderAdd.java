package Controller;

import Conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProviderAdd", urlPatterns = {"/ProviderAdd"})
public class ProviderAdd extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String rfc = request.getParameter("rfc");
            String rsocial = request.getParameter("rsocial");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            
            try {
                PreparedStatement ps = Conexion.openConection().prepareStatement("INSERT INTO proveedor(id,rfc, razonSocial, direccion, telefono, correo) VALUES (NULL,?,?,?,?,?)");
                ps.setString(1, rfc);
                ps.setString(2, rsocial);
                ps.setString(3, direccion);
                ps.setString(4, telefono);
                ps.setString(5, correo);

                int rs = ps.executeUpdate();
                if (rs > 0) {
                    response.sendRedirect("proveedores.jsp");
                    Conexion.closeConection();
                } else {
                    out.println("error, intenta mas tarde");
                }


            } catch (SQLException e) {
                System.err.println("ERROR: "+e.getMessage());
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ProviderAdd.class.getName()).log(Level.SEVERE, null, ex);
            } 
        } catch (Exception e){
            out.println("error" + e);
        }
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
