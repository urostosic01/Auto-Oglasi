package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the oglas database table.
 * 
 */
@Entity
@NamedQuery(name="Oglas.findAll", query="SELECT o FROM Oglas o")
public class Oglas implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idOglas;

	private int brPregleda;

	private int cena;

	@Temporal(TemporalType.TIMESTAMP)
	private Date datumObjave;

	private String mesto;

	//bi-directional many-to-one association to Clan
	@ManyToOne
	private Clan clan;

	//bi-directional many-to-one association to Sacuvani
	@OneToMany(mappedBy="ogla")
	private List<Sacuvani> sacuvanis;

	//bi-directional one-to-one association to Automobil
	@OneToOne
	private Automobil automobil;

	public Oglas() {
	}

	public int getIdOglas() {
		return this.idOglas;
	}

	public void setIdOglas(int idOglas) {
		this.idOglas = idOglas;
	}

	public int getBrPregleda() {
		return this.brPregleda;
	}

	public void setBrPregleda(int brPregleda) {
		this.brPregleda = brPregleda;
	}

	public int getCena() {
		return this.cena;
	}

	public void setCena(int cena) {
		this.cena = cena;
	}

	public Date getDatumObjave() {
		return this.datumObjave;
	}

	public void setDatumObjave(Date datumObjave) {
		this.datumObjave = datumObjave;
	}

	public String getMesto() {
		return this.mesto;
	}

	public void setMesto(String mesto) {
		this.mesto = mesto;
	}

	public Clan getClan() {
		return this.clan;
	}

	public void setClan(Clan clan) {
		this.clan = clan;
	}

	public List<Sacuvani> getSacuvanis() {
		return this.sacuvanis;
	}

	public void setSacuvanis(List<Sacuvani> sacuvanis) {
		this.sacuvanis = sacuvanis;
	}

	public Sacuvani addSacuvani(Sacuvani sacuvani) {
		getSacuvanis().add(sacuvani);
		sacuvani.setOgla(this);

		return sacuvani;
	}

	public Sacuvani removeSacuvani(Sacuvani sacuvani) {
		getSacuvanis().remove(sacuvani);
		sacuvani.setOgla(null);

		return sacuvani;
	}

	public Automobil getAutomobil() {
		return this.automobil;
	}

	public void setAutomobil(Automobil automobil) {
		this.automobil = automobil;
	}

}