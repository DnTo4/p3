package es.uco.practica3.business.gestores;

import java.util.List;
import es.uco.practica3.data.dao.*;
import es.uco.practica3.business.DTO.PistaDTO;
import es.uco.practica3.business.DTO.MaterialDTO;

public class GestorPistas {


    private PistaDAO pistaDAO = new PistaDAO();
    private MaterialDAO matDAO = new MaterialDAO();
    
    public GestorPistas() {
        
    }
    
	public int crearPista(String nombre, int estado, int tipo, int tamanio, int jugadores)
	{
		PistaDTO pista = new PistaDTO(nombre, estado, tipo, tamanio, jugadores);
		
		return pistaDAO.crearPista(pista);
	}
	
	public List<PistaDTO> listarPistas()
	{
		return pistaDAO.ListarPistas();
	}
	
	public int borrarPista(String nombre)
	{
		PistaDTO pista = new PistaDTO(nombre, -1, -1, -1, -1);
				
		return pistaDAO.borrarPista(pista);
	}
	
	public int crearMat(int mat, int uso, int estado)
	{		
			if(mat < 1 || mat > 3) {return -1;}
		if(uso != 1 && uso != 2){return -1;}
		if(estado != 1 && estado != 2 && estado != 3){return -1;}
		
		MaterialDTO material = new MaterialDTO(mat, uso, estado, -1);
		
		return  matDAO.crearMaterial(material);
	}
	
	public int asociar(String nombre, int tipo, int uso)
	{		
		MaterialDTO mat = new MaterialDTO(tipo, uso, 2, -1);
		PistaDTO pista = new PistaDTO(nombre, -1, -1, -1, -1);
		
		return matDAO.asociarMaterialPista(pista, mat);
	}
	
	public int borrarMat(int tipo)
	{
		MaterialDTO mat = new MaterialDTO(tipo, -1, -1, -1);
		
		return  matDAO.borrarMaterial(mat);
	}
	
	public List<MaterialDTO> listarMat()
	{
		return matDAO.listarMateriales();
	}

	public List<PistaDTO> buscarPistasDisponibles(int tipo, java.sql.Date fecha) 
	{
		return pistaDAO.buscarPistasDisponibles(tipo, fecha);
	}
	
	public int modificarEstadoPista(String nombre, int estado)
	{
		return pistaDAO.modificarEstadoPista(nombre, estado);
	}
	
	public int modificarEstadoMat(int tipo, int estado)
	{
		return matDAO.modificarEstadoMat(tipo, estado);
	}
}
