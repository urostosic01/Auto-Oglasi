package ris.projekat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Clan;
import model.Oglas;


public interface OglasRepository extends JpaRepository<Oglas, Integer>{	
	List<Oglas> findByClan(Clan c);				// nadji oglase po clanu
	List<Oglas> findByOrderByCenaAsc(); 		// sortirani po ceni rastuce
	List<Oglas> findByOrderByCenaDesc();		// sortirani po ceni opadajuce
	List<Oglas> findByOrderByDatumObjaveAsc();  // sortirani po datumu objave - najstariji prvo
	List<Oglas> findByOrderByDatumObjaveDesc(); // sortirani po datumu objave - najnoviji prvo
	
	@Query("select o from Oglas o where o.automobil.proizvodjac.idProizvodjac=:idProizvodjac "
			+ "order by o.datumObjave desc")
	List<Oglas> oglasiPoProizvodjacu(@Param("idProizvodjac") Integer idProizvodjac); // dobavi sve oglase po proizvodjacu
	
	@Query("select o from Oglas o where o.automobil.model.idModel =:idModel "
			+ "and o.automobil.proizvodjac.idProizvodjac=:idProizvodjac order by o.datumObjave desc")
	List<Oglas> oglasiPoModelu(@Param("idModel") Integer idModel, 
								@Param("idProizvodjac") Integer idProizvodjac); // dobavi sve oglase po modelu
	
	@Query("select o from Oglas o where o.automobil.proizvodjac.idProizvodjac =:idProizv "
			+ "and o.automobil.snaga <= 80 and o.cena <:cena and o.automobil.godiste >:god") 
	List<Oglas> oglasiZaPocetnika(@Param("idProizv") Integer idProizvodjac, 
									@Param("cena") Integer cena, @Param("god")Integer god); // dobavi odgovarajuce automobile za pocetnika
	
}
