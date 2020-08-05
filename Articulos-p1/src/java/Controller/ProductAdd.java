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

@WebServlet(name = "ProductAdd", urlPatterns = {"/ProductAdd"})
public class ProductAdd extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String creacion = request.getParameter("creacion");
            String unidad = request.getParameter("unidad");
            double punitario = Double.parseDouble(request.getParameter("punitario"));
            double iva = Double.parseDouble(request.getParameter("iva"));
            double pventa = Double.parseDouble(request.getParameter("pventa"));
            String disponibilidad = request.getParameter("disponibilidad");
            int proveedor = Integer.parseInt(request.getParameter("proveedor"));
            
            boolean disp = false;
            if(disponibilidad != null){
                disp = true;
            }
            
            try {
                PreparedStatement ps = Conexion.openConection().prepareStatement("INSERT INTO productos(id,codigo, nombre, descripcion, fechaApertura, unidad, costo, iva, precioVenta, disponibilidad, id_proveedor) VALUES (NULL,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, codigo);
                ps.setString(2, nombre);
                ps.setString(3, descripcion);
                ps.setString(4, creacion);
                ps.setString(5, unidad);
                ps.setDouble(6, punitario);
                ps.setDouble(7, iva);
                ps.setDouble(8, pventa);
                ps.setBoolean(9, disp);
                ps.setInt(10, proveedor);

                int rs = ps.executeUpdate();
                if (rs > 0) {
                    response.sendRedirect("index.jsp");
                    Conexion.closeConection();
                } else {
                    out.println("error, intenta mas tarde");
                }


            } catch (SQLException e) {
                System.err.println("ERROR: "+e.getMessage());
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ProductAdd.class.getName()).log(Level.SEVERE, null, ex);
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
