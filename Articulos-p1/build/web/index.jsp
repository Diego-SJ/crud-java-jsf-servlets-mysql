<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="container p-4">
            <div class="row">
                <button class="btn btn-success " data-toggle="modal" data-target=".new-product">Agregar producto</button>
                <a href="proveedores.jsp" class="btn btn-outline-success ml-4">Administrar proveedores</a>
                <a href="unidadDeMedida.jsp" class="btn btn-outline-success ml-4">Administrar unidades de medida</a>
            </div>
            <div class="row pt-4">
                <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Precio venta</th>
                            <th scope="col">Fecha de apertura</th>
                            <th scope="col">Disponibilidad</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            PreparedStatement ps = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM productos");
                            ResultSet rs = ps.executeQuery();
                            int count = 0;
                            while (rs.next()) {
                        %>
                        <tr>
                            <th scope="row"><%= ++count%></th>
                            <td><%= rs.getString("nombre")%></td>
                            <td><%= rs.getString("descripcion")%></td>
                            <td><%= rs.getString("precioVenta")%></td>
                            <td><%= rs.getString("fechaApertura")%></td>
                            <td><%= rs.getInt("disponibilidad") == 1 ? "disponible" : "no disponible"%></td>
                            <td class="row d-flex justify-content-around">
                                <a href="EditarProducto.jsp?id=<%= rs.getInt("id")%>" class="btn btn-warning text-white">Editar</a>
                                
                                <a href="EliminarProducto.jsp?id=<%= rs.getInt("id")%>" class="btn btn-danger text-white">Eliminar</a>
                            </td>
                        </tr>


                    <%
                        }
                    %>
                    </tbody>
                </table>
                <%
                    if (count == 0) {
                %>
                <tr><h5>No hay productos registrados</h5></tr>
                <%
                    }
                %>
            </div>
        </div>

        <div class="modal fade new-product" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content p-4">
                    <h4 class="text-success">Registrar producto</h4>
                    <form name="ProductAdd" action="ProductAdd" method="POST" class="form mt-4">

                        <div class="row">
                            <div class="col">
                                <label for="codigo">Código de barras</label>
                                <input name="codigo" type="text" class="form-control" required />
                            </div>
                            <div class="col">
                                <label for="nombre">Nombre</label>
                                <input
                                    name="nombre"
                                    type="text"
                                    class="form-control"
                                    required
                                    />
                            </div>
                            <div class="col">
                                <label for="descripcion">Descripción</label>
                                <input
                                    name="descripcion"
                                    type="text"
                                    class="form-control"
                                    required
                                    />
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col">
                                <label for="creacion">Fecha de captura</label>
                                <input
                                    id="creacion"
                                    name="creacion"
                                    type="date"
                                    value="<%= Conexion.Conexion.getDateNow() %>"
                                    class="form-control"
                                    required
                                    />
                            </div>
                            <div class="col">
                                <label for="unidad">Unidad de medida</label>
                                <select name="unidad" type="text" class="form-control" required>
                                    <%
                                        PreparedStatement ps2 = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM unidad_medida");
                                        ResultSet rs2 = ps2.executeQuery();
                                        while (rs2.next()) {
                                    %>
                                    <option value="<%= rs2.getString("unidad")%>"><%= rs2.getString("unidad")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col">
                                <label for="proveedor">Proveedor</label>
                                <select name="proveedor" type="text" class="form-control" required>
                                    <%
                                        PreparedStatement ps3 = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM proveedor");
                                        ResultSet rs3 = ps3.executeQuery();
                                        while (rs3.next()) {
                                    %>
                                    <option value="<%= rs3.getInt("id")%>"><%= rs3.getString("razonSocial")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                                
                        <div class="row mt-2">
                            <div class="col">
                                <label for="punitario">Costo unitario</label>
                                <input
                                    id="punitario"
                                    name="punitario"
                                    type="number"
                                    min="1"
                                    class="form-control"
                                    onchange="calcularPrecioConIva()"
                                    required
                                    />
                            </div>
                            <div class="col">
                                <label for="iva">% IVA</label>
                                <input
                                    id="iva"
                                    name="iva"
                                    type="number"
                                    min="1"
                                    class="form-control"
                                    onchange="calcularPrecioConIva()"
                                    required
                                    />
                            </div>
                            <div class="col">
                                <label for="pventa">Precio de venta</label>
                                <input
                                    id="pventa"
                                    name="pventa"
                                    type="number"
                                    class="form-control"
                                    readonly
                                    />
                            </div>
                            <div class="col-4 d-flex flex-column">
                                <label for="disponibilidad">Disponibilidad</label>
                                <input
                                    name="disponibilidad"
                                    type="checkbox"
                                    class="mt-2 align-self-center"
                                    aria-label="Checkbox for following text input"
                                    />
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col">
                                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Cancelar</button>
                            </div>
                            <div class="col">
                                <button class="btn btn-success text-white btn-block">
                                    Registrar
                                </button>
                            </div>
                        </div>
                        <script>
                            function calcularPrecioConIva() {
                                document.getElementById('pventa').value =
                                        document.getElementById('punitario').value *
                                        (document.getElementById('iva').value / 100);
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>