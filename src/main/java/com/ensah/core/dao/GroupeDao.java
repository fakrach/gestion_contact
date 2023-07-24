package com.ensah.core.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import com.ensah.core.bo.Groupe;

public interface GroupeDao extends JpaRepository<Groupe, Long>{
	
	
	List<Groupe> findByGroupeName(String groupeName);

	

}
