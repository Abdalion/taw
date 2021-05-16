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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author egonb
 */
@Entity
@Table(name = "CHAT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Chat.findAll", query = "SELECT c FROM Chat c")
    , @NamedQuery(name = "Chat.findById", query = "SELECT c FROM Chat c WHERE c.id = :id")
    , @NamedQuery(name = "Chat.findByFechaIni", query = "SELECT c FROM Chat c WHERE c.fechaIni = :fechaIni")
    , @NamedQuery(name = "Chat.findByFechaFin", query = "SELECT c FROM Chat c WHERE c.fechaFin = :fechaFin")
    , @NamedQuery(name = "Chat.findByNotificaciones", query = "SELECT c FROM Chat c WHERE c.notificaciones = :notificaciones")})
public class Chat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "FECHA_INI")
    @Temporal(TemporalType.DATE)
    private Date fechaIni;
    @Column(name = "FECHA_FIN")
    @Temporal(TemporalType.DATE)
    private Date fechaFin;
    @Column(name = "NOTIFICACIONES")
    private Integer notificaciones;
    @JoinColumn(name = "ID_TELEOPERADOR", referencedColumnName = "ID")
    @ManyToOne
    private Usuario idTeleoperador;
    @JoinColumn(name = "ID_USUARIO", referencedColumnName = "ID")
    @ManyToOne
    private Usuario idUsuario;
    @OneToMany(mappedBy = "idChat")
    private List<Mensaje> mensajeList;

    public Chat() {
    }

    public Chat(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFechaIni() {
        return fechaIni;
    }

    public void setFechaIni(Date fechaIni) {
        this.fechaIni = fechaIni;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Integer getNotificaciones() {
        return notificaciones;
    }

    public void setNotificaciones(Integer notificaciones) {
        this.notificaciones = notificaciones;
    }

    public Usuario getIdTeleoperador() {
        return idTeleoperador;
    }

    public void setIdTeleoperador(Usuario idTeleoperador) {
        this.idTeleoperador = idTeleoperador;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    @XmlTransient
    public List<Mensaje> getMensajeList() {
        return mensajeList;
    }

    public void setMensajeList(List<Mensaje> mensajeList) {
        this.mensajeList = mensajeList;
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
        if (!(object instanceof Chat)) {
            return false;
        }
        Chat other = (Chat) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "gigdigger.entity.Chat[ id=" + id + " ]";
    }
    
}
