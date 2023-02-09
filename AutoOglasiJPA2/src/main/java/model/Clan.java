package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;
import java.util.Set;


/**
 * The persistent class for the clan database table.
 * 
 */
@Entity
@NamedQuery(name="Clan.findAll", query="SELECT c FROM Clan c")
public class Clan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idClan;

	private String adresa;

	private String brojTelefona;

	private String ime;

	private String korisnickoIme;

	private String prezime;

	private String sifra;

	//bi-directional many-to-one association to Oglas
	@OneToMany(mappedBy="clan")
	private List<Oglas> oglas;

	//bi-directional many-to-one association to Poruka
	@OneToMany(mappedBy="clan1")
	private List<Poruka> porukas1;

	//bi-directional many-to-one association to Poruka
	@OneToMany(mappedBy="clan2")
	private List<Poruka> porukas2;

	//bi-directional many-to-one association to Sacuvani
	@OneToMany(mappedBy="clan")
	private List<Sacuvani> sacuvanis;

	//bi-directional many-to-many association to Uloga
	@ManyToMany(mappedBy="clans", fetch = FetchType.EAGER)
	private Set<Uloga> ulogas;

	public Clan() {
	}

	public int getIdClan() {
		return this.idClan;
	}

	public void setIdClan(int idClan) {
		this.idClan = idClan;
	}

	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public String getBrojTelefona() {
		return this.brojTelefona;
	}

	public void setBrojTelefona(String brojTelefona) {
		this.brojTelefona = brojTelefona;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getKorisnickoIme() {
		return this.korisnickoIme;
	}

	public void setKorisnickoIme(String korisnickoIme) {
		this.korisnickoIme = korisnickoIme;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getSifra() {
		return this.sifra;
	}

	public void setSifra(String sifra) {
		this.sifra = sifra;
	}

	public List<Oglas> getOglas() {
		return this.oglas;
	}

	public void setOglas(List<Oglas> oglas) {
		this.oglas = oglas;
	}

	public Oglas addOgla(Oglas ogla) {
		getOglas().add(ogla);
		ogla.setClan(this);

		return ogla;
	}

	public Oglas removeOgla(Oglas ogla) {
		getOglas().remove(ogla);
		ogla.setClan(null);

		return ogla;
	}

	public List<Poruka> getPorukas1() {
		return this.porukas1;
	}

	public void setPorukas1(List<Poruka> porukas1) {
		this.porukas1 = porukas1;
	}

	public Poruka addPorukas1(Poruka porukas1) {
		getPorukas1().add(porukas1);
		porukas1.setClan1(this);

		return porukas1;
	}

	public Poruka removePorukas1(Poruka porukas1) {
		getPorukas1().remove(porukas1);
		porukas1.setClan1(null);

		return porukas1;
	}

	public List<Poruka> getPorukas2() {
		return this.porukas2;
	}

	public void setPorukas2(List<Poruka> porukas2) {
		this.porukas2 = porukas2;
	}

	public Poruka addPorukas2(Poruka porukas2) {
		getPorukas2().add(porukas2);
		porukas2.setClan2(this);

		return porukas2;
	}

	public Poruka removePorukas2(Poruka porukas2) {
		getPorukas2().remove(porukas2);
		porukas2.setClan2(null);

		return porukas2;
	}

	public List<Sacuvani> getSacuvanis() {
		return this.sacuvanis;
	}

	public void setSacuvanis(List<Sacuvani> sacuvanis) {
		this.sacuvanis = sacuvanis;
	}

	public Sacuvani addSacuvani(Sacuvani sacuvani) {
		getSacuvanis().add(sacuvani);
		sacuvani.setClan(this);

		return sacuvani;
	}

	public Sacuvani removeSacuvani(Sacuvani sacuvani) {
		getSacuvanis().remove(sacuvani);
		sacuvani.setClan(null);

		return sacuvani;
	}

	public Set<Uloga> getUlogas() {
		return this.ulogas;
	}

	public void setUlogas(Set<Uloga> ulogas) {
		this.ulogas = ulogas;
	}
	public void addUloga(Uloga u) {
		this.ulogas.add(u);
	}
}