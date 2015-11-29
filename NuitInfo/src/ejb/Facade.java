package ejb;

import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.Singleton;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Singleton
@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
public class Facade {

	@PersistenceContext
	private EntityManager em;
	
	//private Collection<Tache> taches = new ArrayList<Tache>();
	
	public void AjouterTache(Tache tache) {
		//taches.add(tache);
		em.persist(tache);
	}

	public Collection<Tache> getTaches() {
		return em.createQuery("select t from Tache t").getResultList();
	}
	
	
}
