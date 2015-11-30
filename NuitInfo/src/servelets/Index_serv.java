package servelets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ejb.Facade;
import ejb.Tache;


/**
 * Servlet implementation class Index_serv
 */
@WebServlet("/Index_serv")
public class Index_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private Facade f=new Facade();
	
	private HttpSession session;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Index_serv() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sop = request.getParameter("op");
		session = request.getSession();
		int idPers ;
		switch(sop){
		case "todo_list": 
			String text =request.getParameter("text");
			idPers = f.getPersonne((String)session.getAttribute("identifiant")).getId();
			f.AjouterTache(new Tache(text),idPers);
			Collection<Tache> taches = f.getTaches(idPers);
			request.setAttribute("taches", taches);
			this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			break;
		case "s'inscrire":
			
			String nom = request.getParameter("nom");

			String prenom = request.getParameter("prenom");

			String email = request.getParameter("email");

			String ident = request.getParameter("identifiant");

			String mdp = request.getParameter("mdp");

			String confMdp = request.getParameter("confirmationMdp");

			f.inscrire(nom, prenom, email, ident, mdp , confMdp);
			request.setAttribute("erreurs", f.getErreurs());
			if(f.getErreurs().isEmpty()){
				session.setAttribute("identifiant",ident);
				session.setAttribute("Personne",f.getPersonne((String)session.getAttribute("identifiant")));
				this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			}
			else{
				request.setAttribute("nom", nom);
				request.setAttribute("prenom", prenom);
				request.setAttribute("identifiant", ident);
				this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				f.InitErreurs();
			}

			break;
		case "seconnecter":

			String ident1 = request.getParameter("identifiant");
			session.setAttribute("identifiant",ident1);
			String mdp1 = request.getParameter("mdp");
			f.connecter(ident1, mdp1);
			if(f.getErreurs().isEmpty()){
				idPers = f.getPersonne((String)session.getAttribute("identifiant")).getId();
				Collection<Tache> taches2 = f.getTaches(idPers);
				request.setAttribute("taches", taches2);
				session.setAttribute("Personne",f.getPersonne((String)session.getAttribute("identifiant")));
				this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
			}
			else{
				request.setAttribute("erreurs", f.getErreurs());
				this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				f.InitErreurs();
			}

			break;
		default: break;
		}
	}

}
