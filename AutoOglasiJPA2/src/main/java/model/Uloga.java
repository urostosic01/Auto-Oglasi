package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;
import java.util.Set;


/**
 * The persistent class for the uloga database table.
 * 
 */
@Entity
@NamedQuery(name="Uloga.findAll", query="SELECT u FROM Uloga u")
public class Uloga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUloga;

	private String naziv;

	//bi-directional many-to-many association to Clan
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
		name="clanuloga"
		, joinColumns={
			@JoinColumn(name="Uloga_idUloga")
			}
		, inverseJoinColumns={
			@JoinColumn(name="Clan_idClan")
			}
		)
	private Set<Clan> clans;

	public Uloga() {
	}

	public int getIdUloga() {
		return this.idUloga;
	}

	public void setIdUloga(int idUloga) {
		this.idUloga = idUloga;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public Set<Clan> getClans() {
		return this.clans;
	}

	public void setClans(Set<Clan> clans) {
		this.clans = clans;
	}
	public void addClan(Clan u) {
		this.clans.add(u);
	}

}