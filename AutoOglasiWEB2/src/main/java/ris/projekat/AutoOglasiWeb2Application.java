package ris.projekat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("model")
public class AutoOglasiWeb2Application {

	public static void main(String[] args) {
		SpringApplication.run(AutoOglasiWeb2Application.class, args);
	}

}
