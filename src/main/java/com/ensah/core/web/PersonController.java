package com.ensah.core.web;



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
//import org.springframework.web.servlet.view.RedirectView;

import com.ensah.core.bo.Person;
import com.ensah.core.services.IPersonService;

import java.util.List;

import javax.validation.Valid;

@Controller
public class PersonController {
	
	
	

	@Autowired
	private IPersonService personService; 
	

	@GetMapping({"/","/showForm"})
	public String showForm(Model model) {

		model.addAttribute("personModel", new Person()); // Ajouter un objet Personne vide comme attribut du modèle
		model.addAttribute("personList", personService.getAllPersons());// Ajouter la liste des personnes comme attribut
																		// du modèle

		return "form"; // On retourne le nom de la vue
	}
	
	
	@RequestMapping("/updatePerson")
  public String updatePerson(@Valid @ModelAttribute("personModel") Person person,
                             BindingResult bindingResult,
                             Model model) {
      if (bindingResult.hasErrors()) {
          return "updateForm";
          
      }
	
        personService.updatePerson(person);
        model.addAttribute("personList", personService.getAllPersons());
        return "redirect:/managePersons";
    }
	
	@RequestMapping(value = "/updatePerson/{idPerson}", method = RequestMethod.GET)
	public String updatePerson(@PathVariable(name = "idPerson") int idPerson, Model model) {
		model.addAttribute("personModel", personService.getPersonById(Long.valueOf(idPerson)));
		return "updateForm";
	}
	
	
	
	@RequestMapping(value = "/deletePerson/{idPerson}", method = RequestMethod.GET)
	public String delete(@PathVariable int idPerson) {
		personService.deletePerson(Long.valueOf(idPerson));		
		// HttpServletResponse.sendRedirect() – which will perform the actual redirect.
		return "redirect:/managePersons";
	}
	
	@GetMapping("/managePersons")
	public String managePersons(Model model) {
		model.addAttribute("personList", personService.getAllPersons());
		return "listPersons";		
	}


	@PostMapping("/addPerson")
	public String process(@Valid @ModelAttribute("personModel") Person person, BindingResult bindingResult,
			ModelMap model) {
		

		if (bindingResult.hasErrors()) {
			model.addAttribute("errorMsg", "Les données sont invalides.");
		} else {
			personService.addPerson(person);
			model.addAttribute("infoMsg", "Personne ajouté avec succès");

		}
		model.addAttribute("personList", personService.getAllPersons());
		return "form";

	}
	
//	@PostMapping("/searchPerson1")
//    public String searchPersonByName(@RequestParam("searchTerm") String searchTerm, Model model) {
//		model.addAttribute("personList", personService.searchByLastName(searchTerm));
//		return "listPersons";	
//    }
	
    @PostMapping("/searchPerson")
    public String searchPersonByTerm(@RequestParam("searchCriteria") String searchCriteria,
                               @RequestParam("searchTerm") String searchTerm,
                               Model model) {
        List<Person> searchResults = personService.searchPerson(searchCriteria, searchTerm);
        model.addAttribute("searchResults", searchResults);
        return "search";
    }

	

}
