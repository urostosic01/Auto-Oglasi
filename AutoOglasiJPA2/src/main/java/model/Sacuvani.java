package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the sacuvani database table.
 * 
 */
@Entity
@NamedQuery(name="Sacuvani.findAll", query="SELECT s FROM Sacuvani s")
public class Sacuvani implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idSacuvan;

	private String napomena;

	//bi-directional many-to-one association to Clan
	@ManyToOne
	private Clan clan;

	//bi-directional many-to-one association to Oglas
	@ManyToOne
	@JoinColumn(name="Oglas_idOglas")
	private Oglas ogla;

	public Sacuvani() {
	}

	public int getIdSacuvan() {
		return this.idSacuvan;
	}

	public void setIdSacuvan(int idSacuvan) {
		this.idSacuvan = idSacuvan;
	}

	public String getNapomena() {
		return this.napomena;
	}

	public void setNapomena(String napomena) {
		this.napomena = napomena;
	}

	public Clan getClan() {
		return this.clan;
	}

	public void setClan(Clan clan) {
		this.clan = clan;
	}

	public Oglas getOgla() {
		return this.ogla;
	}

	public void setOgla(Oglas ogla) {
		this.ogla = ogla;
	}

}