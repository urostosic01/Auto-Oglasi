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

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.security.config.web.server.ServerHttpSecurity.HttpsRedirectSpec;
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
import model.Uloga;
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
@RequestMapping("/oglasi")
public class OglasiController {

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
	@ModelAttribute("oglasi")
	public List<Oglas> getOglasi() {
		return oglasRepo.findAll();
	}
	@ModelAttribute("poruke")
	public List<Poruka> getPoruke(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(p.getName());
		List<Poruka> poruke = porukaRepo.findByClan1(c);
		return poruke;
	}
	
	@RequestMapping(value = "/pocetna", method = RequestMethod.GET)
	public String pocetna() {
		return "/index";
	}
	@RequestMapping(value = "/sviOglasi", method = RequestMethod.GET)
	public String sviOglasi() {
		return "prikaz/PregledOglasa";
	}
	@RequestMapping(value = "/unosModela", method = RequestMethod.GET)
	public String unosModela() {
		return "unos/UnosModela";
	}
	@RequestMapping(value="/unosAutomobila", method=RequestMethod.GET)
	public String unosAutomobila() {
		return "unos/UnosAutomobila";
	}
	@RequestMapping(value = "/izvestajPocetnik", method = RequestMethod.GET)
	public String izvestajPocetnik() {
		return "unos/IzvestajPocetnik";
	}

