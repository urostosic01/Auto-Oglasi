package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the proizvodjac database table.
 * 
 */
@Entity
@NamedQuery(name="Proizvodjac.findAll", query="SELECT p FROM Proizvodjac p")
public class Proizvodjac implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProizvodjac;

	private String naziv;

	//bi-directional many-to-one association to Automobil
	@OneToMany(mappedBy="proizvodjac")
	private List<Automobil> automobils;

	//bi-directional many-to-one association to Model
	@OneToMany(mappedBy="proizvodjac")
	private List<Model> models;

	public Proizvodjac() {
	}

	public int getIdProizvodjac() {
		return this.idProizvodjac;
	}

	public void setIdProizvodjac(int idProizvodjac) {
		this.idProizvodjac = idProizvodjac;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Automobil> getAutomobils() {
		return this.automobils;
	}

	public void setAutomobils(List<Automobil> automobils) {
		this.automobils = automobils;
	}

	public Automobil addAutomobil(Automobil automobil) {
		getAutomobils().add(automobil);
		automobil.setProizvodjac(this);

		return automobil;
	}

	public Automobil removeAutomobil(Automobil automobil) {
		getAutomobils().remove(automobil);
		automobil.setProizvodjac(null);

		return automobil;
	}

	public List<Model> getModels() {
		return this.models;
	}

	public void setModels(List<Model> models) {
		this.models = models;
	}

	public Model addModel(Model model) {
		getModels().add(model);
		model.setProizvodjac(this);

		return model;
	}

	public Model removeModel(Model model) {
		getModels().remove(model);
		model.setProizvodjac(null);

		return model;
	}

}