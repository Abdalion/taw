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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
 * @author egonb
 */
@Entity
@Table(name = "ESTUDIO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estudio.findAll", query = "SELECT e FROM Estudio e")
    , @NamedQuery(name = "Estudio.findById", query = "SELECT e FROM Estudio e WHERE e.id = :id")
    , @NamedQuery(name = "Estudio.findByNombreEstudio", query = "SELECT e FROM Estudio e WHERE e.nombreEstudio = :nombreEstudio")
    , @NamedQuery(name = "Estudio.findByDescripcion", query = "SELECT e FROM Estudio e WHERE e.descripcion = :descripcion")
    , @NamedQuery(name = "Estudio.findByFechaCreacion", query = "SELECT e FROM Estudio e WHERE e.fechaCreacion = :fechaCreacion")
    , @NamedQuery(name = "Estudio.findByTipo", query = "SELECT e FROM Estudio e WHERE e.tipo = :tipo")})
public class Estudio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NOMBRE_ESTUDIO")
    private String nombreEstudio;
    @Basic(optional = false)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Column(name = "FECHA_CREACION")
    @Temporal(TemporalType.DATE)
    private Date fechaCreacion;
    @Column(name = "TIPO")
    private String tipo;
    @OneToMany(mappedBy = "idEstudio")
    private List<EstudioUsuarios> estudioUsuariosList;
    @JoinColumn(name = "CREADOR_ESTUDIO", referencedColumnName = "ID")
    @ManyToOne
    private Usuario creadorEstudio;
    @OneToMany(mappedBy = "idEstudio")
    private List<EstudioEventos> estudioEventosList;

    public Estudio() {
    }

    public Estudio(Integer id) {
        this.id = id;
    }

    public Estudio(Integer id, String nombreEstudio, String descripcion) {
        this.id = id;
        this.nombreEstudio = nombreEstudio;
        this.descripcion = descripcion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombreEstudio() {
        return nombreEstudio;
    }

    public void setNombreEstudio(String nombreEstudio) {
        this.nombreEstudio = nombreEstudio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @XmlTransient
    public List<EstudioUsuarios> getEstudioUsuariosList() {
        return estudioUsuariosList;
    }

    public void setEstudioUsuariosList(List<EstudioUsuarios> estudioUsuariosList) {
        this.estudioUsuariosList = estudioUsuariosList;
    }

    public Usuario getCreadorEstudio() {
        return creadorEstudio;
    }

    public void setCreadorEstudio(Usuario creadorEstudio) {
        this.creadorEstudio = creadorEstudio;
    }

    @XmlTransient
    public List<EstudioEventos> getEstudioEventosList() {
        return estudioEventosList;
    }

    public void setEstudioEventosList(List<EstudioEventos> estudioEventosList) {
        this.estudioEventosList = estudioEventosList;
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
        if (!(object instanceof Estudio)) {
            return false;
        }
        Estudio other = (Estudio) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "gigdigger.entity.Estudio[ id=" + id + " ]";
    }
    
}
