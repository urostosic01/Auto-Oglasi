package ris.projekat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Model;
import model.Proizvodjac;

public interface ModelRepository extends JpaRepository<Model, Integer>{
	List<Model> findByProizvodjac(Proizvodjac p);
}
