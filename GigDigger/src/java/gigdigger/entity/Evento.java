/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ruben
 */
@Entity
@Table(name = "EVENTO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Evento.findAll", query = "SELECT e FROM Evento e")
    , @NamedQuery(name = "Evento.findById", query = "SELECT e FROM Evento e WHERE e.id = :id")
    , @NamedQuery(name = "Evento.findByTitulo", query = "SELECT e FROM Evento e WHERE e.titulo = :titulo")
    , @NamedQuery(name = "Evento.findByDescripcion", query = "SELECT e FROM Evento e WHERE e.descripcion = :descripcion")
    , @NamedQuery(name = "Evento.findByFechaEvento", query = "SELECT e FROM Evento e WHERE e.fechaEvento = :fechaEvento")
    , @NamedQuery(name = "Evento.findByFechaLimite", query = "SELECT e FROM Evento e WHERE e.fechaLimite = :fechaLimite")
    , @NamedQuery(name = "Evento.findByPrecio", query = "SELECT e FROM Evento e WHERE e.precio = :precio")
    , @NamedQuery(name = "Evento.findByAforo", query = "SELECT e FROM Evento e WHERE e.aforo = :aforo")
    , @NamedQuery(name = "Evento.findByLimiteUsuario", query = "SELECT e FROM Evento e WHERE e.limiteUsuario = :limiteUsuario")
    , @NamedQuery(name = "Evento.findByNFilas", query = "SELECT e FROM Evento e WHERE e.nFilas = :nFilas")
    , @NamedQuery(name = "Evento.findByNAsientosFila", query = "SELECT e FROM Evento e WHERE e.nAsientosFila = :nAsientosFila")})
public class Evento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "TITULO")
    private String titulo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Column(name = "FECHA_EVENTO")
    @Temporal(TemporalType.DATE)
    private Date fechaEvento;
    @Column(name = "FECHA_LIMITE")
    @Temporal(TemporalType.DATE)
    private Date fechaLimite;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRECIO")
    private Double precio;
    @Column(name = "AFORO")
    private Integer aforo;
    @Column(name = "LIMITE_USUARIO")
    private Integer limiteUsuario;
    @Column(name = "N_FILAS")
    private Integer nFilas;
    @Column(name = "N_ASIENTOS_FILA")
    private Integer nAsientosFila;
    @OneToMany(mappedBy = "idEvento")
    private List<Entrada> entradaList;
    @OneToMany(mappedBy = "idEvento")
    private List<Etiqueta> etiquetaList;

    public Evento() {
    }

    public Evento(Integer id) {
        this.id = id;
    }

    public Evento(Integer id, String titulo, String descripcion) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(Date fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public Date getFechaLimite() {
        return fechaLimite;
    }

    public void setFechaLimite(Date fechaLimite) {
        this.fechaLimite = fechaLimite;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Integer getAforo() {
        return aforo;
    }

    public void setAforo(Integer aforo) {
        this.aforo = aforo;
    }

    public Integer getLimiteUsuario() {
        return limiteUsuario;
    }

    public void setLimiteUsuario(Integer limiteUsuario) {
        this.limiteUsuario = limiteUsuario;
    }

    public Integer getNFilas() {
        return nFilas;
    }

    public void setNFilas(Integer nFilas) {
        this.nFilas = nFilas;
    }

    public Integer getNAsientosFila() {
        return nAsientosFila;
    }

    public void setNAsientosFila(Integer nAsientosFila) {
        this.nAsientosFila = nAsientosFila;
    }

    @XmlTransient
    public List<Entrada> getEntradaList() {
        return entradaList;
    }

    public void setEntradaList(List<Entrada> entradaList) {
        this.entradaList = entradaList;
    }

    @XmlTransient
    public List<Etiqueta> getEtiquetaList() {
        return etiquetaList;
    }

    public void setEtiquetaList(List<Etiqueta> etiquetaList) {
        this.etiquetaList = etiquetaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Evento)) {
            return false;
        }
        Evento other = (Evento) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "gigdigger.entity.Evento[ id=" + id + " ]";
    }
    
}
