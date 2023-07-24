package com.ensah.core.services;

import java.util.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.text.similarity.LevenshteinDistance;

import com.ensah.core.bo.Person;
import com.ensah.core.dao.IPersonDao;

@Service
@Transactional
public class PersonServiceImpl implements IPersonService {

	@Autowired
	private IPersonDao personDao;

	public void addPerson(Person pPerson) {

		personDao.save(pPerson);
	}

	public List<Person> getAllPersons() {
		return personDao.findAll();
	}

	public void deletePerson(Long id) {
		personDao.delete(getPersonById(id));

	}

	public Person getPersonById(Long id) {
		return personDao.findById(id).get();

	}

	public void updatePerson(Person pPerson) {
		personDao.save(pPerson);

	}

	public Person searchByLastName(String lastName) {
		return personDao.findByLastName(lastName);
	}

	public List<Person> searchPerson(String searchCriteria, String searchTerm) {

		List<Person> allPersons = getAllPersons();
		List<Person> searchResults = new ArrayList<>();
		// Perform search by last name using String Edit Distance
		LevenshteinDistance levenshteinDistance = new LevenshteinDistance();
		int threshold = 2; // Maximum allowed edit distance
		for (Person person : allPersons) {
			if (searchCriteria.equals("lastName")) {
				String lastName = person.getLastName();
				int distance = levenshteinDistance.apply(lastName, searchTerm);
				if (distance <= threshold) {
					searchResults.add(person);
				}

			} else if (searchCriteria.equals("personalnumphone")) {
				// Perform search by personal number using exact match
				if (person.getPersonalnumphone().equals(searchTerm)) {
					searchResults.add(person);
				}
			} else if (searchCriteria.equals("professionalnumphone")) {
				// Perform search by professional number using exact match
				if (person.getProfessionalnumphone().equals(searchTerm)) {
					searchResults.add(person);
				}
			}
		}
		return searchResults;
	}

}
