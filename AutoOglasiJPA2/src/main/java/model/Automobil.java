package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the automobil database table.
 * 
 */
@Entity
@NamedQuery(name="Automobil.findAll", query="SELECT a FROM Automobil a")
public class Automobil implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idAutomobil;

	private int godiste;

	private String gorivo;

	private String karoserija;

	private int kubikaza;

	private String opis;

	@Lob
	private byte[] slika;

	private int snaga;

	//bi-directional many-to-one association to Model
	@ManyToOne
	private Model model;

	//bi-directional many-to-one association to Proizvodjac
	@ManyToOne
	private Proizvodjac proizvodjac;

	//bi-directional one-to-one association to Oglas
	@OneToOne(mappedBy="automobil")
	private Oglas ogla;

	public Automobil() {
	}

	public int getIdAutomobil() {
		return this.idAutomobil;
	}

	public void setIdAutomobil(int idAutomobil) {
		this.idAutomobil = idAutomobil;
	}

	public int getGodiste() {
		return this.godiste;
	}

	public void setGodiste(int godiste) {
		this.godiste = godiste;
	}

	public String getGorivo() {
		return this.gorivo;
	}

	public void setGorivo(String gorivo) {
		this.gorivo = gorivo;
	}

	public String getKaroserija() {
		return this.karoserija;
	}

	public void setKaroserija(String karoserija) {
		this.karoserija = karoserija;
	}

	public int getKubikaza() {
		return this.kubikaza;
	}

	public void setKubikaza(int kubikaza) {
		this.kubikaza = kubikaza;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public byte[] getSlika() {
		return this.slika;
	}

	public void setSlika(byte[] slika) {
		this.slika = slika;
	}

	public int getSnaga() {
		return this.snaga;
	}

	public void setSnaga(int snaga) {
		this.snaga = snaga;
	}

	public Model getModel() {
		return this.model;
	}

	public void setModel(Model model) {
		this.model = model;
	}

	public Proizvodjac getProizvodjac() {
		return this.proizvodjac;
	}

	public void setProizvodjac(Proizvodjac proizvodjac) {
		this.proizvodjac = proizvodjac;
	}

	public Oglas getOgla() {
		return this.ogla;
	}

	public void setOgla(Oglas ogla) {
		this.ogla = ogla;
	}

}