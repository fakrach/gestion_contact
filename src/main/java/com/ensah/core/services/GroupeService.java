package com.ensah.core.services;

import java.util.ArrayList;
import java.util.List;
import com.ensah.core.dao.*;
import com.ensah.core.bo.*;
import javax.transaction.*;
import org.springframework.stereotype.Service;
@Service
@Transactional
public class GroupeService implements IGroupeService {
	
	 private GroupeDao groupeRepository;
	
	 public GroupeService(GroupeDao grpDao) {
		 groupeRepository = grpDao;
		 
	 }

    @Override
    public void addGroupe(Groupe groupe) {
        groupeRepository.save(groupe);
    }
    
    @Override
    public void updateGroupe(Groupe pgroupe) {
        groupeRepository.save(pgroupe);
    }
    

    
    @Override
    public void deleteGroupe(Long id) {
        groupeRepository.deleteById(id);
    }
    
    @Override
	public List<Groupe> getAllGroupe() {
    	
		return groupeRepository.findAll();
	}
    
    
    public List<Groupe> getGroupeByName(String nom){
		List<Groupe> l = groupeRepository.findByGroupeName(nom);

		return l != null && !l.isEmpty() ? l : null;

	}
    
    public Groupe getGroupeById(Long id) {
		return groupeRepository.findById(id).get() ;  

	}
    
	
	


}
