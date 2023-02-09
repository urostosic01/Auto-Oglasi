package ris.projekat.security;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;


import model.Uloga;
import ris.projekat.repository.UlogaRepository;

public class UlogaKonverter implements Converter<String, Uloga> {
	private UlogaRepository ur;

	public UlogaKonverter(UlogaRepository ur) {
		this.ur = ur;
	}

	@Override
	public Uloga convert(String source) {
		int idUloga = -1;
		try {
			idUloga = Integer.parseInt(source);
		} catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class),
					TypeDescriptor.valueOf(Uloga.class), idUloga, null);
		}
		Uloga u = ur.findById(idUloga).get();
		return u;
	}
}
