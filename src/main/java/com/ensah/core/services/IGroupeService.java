package com.ensah.core.services;
import java.util.List;

import com.ensah.core.bo.Groupe;
import com.ensah.core.bo.Person;

public interface IGroupeService {
	
	public void addGroupe(Groupe groupe);
    public List<Groupe> getAllGroupe();
    public void updateGroupe(Groupe pGroupe);
    public void deleteGroupe(Long id);
	public List<Groupe> getGroupeByName(String nom);
	
	


}
