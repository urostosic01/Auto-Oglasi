package ris.projekat.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Automobil;
import model.Clan;
import model.Model;
import model.Oglas;
import model.Poruka;
import model.Proizvodjac;
import model.Sacuvani;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import ris.projekat.repository.AutomobilRepository;
import ris.projekat.repository.ClanRepository;
import ris.projekat.repository.ModelRepository;
import ris.projekat.repository.OglasRepository;
import ris.projekat.repository.PorukaRepository;
import ris.projekat.repository.ProizvodjacRepository;
import ris.projekat.repository.SacuvaniRepository;

@Controller
@RequestMapping("/admin")
public class AdministratorController {

	// REPOSITORY

	@Autowired
	AutomobilRepository autoRepo;
	@Autowired
	ProizvodjacRepository proizvodjacRepo;
	@Autowired
	ModelRepository modelRepo;
	@Autowired
	ClanRepository clanRepo;
	@Autowired
	OglasRepository oglasRepo;
	@Autowired 
	PorukaRepository porukaRepo;
	@Autowired
	SacuvaniRepository sacuvaniRepo;

	// GET SA MODEL ATTRIBUTE

	@ModelAttribute("automobili")
	public List<Automobil> getAutomobili() {
		return autoRepo.findAll();
	}

	@ModelAttribute("proizvodjaci")
	public List<Proizvodjac> getProizvodjaci() {
		return proizvodjacRepo.findAll();
	}
	
	@ModelAttribute("modeli")
	public List<Model> getModeli(){
		return modelRepo.findAll();
	}
	
	
	@RequestMapping(value = "/pocetna", method = RequestMethod.GET)
	public String pocetna() {
		return "/index";
	}
	
	@RequestMapping(value="/unosAutomobila", method=RequestMethod.GET)
	public String unosAutomobila() {
		return "unos/UnosAutomobila";
	}

	@ModelAttribute("model")
	public Model getModel() {
		return new Model();
	}
	
	@ModelAttribute("automobil")
	public Automobil getAutomobil() {
		return new Automobil();
	}

	@RequestMapping(value="/nadjiModele", method=RequestMethod.GET)
	public String nadjiModele(Integer idProizvodjac, org.springframework.ui.Model m) {
		Proizvodjac p = proizvodjacRepo.findById(idProizvodjac).get();
		List<Model> modeli = modelRepo.findByProizvodjac(p);
		m.addAttribute("odabraniProizvodjac", p);
		m.addAttribute("modeliPoProizvodjacu", modeli);
		return "unos/UnosAutomobila";
	}
	
	
	@RequestMapping(value = "/unosProizvodjaca", method = RequestMethod.GET)
	public String unosProizvodjaca() {
		return "unos/UnosProizvodjaca";
	}

	@RequestMapping(value = "/sacuvajProizvodjaca", method = RequestMethod.POST)
	public String saveProizvodjac(Proizvodjac p, HttpServletRequest request) {
		proizvodjacRepo.save(p);
		request.getSession().setAttribute("proizvodjac", p);
		return "unos/UnosProizvodjaca";
	}

	@RequestMapping(value = "/sacuvajModel", method = RequestMethod.POST)
	public String sacuvajModel(@ModelAttribute("model") Model model, org.springframework.ui.Model m) {
		Model mod = modelRepo.save(model);
		m.addAttribute("modelNov", mod);
		return "unos/UnosProizvodjaca";
	}
	

}
