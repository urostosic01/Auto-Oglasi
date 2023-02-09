package ris.projekat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Clan;
import model.Oglas;

public interface OglasRepository extends JpaRepository<Oglas, Integer>{
	@Query("select o from Oglas o order by o.cena asc")
	List<Oglas> sortCenaRastuce();
	
	@Query("select o from Oglas o order by o.cena desc")
	List<Oglas> sortCenaOpadajuce();
	
	@Query("select o from Oglas o order by o.datumObjave desc")
	List<Oglas> sortDatumNajnoviji();
	
	@Query("select o from Oglas o where o.automobil.proizvodjac.idProizvodjac=:idProizvodjac")
	List<Oglas> oglasiPoProizvodjacu(@Param("idProizvodjac") Integer idProizvodjac);
	
	@Query("select o from Oglas o where o.automobil.model.idModel =:idModel and o.automobil.proizvodjac.idProizvodjac=:idProizvodjac")
	List<Oglas> oglasiPoModelu(@Param("idModel") Integer idModel, @Param("idProizvodjac") Integer idProizvodjac);
	
	List<Oglas> findByClan(Clan c);
	
	@Query("select o from Oglas o where o.automobil.proizvodjac.idProizvodjac =:idProizv and o.automobil.snaga <= 80 and o.cena <:cena and o.automobil.godiste >:god")
	List<Oglas> oglasiZaPocetnika(@Param("idProizv") Integer idProizvodjac, @Param("cena") Integer cena, @Param("god")Integer god);
	
}
