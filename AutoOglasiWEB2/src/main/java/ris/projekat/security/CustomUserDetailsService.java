package ris.projekat.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


import model.Clan;
import ris.projekat.repository.ClanRepository;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{

    @Autowired
    private ClanRepository kir;
    
    @Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Clan user = kir.findByKorisnickoIme(username);
		UserDetailsImpl userDetails = new UserDetailsImpl();
		userDetails.setUsername(user.getKorisnickoIme());
		userDetails.setPassword(user.getSifra());
		userDetails.setRoles(user.getUlogas());
		return userDetails;
		
    }
 
     
 


	
     
}
