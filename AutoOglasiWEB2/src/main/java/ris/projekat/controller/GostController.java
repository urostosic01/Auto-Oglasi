package ris.projekat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Oglas;
import ris.projekat.repository.OglasRepository;

@Controller
@RequestMapping(value = "/gost")
public class GostController {
	
	@Autowired
	OglasRepository or;
	
	@ModelAttribute("oglas")
	public Oglas getOglas() {
		return new Oglas();
	}
	
	@ModelAttribute("oglasi")
	public List<Oglas> getOglasi() {
		return or.findAll();
	}
	
	@RequestMapping(value = "/sviOglasi", method = RequestMethod.GET)
	public String sviOglasi() {
		return "prikaz/PregledOglasa";
	}
}
