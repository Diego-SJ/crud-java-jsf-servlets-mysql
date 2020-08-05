<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
    </head>
    <body>
        <div class="container p-4">
            <a href="proveedores.jsp" class="btn btn-danger text-white mt-2 mb-4">Volver</a>
            <h1 class="text-warning">Actualizar proveedor</h1>
            <%
                String id = request.getParameter("id");
                PreparedStatement ps = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM proveedor WHERE id = '" + id + "'");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <form name="ProviderUpdate" action="ProviderUpdate" method="POST" class="form mt-4">
                <input name="id" type="text" value="<%= rs.getString("id")%>" class="form-control d-none" required/>
                <div class="row">
                    <div class="col">
                        <label for="rfc">RFC</label>
                        <input name="rfc" type="text" value="<%= rs.getString("rfc")%>" class="form-control" required/>
                    </div>
                    <div class="col">
                        <label for="rsocial">Razón social</label>
                        <select name="rsocial" type="text" class="form-control" required/>
                        <option readonly> <%= rs.getString("razonSocial")%></option>
                        <option value="Productos Lacteos SA. de CV.">Productos Lacteos SA. de CV.</option>
                        <option value="Materias primas SA. de CV.">Materias primas SA. de CV.</option>
                        <option value="Materias primas SA. de CV.">Cocacola SA. de CV.</option>
                        <option value="Materias primas SA. de CV.">Bimbo SA. de CV.</option>
                        </select>
                    </div>
                    <div class="col">
                        <label for="direccion">Dirección</label>
                        <input name="direccion" type="text" value="<%= rs.getString("direccion")%>" class="form-control" required/>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-4">
                        <label for="telefono">Teléfono</label>
                        <input name="telefono" type="text" maxlength="15" value="<%= rs.getString("telefono")%>" class="form-control" required/>
                    </div>
                    <div class="col-4">
                        <label for="correo">Correo electrónico</label>
                        <input name="correo" type="email" value="<%= rs.getString("correo")%>" class="form-control" required/>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col">
                        <button type="submit" class="btn btn-warning text-white btn-block">
                            Actualizar
                        </button>
                    </div>
                </div>
            </form>
            <%
                }
            %>
        </div>
        <script
            src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
