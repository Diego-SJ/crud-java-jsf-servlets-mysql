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
            <div class="row">
                <a href="index.jsp" class="btn btn-outline-success"
                   >Administrar productos</a
                >
                <a href="proveedores.jsp" class="btn btn-outline-success ml-4"
                   >Administrar proveedores</a
                >
                <button
                    disabled
                    class="btn btn-success ml-4"
                    >
                    Administrar unidades
                </button>
            </div>
            <div class="row pt-4">
                <div class="col-4">
                    <h4 class="text-success">Registrar unidad de medida</h4>
                    <form name="UnitAdd" action="UnitAdd" method="POST" class="form mt-4">
                        <div class="row">
                            <div class="col">
                                <label for="nombre">Nombre</label>
                                <input name="nombre" type="text" class="form-control" required/>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <label for="unidad">Unidad</label>
                                <input name="unidad" type="text" class="form-control" required/>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col">
                                <button type="submit" class="btn btn-success btn-block">Guardar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-8">
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Unidad</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PreparedStatement ps = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM unidad_medida");
                                ResultSet rs = ps.executeQuery();
                                int count = 0;
                                while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= ++count%></th>
                                <td><%= rs.getString("nombre")%></td>
                                <td><%= rs.getString("unidad")%></td>
                                <td class="row d-flex justify-content-around">
                                    <a href="EditarUnidad.jsp?id=<%= rs.getInt("id")%>" class="btn btn-warning">Editar</a>

                                    <a href="EliminarUnidad.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger text-white">Eliminar</a>
                                </td>
                            </tr>

                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
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
