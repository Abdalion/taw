/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gigdigger.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author egonb
 */
@Entity
@Table(name = "USUARIO_AUTO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsuarioAuto.findAll", query = "SELECT u FROM UsuarioAuto u")
    , @NamedQuery(name = "UsuarioAuto.findById", query = "SELECT u FROM UsuarioAuto u WHERE u.id = :id")
    , @NamedQuery(name = "UsuarioAuto.findByNombre", query = "SELECT u FROM UsuarioAuto u WHERE u.nombre = :nombre")
    , @NamedQuery(name = "UsuarioAuto.findByApellidos", query = "SELECT u FROM UsuarioAuto u WHERE u.apellidos = :apellidos")
    , @NamedQuery(name = "UsuarioAuto.findByDomicilio", query = "SELECT u FROM UsuarioAuto u WHERE u.domicilio = :domicilio")
    , @NamedQuery(name = "UsuarioAuto.findByCiudad", query = "SELECT u FROM UsuarioAuto u WHERE u.ciudad = :ciudad")
    , @NamedQuery(name = "UsuarioAuto.findByEdad", query = "SELECT u FROM UsuarioAuto u WHERE u.edad = :edad")
    , @NamedQuery(name = "UsuarioAuto.findBySexo", query = "SELECT u FROM UsuarioAuto u WHERE u.sexo = :sexo")})
public class UsuarioAuto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "NOMBRE")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "APELLIDOS")
    private String apellidos;
    @Column(name = "DOMICILIO")
    private String domicilio;
    @Column(name = "CIUDAD")
    private String ciudad;
    @Column(name = "EDAD")
    private Integer edad;
    @Basic(optional = false)
    @Column(name = "SEXO")
    private String sexo;
    @JoinColumn(name = "ID", referencedColumnName = "ID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;
    @OneToMany(mappedBy = "idUsuario")
    private List<EstudioUsuarios> estudioUsuariosList;

    public UsuarioAuto() {
    }

    public UsuarioAuto(Integer id) {
        this.id = id;
    }

    public UsuarioAuto(Integer id, String nombre, String apellidos, String sexo) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.sexo = sexo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @XmlTransient
    public List<EstudioUsuarios> getEstudioUsuariosList() {
        return estudioUsuariosList;
    }

    public void setEstudioUsuariosList(List<EstudioUsuarios> estudioUsuariosList) {
        this.estudioUsuariosList = estudioUsuariosList;
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
        if (!(object instanceof UsuarioAuto)) {
            return false;
        }
        UsuarioAuto other = (UsuarioAuto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "gigdigger.entity.UsuarioAuto[ id=" + id + " ]";
    }
    
}
