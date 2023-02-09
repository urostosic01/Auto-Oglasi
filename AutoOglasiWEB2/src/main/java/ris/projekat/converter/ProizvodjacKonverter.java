package ris.projekat.converter;


import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import model.Proizvodjac;
import ris.projekat.repository.ProizvodjacRepository;

public class ProizvodjacKonverter implements Converter<String, Proizvodjac>{

	ProizvodjacRepository pr;
	
	public ProizvodjacKonverter(ProizvodjacRepository pr) {
		this.pr = pr;
	}
	
	@Override
	public Proizvodjac convert(String source) {
		int idProizvodjac = -1;
		try {
			idProizvodjac = Integer.parseInt(source);
			
		} catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), TypeDescriptor.valueOf(Proizvodjac.class),
												idProizvodjac, null);
		}
		
		Proizvodjac p = pr.findById(idProizvodjac).get();
		return p;
	}

}
