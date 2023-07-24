package com.ensah.core.bo;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
public class Person {



	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idPersonne;



	@NotBlank(message = "This field is required")
	private String firstName;

	@NotBlank(message = "This field is required")
	private String lastName;
	
	@Pattern(regexp = "\\+?[0-9]+", message = "Enter a valid phone number")
	private String personalnumphone;
	
	@Pattern(regexp = "\\+?[0-9]+", message = "Enter a valid phone number")
	private String professionalnumphone;

	@NotBlank(message = "This field is required")
	private String address;
	
	@Email(message = "Enter a valid email")
	@NotBlank(message = "This field is required")
	private String personalemail;


	@Email(message = "Enter a valid email")
	private String professionalemail;
	

	@NotBlank(message = "This field is required")
	
	private String gender;
	
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "groupe_contact", joinColumns = @JoinColumn(name = "id_contact"), inverseJoinColumns = @JoinColumn(name = "id_groupe"))
    private Set<Groupe> groupe = new HashSet<Groupe>();
	
	


	
	public Set<Groupe> getGroupe() {
		return groupe;
	}






	public void setGroupe(Set<Groupe> groupe) {
		this.groupe = groupe;
	}






	public Person() {
		
	}

	




	public Long getIdPersonne() {
		return idPersonne;
	}




	public void setIdPersonne(Long idPersonne) {
		this.idPersonne = idPersonne;
	}




	public String getFirstName() {
		return firstName;
	}




	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}




	public String getLastName() {
		return lastName;
	}




	public void setLastName(String lastName) {
		this.lastName = lastName;
	}




	public String getPersonalnumphone() {
		return personalnumphone;
	}




	public void setPersonalnumphone(String personalnumphone) {
		this.personalnumphone = personalnumphone;
	}




	public String getProfessionalnumphone() {
		return professionalnumphone;
	}




	public void setProfessionalnumphone(String professionalnumphone) {
		this.professionalnumphone = professionalnumphone;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getPersonalemail() {
		return personalemail;
	}




	public void setPersonalemail(String personalemail) {
		this.personalemail = personalemail;
	}




	public String getProfessionalemail() {
		return professionalemail;
	}




	public void setProfessionalemail(String professionalemail) {
		this.professionalemail = professionalemail;
	}




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	@Override
	public String toString() {
		return "Person [idPersonne=" + idPersonne + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", personalnumphone=" + personalnumphone + ", professionalnumphone=" + professionalnumphone
				+ ", address=" + address + ", personalemail=" + personalemail + ", professionalemail="
				+ professionalemail + ", gender=" + gender + "]";
	}



	
	
	
}
