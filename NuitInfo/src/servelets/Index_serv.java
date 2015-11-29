package servelets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		switch(sop){
		case "todo_list": 
			String url = request.getParameter("url");
			String text =request.getParameter("text");
			f.AjouterTache(new Tache(text));
			Collection<Tache> taches = f.getTaches();
			request.setAttribute("taches", taches);
			request.setAttribute("text", text);
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			break;
		default: break;
		}
	}

}
