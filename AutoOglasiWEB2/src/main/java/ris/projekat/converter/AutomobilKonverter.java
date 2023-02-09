package ris.projekat.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import model.Automobil;
import model.Proizvodjac;
import ris.projekat.repository.AutomobilRepository;
import ris.projekat.repository.ProizvodjacRepository;

public class AutomobilKonverter implements Converter<String, Automobil> {

	AutomobilRepository ar;
	
	public AutomobilKonverter(AutomobilRepository ar) {
		this.ar = ar;
	}
	
	@Override
	public Automobil convert(String source) {
		int idAuto = -1;
		try {
			idAuto = Integer.parseInt(source);
			
		} catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), TypeDescriptor.valueOf(Automobil.class),
												idAuto, null);
		}
		
		Automobil a = ar.findById(idAuto).get();
		return a;
	}

}
