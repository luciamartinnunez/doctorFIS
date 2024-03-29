package proyecto.modelo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class ConfiguracionDificultad {
	private int dificultad;
	@Id
	private int id;
	private final int ID_UNIQUE = 1;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ConfiguracionDificultad(int dificultad) {
		super();
		this.id = ID_UNIQUE;
		this.dificultad = dificultad;
	}

	public int getDificultad() {
		return dificultad;
	}

	public void setDificultad(int dificultad) {
		this.dificultad = dificultad;
	}

	public ConfiguracionDificultad() {
		super();
	}

	@Override
	public String toString() {
		return "ConfiguracionDificultad [dificultad=" + dificultad + ", id=" + id + "]";
	}

}
