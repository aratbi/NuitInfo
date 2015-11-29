package ejb;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

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
	private Collection<String> erreurs = new ArrayList<String>();
	
	
	public void AjouterTache(Tache tache, int idPers) {
		tache.setProprio(getPersonne(idPers));
		em.persist(tache);
	}

	public Collection<Tache> getTaches(int idPers) {
		Collection<Tache> taches = new LinkedList<Tache>();
		Collection<Object> objets =  em.createNativeQuery("select * from Tache where proprio_id='"+
				idPers+"'").getResultList();
		Iterator<Object> it = objets.iterator();
		while(it.hasNext()){
			Object[] obj = (Object[]) it.next();
			System.out.println((String)obj[1]);
			Tache a = new Tache((String)obj[1]);
			taches.add(a);
		}
		return taches;
		
	}
	
	/**renvoie la Personne a partir de son id.*/
	public Personne getPersonne(int i) {
		return em.find(Personne.class, i);
	}
	/**renvoie la Personne a partir de son identifiant.*/
	public Personne getPersonne(String identifiant) {
		Personne p=null;
		Collection<Personne> personnes = em.createQuery("select p from Personne p where p.identifiant Like :identifiant").
		setParameter("identifiant",identifiant ).getResultList();
		Iterator<Personne> it = personnes.iterator();
		if(it.hasNext())
		p=it.next();
		return p;
	}
	/**Retourne les erreurs. */
	public Collection<String> getErreurs() {
		return erreurs;
	}
	/**Vider la liste des erreurs.*/
	public void InitErreurs(){
		erreurs.clear();
	}
	/**L'inscription d'une personne.*/
	private void validationInscription( String nom,String prenom ) throws Exception {
		if ( nom.equals("") || prenom.equals("")  ) {
			throw new Exception( "Merci de renseigner tous les champs." );
		}
	}
	
	/** Valide l'adresse email saisie. */
	private void validationEmail( String email ) throws Exception {
		if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
			throw new Exception( "Merci de saisir une adresse mail valide." );
		}
	}
	
	private void validationIdent( String ident ) throws Exception {
		if(ident==null){
			throw new Exception("Veuillez saisir un identifiant.");
		}
		else {
			Collection<Personne> personnes = em.createQuery("select p from Personne p where p.identifiant Like :identUtil").
					setParameter("identUtil",ident ).getResultList();
			if(!personnes.isEmpty()){
				throw new Exception("Identifiant deja  utilise saisissez un autre. ");
			}
		}
	}
	
	/**Validation du mot de passe. */
	private void validationMdp( String mdp , String conf ) throws Exception {
		if(mdp==null || conf==null){
			throw new Exception("Veuillez saisir un mot de passe.");
		}
		else {
			if(mdp.length()<3){
				throw new Exception("il doit y avoir au moins 3 caracteres. ");
			}
			if(!mdp.equals(conf)){
				throw new Exception("Erreur dans la saisie du mot de passe. ");
			}
		}
	}
	//Rajouter les erreurs si exception lever.
	public void setErreur(String message ) {
		erreurs.add(message );
	}
	
	public void inscrire(String nom,String prenom,String email,String ident,String mdp ,String confmdp){
		try{
			validationInscription(nom,prenom);
		} catch(Exception e){
			setErreur(e.getMessage());
			System.out.println("validationInscription erreur");
		}

		try {
			validationEmail(email);
		} catch (Exception e) {
			setErreur(e.getMessage());
			System.out.println("validationEmail erreur");
		}
		try {
			validationIdent(ident);
		} catch (Exception e) {
			setErreur(e.getMessage());
			System.out.println("validationIdent erreur");
		}
		try {
			validationMdp(mdp,confmdp);
		} catch (Exception e) {
			setErreur(e.getMessage());
			System.out.println("validationMdp erreur");
		}

		if(erreurs.isEmpty()){
			Personne p = new Personne(nom,prenom,email,ident,mdp);
			em.persist(p);
		}
	}
	
}
