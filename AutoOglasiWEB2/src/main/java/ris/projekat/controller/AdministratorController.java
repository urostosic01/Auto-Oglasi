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
	AutomobilRepository ar;

	@Autowired
	ProizvodjacRepository pr;

	@Autowired
	ModelRepository mr;

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
	
	
	@RequestMapping(value = "/pocetna", method = RequestMethod.GET)
	public String pocetna() {
		return "/index";
	}
	

	@RequestMapping(value = "/unosModela", method = RequestMethod.GET)
	public String unosModela() {
		return "unos/UnosModela";
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
		Proizvodjac p = pr.findById(idProizvodjac).get();
		List<Model> modeli = mr.findByProizvodjac(p);
		
		m.addAttribute("odabraniProizvodjac", p);
		m.addAttribute("modeliPoProizvodjacu", modeli);
		
		return "unos/UnosAutomobila";
	}
	
	// CUVANJA
	
	@RequestMapping(value = "/unosProizvodjaca", method = RequestMethod.GET)
	public String unosProizvodjaca() {
		return "unos/UnosProizvodjaca";
	}

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
	
	
//	@RequestMapping(value="generisiIzvestajPoProizvodjacu", method=RequestMethod.GET) 
//	public void izvestajProizvodjac(HttpServletRequest request, HttpServletResponse response) throws Exception { 
//		Principal p = request.getUserPrincipal();
//		Clan c = cr.findByKorisnickoIme(p.getName());
//		List<Automobil> automobili;
//		
//		
//		response.setContentType("text/html");
//		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(automobili);
//		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/IzvestajSacuvani.jrxml");
//		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
//		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("ime", c.getIme());
//		params.put("prezime", c.getPrezime());
//		params.put("idKorisnik", c.getIdClan());		
//		
//		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
//		inputStream.close();
//		
//		
//		response.setContentType("application/x-download");
//		response.addHeader("Content-disposition", "attachment; filename=SacuvaniOglasi.pdf");
//		OutputStream out = response.getOutputStream();
//		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
//	}
//	

}
