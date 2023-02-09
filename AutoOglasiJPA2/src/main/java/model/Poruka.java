package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the poruka database table.
 * 
 */
@Entity
@NamedQuery(name="Poruka.findAll", query="SELECT p FROM Poruka p")
public class Poruka implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPoruka;

	private String sadrzaj;

	//bi-directional many-to-one association to Clan
	@ManyToOne
	@JoinColumn(name="Clan_idClan")
	private Clan clan1;

	//bi-directional many-to-one association to Clan
	@ManyToOne
	@JoinColumn(name="Clan_idClan1")
	private Clan clan2;

	public Poruka() {
	}

	public int getIdPoruka() {
		return this.idPoruka;
	}

	public void setIdPoruka(int idPoruka) {
		this.idPoruka = idPoruka;
	}

	public String getSadrzaj() {
		return this.sadrzaj;
	}

	public void setSadrzaj(String sadrzaj) {
		this.sadrzaj = sadrzaj;
	}

	public Clan getClan1() {
		return this.clan1;
	}

	public void setClan1(Clan clan1) {
		this.clan1 = clan1;
	}

	public Clan getClan2() {
		return this.clan2;
	}

	public void setClan2(Clan clan2) {
		this.clan2 = clan2;
	}

}