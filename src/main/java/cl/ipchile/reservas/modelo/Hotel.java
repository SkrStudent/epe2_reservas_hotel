package cl.ipchile.reservas.modelo;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "hoteles")
public class Hotel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 120)
    private String nombre;

    @Column(nullable = false, length = 100)
    private String ciudad;

    @Column(length = 200)
    private String direccion;

    public Hotel() { }

    public Hotel(String nombre, String ciudad, String direccion) {
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.direccion = direccion;
    }

    // Getters y setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }
}