	@ModelAttribute("model")
	public Model getModel() {
		return new Model();
	}
	@ModelAttribute("oglas")
	public Oglas getOglas() {
		return new Oglas();
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
	@RequestMapping(value="/nadjiModelePretraga", method=RequestMethod.GET)
	public String nadjiModelePretraga(Integer idProizvodjac, org.springframework.ui.Model m) {
		Proizvodjac p = proizvodjacRepo.findById(idProizvodjac).get();
		List<Model> modeli = modelRepo.findByProizvodjac(p);
		List<Oglas> oglasi = oglasRepo.oglasiPoProizvodjacu(p.getIdProizvodjac());
			
		m.addAttribute("odabraniProizvodjac", p);
		m.addAttribute("modeliPoProizvodjacu", modeli);
		m.addAttribute("oglasi", oglasi);
		
		return "prikaz/PregledOglasa";
	}
	@RequestMapping(value = "/nadjiOglaseModela", method = RequestMethod.GET)
	public String nadjiOglaseModela(Integer idProizvodjac, Integer idModel, org.springframework.ui.Model m) {
		List<Oglas> oglasi = oglasRepo.oglasiPoModelu(idModel, idProizvodjac);
		m.addAttribute("oglasi", oglasi);
		return "prikaz/PregledOglasa";
	}
	

	@RequestMapping(value="/sacAutomobil", method=RequestMethod.POST)
	public String sacuvajAutomobil(@ModelAttribute("automobil") Automobil a,org.springframework.ui.Model m) {
		Automobil novi = autoRepo.save(a);	
		m.addAttribute("novAuto", a);
		return "unos/UnosOglasa";
	}
	
	@RequestMapping(value="/sacuvajOglas", method=RequestMethod.POST)
	public String sacOglas(@ModelAttribute("oglas") Oglas o, HttpServletRequest request,org.springframework.ui.Model m) {
		Date danas = new Date();
		o.setDatumObjave(danas);// uradi init binder ako se setis!!!!
		Principal principal = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(principal.getName());
		o.setClan(c);
		Oglas novi = oglasRepo.save(o);	
		m.addAttribute("novOglas", novi);
		return "unos/UnosOglasa";
	}
	
	@RequestMapping(value = "/detaljiOglas", method = RequestMethod.GET)
	public String prikazDetaljaOOglasu(Integer idOglas, org.springframework.ui.Model m) {
		Oglas o = oglasRepo.findById(idOglas).get();
		o.setBrPregleda(o.getBrPregleda()+1);
		oglasRepo.save(o);
		m.addAttribute("prikaziOglas", o);	
		return "prikaz/PrikazDetaljaOglas";
	}
	
	@RequestMapping(value = "/posaljiPoruku", method = RequestMethod.POST)
	public String posaljiPoruku(Integer idKorisnik, Integer idOglas, String sadrzaj, HttpServletRequest request,org.springframework.ui.Model m) {
		Poruka p = new Poruka();
		Clan primalac = clanRepo.findById(idKorisnik).get();
        Principal principal = request.getUserPrincipal();
		Clan posiljaoc = clanRepo.findByKorisnickoIme(principal.getName());
		
		p.setClan1(primalac);
		p.setClan2(posiljaoc);
		p.setSadrzaj(sadrzaj);
		porukaRepo.save(p);
		
		String potvrda = "Uspesno poslata!";
		m.addAttribute("potvrda", potvrda);
		Oglas o = oglasRepo.findById(idOglas).get();
		m.addAttribute("prikaziOglas", o);
		return "prikaz/PrikazDetaljaOglas";
	}
	
	@RequestMapping(value="/sacuvajOmiljeni", method = RequestMethod.POST)
	public String sacuvajOglasUOmiljene(Integer idOglas, String napomena, HttpServletRequest request,org.springframework.ui.Model m) {
        Principal principal = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(principal.getName());
		
		Sacuvani s = new Sacuvani();
		s.setClan(c);
		s.setNapomena(napomena);
		Oglas o = oglasRepo.findById(idOglas).get();
		s.setOgla(o);
		sacuvaniRepo.save(s);
		String potvrda = "Uspesno sacuvan!";
		
		m.addAttribute("prikaziOglas", o);
		m.addAttribute("potvrdaCuvanje", potvrda);
		return "prikaz/PrikazDetaljaOglas";
	}
	
	@RequestMapping(value = "/sortiranje", method = RequestMethod.POST)
	public String univerzalniSort(org.springframework.ui.Model m, String tipSort) {
		List<Oglas> sortirani;
		if(tipSort.equals("cenaRastuce")) {
			sortirani = oglasRepo.findByOrderByCenaAsc();
		} else if(tipSort.equals("cenaOpadajuce")) {
			sortirani = oglasRepo.findByOrderByCenaDesc();
		} else if(tipSort.equals("najnoviji")){
			sortirani = oglasRepo.findByOrderByDatumObjaveDesc();
		} else if(tipSort.equals("najstariji")) {
			sortirani = oglasRepo.findByOrderByDatumObjaveAsc();
		} else {
			sortirani = oglasRepo.findAll();
		}
		m.addAttribute("oglasi", sortirani);
		
		return "prikaz/PregledOglasa";
	}
	
	@RequestMapping(value = "/prikazSacuvani", method = RequestMethod.GET)
	public String prikaziSacuvane(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(p.getName());
		List<Sacuvani> sacuvani = sacuvaniRepo.findByClan(c);	
		m.addAttribute("sacuvani", sacuvani);
		return "prikaz/PrikazSacuvani";
	}

	@RequestMapping(value = "/prikazPoruke", method = RequestMethod.GET)
	public String prikazPoruka(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(p.getName());
		List<Poruka> poruke = porukaRepo.findByClan1(c);
		poruke.sort((o1, o2) -> o2.getIdPoruka() - o1.getIdPoruka());	// poruke sa vecim ID su kasnije dodate
																		// pa prikazujemo prvo novije
																		// posto u poruci nemamo promenljivu za vreme slanja
		List<Poruka> porukePoslate = porukaRepo.findByClan2(c);
		porukePoslate.sort((o1, o2) -> o2.getIdPoruka() - o1.getIdPoruka());
		m.addAttribute("poruke", poruke);
		m.addAttribute("porukePoslate", porukePoslate);		
		return "prikaz/PrikazPoruka";
	}
	
	@RequestMapping(value = "/odgovori", method = RequestMethod.POST)
	public String odgovoriNaPoruku(Integer idClan, String sadrzaj, HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan posiljaoc = clanRepo.findByKorisnickoIme(p.getName());
		Clan primaoc = clanRepo.findById(idClan).get();
		
		Poruka poruka = new Poruka();
		poruka.setClan1(primaoc);
		poruka.setClan2(posiljaoc);
		poruka.setSadrzaj(sadrzaj);
		porukaRepo.save(poruka);
		String potvrda = "Poruka uspesno poslata!";

		m.addAttribute("potvrda", potvrda);
		return "prikaz/PrikazPoruka";
	}
	
	@RequestMapping(value = "/mojiOglasi", method = RequestMethod.GET)
	public String mojiOglasi(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(p.getName());
		List<Oglas> mojiOglasi = oglasRepo.findByClan(c);
		m.addAttribute("mojiOglasi", mojiOglasi);
		return "prikaz/MojiOglasi";
	}
	
	@RequestMapping(value = "/obrisiOglas", method = RequestMethod.GET)
	public String obrisiOglas(Integer idOglas, org.springframework.ui.Model m) {
		Oglas o = oglasRepo.findById(idOglas).get();
		Automobil a = o.getAutomobil();
		oglasRepo.deleteById(o.getIdOglas());
		autoRepo.deleteById(a.getIdAutomobil());
		m.addAttribute("obrisan", "Uspesno obrisan");
		return "prikaz/MojiOglasi";
	}
	
	
	@RequestMapping(value="generisiIzvestajOglasi", method=RequestMethod.GET) 
	public void izvestajOglasi(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		Principal p = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(p.getName());
		List<Oglas> oglasi = oglasRepo.findByClan(c);
		
		response.setContentType("text/html");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(oglasi);
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/IzvestajOglasa.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ime", c.getIme());
		params.put("prezime", c.getPrezime());
		params.put("idKorisnik", c.getIdClan());		
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();
		
		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=MojiOglasi.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
	
	@RequestMapping(value="generisiIzvestajSacuvani", method=RequestMethod.GET) 
	public void izvestajSacuvani(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		Principal p = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(p.getName());
		List<Sacuvani> oglasi = sacuvaniRepo.findByClan(c);
		
		response.setContentType("text/html");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(oglasi);
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/IzvestajSacuvani.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ime", c.getIme());
		params.put("prezime", c.getPrezime());
		params.put("idKorisnik", c.getIdClan());		
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();
		
		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=SacuvaniOglasi.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
	
	@RequestMapping(value="generisiIzvestajPocetnik", method=RequestMethod.GET) 
	public void izvestajPocetnik(Integer cena, Integer idProizvodjac, Integer godiste, HttpServletRequest request, HttpServletResponse response) throws Exception { 
		Principal p = request.getUserPrincipal();
		Clan c = clanRepo.findByKorisnickoIme(p.getName());
		List<Oglas> oglasiPocetnik = oglasRepo.oglasiZaPocetnika(idProizvodjac, cena, godiste);
		
		for (Oglas o : oglasiPocetnik) {
			System.out.println(o.getIdOglas());
			System.out.println(o.getCena());
		}
		
		response.setContentType("text/html");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(oglasiPocetnik);
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/IzvestajPocetnik.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ime", c.getIme());
		params.put("prezime", c.getPrezime());
		params.put("idKorisnik", c.getIdClan());		
		
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();
		
		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=IzvestajZaPocetnika.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
}
