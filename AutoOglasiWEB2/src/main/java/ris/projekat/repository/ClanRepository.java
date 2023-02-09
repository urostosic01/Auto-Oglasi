package ris.projekat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Clan;

public interface ClanRepository extends JpaRepository<Clan, Integer>{
	Clan findByKorisnickoIme(String korisnickoIme); 
}
