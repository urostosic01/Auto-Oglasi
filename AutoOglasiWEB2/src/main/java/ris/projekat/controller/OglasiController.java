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
	AutomobilRepository ar;

	@Autowired
	ProizvodjacRepository pr;

	@Autowired
	ModelRepository mr;

	//@Autowired
	//UlogaRepository ur;
//
//	@Autowired
//	KorisnikRepository kr;

	@Autowired
	ClanRepository cr;
	
	@Autowired
	OglasRepository or;
	
	@Autowired 
	PorukaRepository porr;
	
	@Autowired
	SacuvaniRepository sr;

	// GET SA MODEL ATTRIBUTE

	@ModelAttribute("automobili")
	public List<Automobil> getAutomobili() {
		return ar.findAll();
	}

	@ModelAttribute("proizvodjaci")
	public List<Proizvodjac> getProizvodjaci() {
		return pr.findAll();
	}
	
	@ModelAttribute("modeli")
	public List<Model> getModeli(){
		return mr.findAll();
	}
	
	@ModelAttribute("poruke")
	public List<Poruka> getPoruke(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = cr.findByKorisnickoIme(p.getName());
		List<Poruka> poruke = porr.findByClan1(c);
		return poruke;
	}
	
//	@ModelAttribute("modPoProizv")
//	public List<Model> getModelPoProizv(Integer idProizvodjac){
//		Proizvodjac p = pr.findById(idProizvodjac).get();
//		return mr.findByProizvodjac(p);
//	}
	

	@ModelAttribute("oglasi")
	public List<Oglas> getOglasi() {
		return or.findAll();
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
		Proizvodjac p = pr.findById(idProizvodjac).get();
		List<Model> modeli = mr.findByProizvodjac(p);
		
		m.addAttribute("odabraniProizvodjac", p);
		m.addAttribute("modeliPoProizvodjacu", modeli);
		
		return "unos/UnosAutomobila";
	}
	@RequestMapping(value="/nadjiModelePretraga", method=RequestMethod.GET)
	public String nadjiModelePretraga(Integer idProizvodjac, org.springframework.ui.Model m) {
		Proizvodjac p = pr.findById(idProizvodjac).get();
		List<Model> modeli = mr.findByProizvodjac(p);
		List<Oglas> oglasi = or.oglasiPoProizvodjacu(p.getIdProizvodjac());
		
		
		m.addAttribute("odabraniProizvodjac", p);
		m.addAttribute("modeliPoProizvodjacu", modeli);
		m.addAttribute("oglasi", oglasi);
		return "prikaz/PregledOglasa";
	}
	
	@RequestMapping(value = "/nadjiOglaseModela", method = RequestMethod.GET)
	public String nadjiOglaseModela(Integer idProizvodjac, Integer idModel, org.springframework.ui.Model m) {
		List<Oglas> oglasi = or.oglasiPoModelu(idModel, idProizvodjac);
		m.addAttribute("oglasi", oglasi);
		return "prikaz/PregledOglasa";
	}
	
	// CUVANJA

	@RequestMapping(value = "/sacuvajProizvodjaca", method = RequestMethod.POST)
	public String saveProizvodjac(Proizvodjac p, HttpServletRequest request) {
		pr.save(p);
		request.getSession().setAttribute("proizvodjac", p);
		return "unos/UnosProizvodjaca";
	}

	@RequestMapping(value = "/sacuvajModel", method = RequestMethod.POST)
	public String sacuvajModel(@ModelAttribute("model") Model model, org.springframework.ui.Model m) {
		Model mod = mr.save(model);
		m.addAttribute("modelNov", mod);
		return "unos/UnosModela";
	}
	
	
	@RequestMapping(value="/sacAutomobil", method=RequestMethod.POST)
	public String sacuvajAutomobil(@ModelAttribute("automobil") Automobil a,org.springframework.ui.Model m) {
		Automobil novi = ar.save(a);
		
		m.addAttribute("novAuto", a);
		
		return "unos/UnosOglasa";
	}
	
	
	@RequestMapping(value="/sacuvajOglas", method=RequestMethod.POST)
	public String sacOglas(@ModelAttribute("oglas") Oglas o, HttpServletRequest request,org.springframework.ui.Model m) {
		Date danas = new Date();
		o.setDatumObjave(danas);// uradi init binder ako se setis!!!!
		Principal principal = request.getUserPrincipal();
		Clan c = cr.findByKorisnickoIme(principal.getName());
		o.setClan(c);
		Oglas novi = or.save(o);
		
		m.addAttribute("novOglas", novi);
//		Automobil a = ar.findById(novi.getAutomobil().getIdAutomobil()).get();
//		a.setOgla(novi);
		return "unos/UnosOglasa";
	}
	
	

	@RequestMapping(value = "/detaljiOglas", method = RequestMethod.GET)
	public String prikazDetaljaOOglasu(Integer idOglas, org.springframework.ui.Model m) {
		Oglas o = or.findById(idOglas).get();
		o.setBrPregleda(o.getBrPregleda()+1);
		or.save(o);
		m.addAttribute("prikaziOglas", o);
		
		return "prikaz/PrikazDetaljaOglas";
	}
	
	@RequestMapping(value = "/posaljiPoruku", method = RequestMethod.POST)
	public String posaljiPoruku(Integer idKorisnik, Integer idOglas, String sadrzaj, HttpServletRequest request,org.springframework.ui.Model m) {
		Poruka p = new Poruka();
		Clan primalac = cr.findById(idKorisnik).get();
        Principal principal = request.getUserPrincipal();
		
		Clan posiljaoc = cr.findByKorisnickoIme(principal.getName());
		p.setClan1(primalac);
		p.setClan2(posiljaoc);
		p.setSadrzaj(sadrzaj);
		
		
		
		porr.save(p);
		String potvrda = "Uspesno poslata!";
		
		m.addAttribute("potvrda", potvrda);
		Oglas o = or.findById(idOglas).get();
		m.addAttribute("prikaziOglas", o);

		return "prikaz/PrikazDetaljaOglas";
	}
	
	@RequestMapping(value="/sacuvajOmiljeni", method = RequestMethod.POST)
	public String sacuvajOglasUOmiljene(Integer idOglas, String napomena, HttpServletRequest request,org.springframework.ui.Model m) {
        Principal principal = request.getUserPrincipal();
		Clan c = cr.findByKorisnickoIme(principal.getName());
		
		Sacuvani s = new Sacuvani();
		s.setClan(c);
		s.setNapomena(napomena);
		Oglas o = or.findById(idOglas).get();
		s.setOgla(o);
		
		sr.save(s);
		String potvrda = "Uspesno sacuvan!";
		
		m.addAttribute("prikaziOglas", o);
		m.addAttribute("potvrdaCuvanje", potvrda);
		
		return "prikaz/PrikazDetaljaOglas";
	}
	
	@RequestMapping(value="/sortCenaRastuce", method=RequestMethod.GET)
	public String sortCenaRastuce(org.springframework.ui.Model m) {
		List<Oglas> sortiraniCena = or.sortCenaRastuce();
		m.addAttribute("oglasi", sortiraniCena);
		return "prikaz/PregledOglasa";
	}
	
	@RequestMapping(value="/sortDatumNajnoviji", method=RequestMethod.GET)
	public String sortDatumNajnoviji(org.springframework.ui.Model m) {
		List<Oglas> sortiraniDatum = or.sortDatumNajnoviji();
		m.addAttribute("oglasi", sortiraniDatum);
		return "prikaz/PregledOglasa";
	}
	
	@RequestMapping(value="/sortCenaOpadajuce", method=RequestMethod.GET)
	public String sortCenaOpadajuce(org.springframework.ui.Model m) {
		List<Oglas> sortiraniCena = or.sortCenaOpadajuce();
		m.addAttribute("oglasi", sortiraniCena);
		return "prikaz/PregledOglasa";
	}
	
	
	
	
	@RequestMapping(value = "/prikazSacuvani", method = RequestMethod.GET)
	public String prikaziSacuvane(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = cr.findByKorisnickoIme(p.getName());
		List<Sacuvani> sacuvani = sr.findByClan(c);
		
		m.addAttribute("sacuvani", sacuvani);
		
		return "prikaz/PrikazSacuvani";
	}
	
	@RequestMapping(value = "/prikazPoruke", method = RequestMethod.GET)
	public String prikazPoruka(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = cr.findByKorisnickoIme(p.getName());
		List<Poruka> poruke = porr.findByClan1(c);
		List<Poruka> porukePoslate = porr.findByClan2(c);
		m.addAttribute("poruke", poruke);
		m.addAttribute("porukePoslate", porukePoslate);
		
		return "prikaz/PrikazPoruka";
	}
	
	@RequestMapping(value = "/odgovori", method = RequestMethod.POST)
	public String odgovoriNaPoruku(Integer idClan, String sadrzaj, HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan posiljaoc = cr.findByKorisnickoIme(p.getName());
		Clan primaoc = cr.findById(idClan).get();
		
		Poruka poruka = new Poruka();
		poruka.setClan1(primaoc);
		poruka.setClan2(posiljaoc);
		poruka.setSadrzaj(sadrzaj);
		
		porr.save(poruka);
		String potvrda = "Poruka uspesno poslata!";
		m.addAttribute("potvrda", potvrda);
		
		return "prikaz/PrikazPoruka";
	}
	
	@RequestMapping(value = "/mojiOglasi", method = RequestMethod.GET)
	public String mojiOglasi(HttpServletRequest request, org.springframework.ui.Model m) {
		Principal p = request.getUserPrincipal();
		Clan c = cr.findByKorisnickoIme(p.getName());
		
		List<Oglas> mojiOglasi = or.findByClan(c);
		m.addAttribute("mojiOglasi", mojiOglasi);
		
		return "prikaz/MojiOglasi";
	}
	
	@RequestMapping(value = "/obrisiOglas", method = RequestMethod.GET)
	public String obrisiOglas(Integer idOglas, org.springframework.ui.Model m) {
		Oglas o = or.findById(idOglas).get();
		Automobil a = o.getAutomobil();
		
		or.deleteById(o.getIdOglas());
		ar.deleteById(a.getIdAutomobil());

		m.addAttribute("obrisan", "Uspesno obrisan");
		
		return "prikaz/MojiOglasi";
	}
	
	
	@RequestMapping(value="generisiIzvestajOglasi", method=RequestMethod.GET) 
	public void izvestajOglasi(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		Principal p = request.getUserPrincipal();
		Clan c = cr.findByKorisnickoIme(p.getName());
		List<Oglas> oglasi = or.findByClan(c);
		
		
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
		Clan c = cr.findByKorisnickoIme(p.getName());
		List<Sacuvani> oglasi = sr.findByClan(c);
		
		
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
		Clan c = cr.findByKorisnickoIme(p.getName());
		List<Oglas> oglasiPocetnik = or.oglasiZaPocetnika(idProizvodjac, cena, godiste);
		
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
