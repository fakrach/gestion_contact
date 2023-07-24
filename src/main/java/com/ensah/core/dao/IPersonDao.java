package com.ensah.core.dao;

//import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

import com.ensah.core.bo.Person;



public interface IPersonDao extends JpaRepository<Person, Long> {

	

	public Person findByLastName(String lastName);

	public Person findByPersonalnumphone(String personalnumphone);
	
	public Person findByProfessionalnumphone(String professionalnumphone);
	

}

