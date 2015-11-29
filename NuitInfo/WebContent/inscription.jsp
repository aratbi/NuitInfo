<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,ejb.*, servelets.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>s'inscrire</title>
</head>
<body>
<div id="main" class="container">
		<form method="post" action="Index_serv" name="formular">
			<input type="hidden" name="op" value="s'inscrire" /> 
			<label for="Nom" class="sr-only">Nom</label>
			 <input type="Nom" id="Nom" name="nom"
			class="form-control" placeholder="Nom" required autofocus
			value="<%=request.getAttribute("nom")%>"> 
		<p></p>
		<label for="Prenom" class="sr-only">Prénom</label> <input
			type="Prenom" id="Prenom" name="prenom" class="form-control"
			placeholder="Prénom" required autofocus
			value="<%=request.getAttribute("prenom")%>">
		<p></p>
		<label for="inputId" class="sr-only">Identifiant</label> <input
			type="identifiant" id="inputId" name="identifiant"
			class="form-control" placeholder="identifiant" required autofocus
			value="<%=request.getAttribute("identifiant")%>">
		<p></p>
		<label for="inputEmail" class="sr-only">l'adresse mail </label> <input
			type="email" id="inputEmail" name="email" class="form-control"
			placeholder="L'adresse mail" required autofocus
			value="<%=request.getAttribute("email")%>">
		<p></p>
		<label for="inputPassword" class="sr-only">Mot de passe</label> <input
			type="password" id="inputPassword" name="mdp" class="form-control"
			placeholder="Mot de passe" required>
		<p></p>
		<label for="inputConfirmationPassword" class="sr-only">Confirmation
			mot de passe</label> <input type="password" id="inputConfirmationPassword"
			name="confirmationMdp" class="form-control"
			placeholder="Confirmation mot de passe" required>
		<p></p>
		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:200px;">S'inscrire</button>
		</form>
</div>
</body>
</html>