package ris.projekat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Clan;
import model.Uloga;
import ris.projekat.repository.ClanRepository;
import ris.projekat.repository.UlogaRepository;

@Controller
@ControllerAdvice
@RequestMapping(value = "auth")
public class LoginController {

	@Autowired
	UlogaRepository ur;

	@Autowired
	ClanRepository kir;

	@ModelAttribute
	public void getRoles(Model model) {
		List<Uloga> roles = ur.findAll();
		model.addAttribute("roles", roles);
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value = "/access_denied", method = RequestMethod.GET)
	public String deniedPage() {
		return "access_denied";
	}

	@RequestMapping(value = "registerUser", method = RequestMethod.GET)
	public String newUser(Model model) {
		Clan u = new Clan();
		model.addAttribute("user", u);
		return "register";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") Clan k) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		k.setSifra(passwordEncoder.encode(k.getSifra()));
		for (Uloga r : k.getUlogas()) {
			r.addClan(k);
		}
		kir.save(k);
		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/auth/loginPage";
	}

	@RequestMapping(value = "/pocetna", method = RequestMethod.GET)
	public String getPocetna() {
		return "pocetna";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getIndex() {
		return "index";
	}

}
