package com.ensah.core.bo;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotBlank;

import java.util.Set;
import java.util.List;

import java.util.HashSet;
@Entity
public class Groupe {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idGroupe;
	
	
	@NotBlank(message = "This field is required")
	private String groupeName;
	@ManyToMany(mappedBy = "groupe")
    private Set<Person> contact = new HashSet<Person>();


	public Set<Person> getContact() {
		return contact;
	}

	public void setContact(Set<Person> contact) {
		this.contact = contact;
	}

	public long getIdGroupe() {
		return idGroupe;
	}

	public void setIdGroupe(long idGroupe) {
		idGroupe = idGroupe;
	}

	public String getGroupeName() {
		return groupeName;
	}

	public void setGroupeName(String groupeName) {
		this.groupeName = groupeName;
	}

	

	
	
	
	
	
	
	
	
	
	
	

}
