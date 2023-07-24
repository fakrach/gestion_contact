package com.ensah.core.web;

import javax.validation.Valid;

import java.util.*;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ensah.core.bo.*;

import com.ensah.core.services.GroupeService;
import com.ensah.core.services.IPersonService;

@Controller
public class GroupeController {
	
	
	
	@Autowired
	private GroupeService groupeservice;
	
	@Autowired
	private IPersonService personService; // Injection du service metier ici
	

	@GetMapping("/process")
	public String showForm(Model model) {

		model.addAttribute("groupeModel", new Groupe()); // Ajouter un objet Personne vide comme attribut du modèle
		model.addAttribute("personList", personService.getAllPersons());// Ajouter la liste des personnes comme attribut
																		// du modèle

		return "groupeform"; // On retourne le nom de la vue
	}
	
	
	@PostMapping("/addGroupe")
	public String process(@Valid @ModelAttribute("groupeModel") Groupe groupe, BindingResult bindingResult,
			ModelMap model) {
		

		if (bindingResult.hasErrors()) {
			model.addAttribute("errorMsg", "Les données sont invalides.");
		} else {
			groupeservice.addGroupe(groupe);
			model.addAttribute("infoMsg", "Groupe ajouté ajouté avec succès");

		}
		model.addAttribute("GroupeList", groupeservice.getAllGroupe());
		return "retoure";

	}
	
	@GetMapping("/manageGroupes")
	public String managePersons(Model model) {
		model.addAttribute("Groupelist", groupeservice.getAllGroupe());
		return "listgroupes";		
	}
	
	
	
	
	@RequestMapping(value = "deleteGroupe/{idGroupe}", method = RequestMethod.GET)
	public String delete(@PathVariable int idGroupe) {
		Groupe groupe = groupeservice.getGroupeById(Long.valueOf(idGroupe));
		Set<Person> listc =groupe.getContact();
		
		for(Person p : listc) {p.getGroupe().remove(groupe);}
		
		
		groupeservice.deleteGroupe(Long.valueOf(idGroupe));
		
		
		
		
		return "redirect:/manageGroupes";
	}
	
	
	@RequestMapping(value = "/updateGroupeForm/{idGroupe}", method = RequestMethod.GET)
	public String updateGroupeForm(@PathVariable(name = "idGroupe") long idGroupe, Model model) {
		
   
		model.addAttribute("PersonList", personService.getAllPersons());
		
		model.addAttribute("thisgroupe",groupeservice.getGroupeById(idGroupe));
		//System.out.println(groupeService.getGroupeById(id).getName());
		return "allpg";
	}




	@PostMapping("/updateGroupe")
	public String saveGroup( @RequestParam("groupid") long id, @RequestParam("contactIds") List<Long> contactIds
			,Model model) {


		
		Groupe groupe = groupeservice.getGroupeById(id);
		Set<Person> contacts = new HashSet<>();
		if(contactIds != null && !contactIds.isEmpty()){

			for (int i=0 ; i< contactIds.size();i++){
				long a = contactIds.get(i);
				Person c = personService.getPersonById(a) ;
				c.getGroupe().add(groupe) ;
				contacts.add(personService.getPersonById(a));
			}
			groupe.setContact(contacts);
		}
		groupeservice.updateGroupe(groupe);
		model.addAttribute("infoMsg","les contact sont ajouter avec succee");

		return "retoure"; // Rediriger vers une page appropriée après l'enregistrement du groupe
	}
	
	@PostMapping(value = "/searchGroupe")
	public String searchContact(@RequestParam String nom, Model model) {


		List<Groupe> grp = groupeservice.getGroupeByName(nom);
		// Initialiser le modele
		model.addAttribute("Groupelist", grp);

		return "listgroupes";
	}

	
	
	}


