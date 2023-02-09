package ris.projekat.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.Automobil;
import model.Oglas;
import model.Proizvodjac;

public interface AutomobilRepository extends JpaRepository<Automobil, Integer>{
	
}
