<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="container p-4">
            <a href="index.jsp" class="btn btn-danger text-white mt-2">Volver</a>
            <h1 class="text-warning">Actualizar producto</h1>
            <%
                String id = request.getParameter("id");
                PreparedStatement ps = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM productos WHERE id = '" + id + "'");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <form name="ProductUpdate" action="ProductUpdate" method="POST" class="form mt-4">
                <h5 class="text-secondary">Datos del producto</h5>
                <input name="id" type="text" value="<%= rs.getInt("id")%>" class="d-none">

                <div class="row">
                    <div class="col">
                        <label for="codigo">Código de barras</label>
                        <input name="codigo" type="text" value="<%= rs.getString("codigo")%>" class="form-control" required>
                    </div>
                    <div class="col">
                        <label for="nombre">Nombre</label>
                        <input name="nombre" type="text" value="<%= rs.getString("nombre")%>" class="form-control" required>
                    </div>
                    <div class="col">
                        <label for="descripcion">Descripción</label>
                        <input name="descripcion" type="text" value="<%= rs.getString("descripcion")%>" class="form-control" required>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col">
                        <label for="creacion">Fecha de captura</label>
                        <input
                            id="creacion"
                            name="creacion"
                            type="date"
                            value="<%= Conexion.Conexion.getDateNow()%>"
                            class="form-control"
                            required
                            />
                    </div>
                    <div class="col">
                        <label for="unidad">Unidad de medida</label>
                        <select name="unidad" type="text" class="form-control" required>
                            <%
                                PreparedStatement psu = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM unidad_medida");
                                ResultSet rs2 = psu.executeQuery();
                                boolean flag1 = true;
                                while (rs2.next()) {
                                    if (flag1) {
                                        flag1 = false;
                            %>
                            <option value="<%= rs.getString("unidad")%>" readonly><%= rs.getString("unidad")%></option>
                            <% }%>
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
                                PreparedStatement pspid = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM proveedor WHERE id = " + rs.getInt("id_proveedor"));
                                ResultSet rs3id = pspid.executeQuery();
                                while (rs3id.next()) {
                            %>
                            <option value="<%= rs3id.getInt("id")%>"><%= rs3id.getString("razonSocial")%></option>
                            <%
                                }
                            %>
                            <%
                                PreparedStatement psp = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM proveedor");
                                ResultSet rs3 = psp.executeQuery();
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
                        <input id="punitario" name="punitario" type="number" value="<%= rs.getString("costo")%>" min="1" class="form-control" onchange="calcularPrecioConIva()" required>
                    </div>
                    <div class="col">
                        <label for="iva">% IVA</label>
                        <input id="iva" name="iva" type="number" value="<%= rs.getString("iva")%>" min="1" class="form-control" onchange="calcularPrecioConIva()" required>
                    </div>
                    <div class="col">
                        <label for="pventa">Precio de venta</label>
                        <input id="pventa" name="pventa" value="<%= rs.getString("precioVenta")%>" type="text" min="1" class="form-control" required>
                    </div>
                    <div class="col d-flex flex-column">
                        <label for="disponibilidad">Disponibilidad</label>
                        <input name="disponibilidad" <%= rs.getInt("disponibilidad") == 1 ? "checked" : ""%> type="checkbox" value="1" class="mt-2 ml-3" aria-label="Checkbox for following text input">
                    </div>
                </div>

                <%
                    PreparedStatement ps2p = Conexion.Conexion.openConection().prepareStatement("SELECT * FROM proveedor WHERE id = '" + rs.getInt("id_proveedor") + "'");
                    ResultSet rs2p = ps2p.executeQuery();
                    while (rs2p.next()) {
                %>
                <h5 class="text-secondary mt-4">Datos del provedor</h5>

                <div class="row">
                    <div class="col">
                        <label for="rfc">RFC</label>
                        <input name="rfc" type="text" value="<%= rs2p.getString("rfc")%>" class="form-control" disabled>
                    </div>
                    <div class="col">
                        <label for="rsocial">Razón social</label>
                        <input name="rsocial" type="text" value="<%= rs2p.getString("razonSocial")%>"  class="form-control" disabled>
                    </div>
                    <div class="col">
                        <label for="direccion">Dirección</label>
                        <input name="direccion" type="text" value="<%= rs2p.getString("direccion")%>" class="form-control" disabled>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-4">
                        <label for="telefono">Teléfono</label>
                        <input name="telefono" type="text" value="<%= rs2p.getString("telefono")%>" class="form-control" disabled>
                    </div>
                    <div class="col-4">
                        <label for="correo">Correo electrónico</label>
                        <input name="correo" type="email" value="<%= rs2p.getString("correo")%>" class="form-control" disabled>
                    </div>
                    <div class="col-4 mb-4">
                        <label for="correo"></label>
                        <button type="submit" class="btn btn-block btn-warning mt-2 text-white">Actualizar</button>
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
            <%}
                }
            %>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
