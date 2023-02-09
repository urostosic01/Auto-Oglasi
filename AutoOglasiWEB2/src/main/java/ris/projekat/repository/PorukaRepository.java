package ris.projekat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Clan;
import model.Poruka;

public interface PorukaRepository extends JpaRepository<Poruka, Integer>{
	List<Poruka> findByClan1(Clan c);
	List<Poruka> findByClan2(Clan c);

}
