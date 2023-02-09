package ris.projekat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Clan;
import model.Sacuvani;

public interface SacuvaniRepository extends JpaRepository<Sacuvani, Integer>{
	List<Sacuvani> findByClan(Clan c);
}
