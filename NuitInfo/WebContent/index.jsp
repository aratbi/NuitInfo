<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,ejb.*, servelets.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nuit d'info </title>
</head>
<body>
<%  String name = "";
	if(request.getAttribute("text")!=null){
	name = (String) request.getAttribute("text");
	}%>
ToDo List
<form method="post" action="Index_serv">
					<div>
						<input type="hidden" name="op" value="todo_list">
							 <input type="text" id="text" name="text"
									placeholder="text" />
							
						<div class="clear"></div>
						<button class="btn btn-lg btn-primary btn-block" type="submit"
							style="width: 200px;">OK</button>
					</div>
					
					<section>
					<% if(request.getAttribute("taches")!=null){
									Collection<Tache> taches = (Collection<Tache>) request.getAttribute("taches");
											if(!taches.isEmpty()){%>
					Les taches à faire :
					<ul class="list-group">
						<%for(Tache t : taches){%>
						<li class="list-group-item" style="background-color: #f1f1f1;">
							<%=t.getNom() %>
						</li>
						<%}%>
					</ul>
						<%}else {%><h2>Aucune tache</h2>
						<%}}else {%><h2>Aucune tache</h2>
						<%}%>
				</section>
				</form>
</body>
</html>