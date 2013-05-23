/*
 * Copyright 2002-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.springframework.samples.petclinic.repository.jpa;

import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.Specialty;
import org.springframework.samples.petclinic.model.Vet;
import org.springframework.samples.petclinic.repository.VetRepository;
import org.springframework.stereotype.Repository;

/**
 * JPA implementation of the {@link VetRepository} interface.
 *
 * @author Mike Keith
 * @author Rod Johnson
 * @author Sam Brannen
 * @author Michael Isvy
 * @since 22.4.2006
 */
@Repository
public class JpaVetRepositoryImpl implements VetRepository {

    @PersistenceContext
    private EntityManager em;


    @Override
    @Cacheable(value = "vets")
    @SuppressWarnings("unchecked")
    public Collection<Vet> findAll() {
        return this.em.createQuery("SELECT vet FROM Vet vet left join fetch vet.specialties ORDER BY vet.lastName, vet.firstName").getResultList();
    }

    @Override
    public Vet findById(int id) {
        // using 'join fetch' because a single query should load both vets and specialties
        // using 'left join fetch' because it might happen that a vet does not have specialties
        Query query = this.em.createQuery("SELECT vet FROM Vet vet left join fetch vet.specialties WHERE vet.id =:id");
        query.setParameter("id", id);
        return (Vet) query.getSingleResult();
    }

	@Override
	public void save(Vet vet) {
		this.em.merge(vet);
	}

	
	/**
	 * @return
	 * @throws DataAccessException
	 */
    @Override
    @SuppressWarnings("unchecked")
	public List<Specialty> getSpecialties() throws DataAccessException {
		final List<Specialty> specialties = this.em.createQuery("SELECT id, name FROM specialties").getResultList();
        return specialties;

	}
}
