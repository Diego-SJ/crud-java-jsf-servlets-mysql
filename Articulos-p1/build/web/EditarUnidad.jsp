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
            <a href="" class="btn btn-danger text-white mt-2 mb-4">Volver</a>
            <h1 class="text-warning">Actualizar unidad de medida</h1>
            <%
                String id = request.getParameter("id");
                PreparedStatement ps = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM unidad_medida WHERE id = '" + id + "'");
                ResultSet rs = ps.executeQuery();
                int count = 0;
                while (rs.next()) {
            %>
            <form name="UnitUpdate" action="UnitUpdate" method="POST" class="form mt-4">
                <input name="id" type="text" value="<%= rs.getInt("id")%>" class="form-control d-none" />
                <div class="row">
                    <div class="col">
                        <label for="nombre">Nombre</label>
                        <input name="nombre" type="text" value="<%= rs.getString("nombre")%>" class="form-control" required />
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <label for="unidad">Unidad</label>
                        <input name="unidad" type="text" value="<%= rs.getString("unidad")%>" class="form-control" required />
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col">
                        <button class="btn btn-warning text-white btn-block">
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
