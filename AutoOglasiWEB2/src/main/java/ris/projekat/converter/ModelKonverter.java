package ris.projekat.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import model.Automobil;
import model.Model;
import ris.projekat.repository.AutomobilRepository;
import ris.projekat.repository.ModelRepository;

public class ModelKonverter implements Converter<String, Model> {
	ModelRepository mr;

	public ModelKonverter(ModelRepository mr) {
		this.mr = mr;
	}

	@Override
	public Model convert(String source) {
		int idModel = -1;
		try {
			idModel = Integer.parseInt(source);

		} catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class),
					TypeDescriptor.valueOf(Model.class), idModel, null);
		}

		Model m = mr.findById(idModel).get();
		return m;
	}
}
