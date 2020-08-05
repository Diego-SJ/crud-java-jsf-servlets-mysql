package Modelo;

public class Producto {
    private int id;
    private String codigo;
    private String descripcion;
    private String fechaApertura;
    private String unidad;
    private double costo;
    private double iva;
    private double precioVenta;
    private boolean disponibilidad;
    private String rfc;
    private String razonSocial;
    private String direccion;
    private String telefono;
    private String correo;

    public Producto() {
    }

    public Producto(int id, String codigo, String descripcion, String fechaApertura, String unidad, double costo, double iva, double precioVenta, boolean disponibilidad, String rfc, String razonSocial, String direccion, String telefono, String correo) {
        this.id = id;
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.fechaApertura = fechaApertura;
        this.unidad = unidad;
        this.costo = costo;
        this.iva = iva;
        this.precioVenta = precioVenta;
        this.disponibilidad = disponibilidad;
        this.rfc = rfc;
        this.razonSocial = razonSocial;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(String fechaApertura) {
        this.fechaApertura = fechaApertura;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public double getIva() {
        return iva;
    }

    public void setIva(double iva) {
        this.iva = iva;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public boolean isDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(boolean disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    
}
