<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,ejb.*, servelets.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
</<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.6-dist\css\bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="script.js"></script>

	<title>Welcome at your TodoList</title>
</head>
<body class="background fullscreen">
<%if(request.getAttribute("erreurs")!=null){
				Collection<String> erreurs =(Collection<String>) request.getAttribute("erreurs");
				if(!erreurs.isEmpty()){%>
				<div class="alert alert-danger" role="alert">
				<b>Erreur !</b><%
					for(String erreur : erreurs){
						%><p>-<%=erreur%></p><%
					}
					}%>
					</div>
				<%}%>
<div class="form centered">
	<div class="tabs">
		<ul class="nav">
			<li class="nav-item">
				<a data-toggle="tab" href="#login-form" class="active">Sign in</a>
			</li><!--
					--><li class="nav-item">
				<a data-toggle="tab" href="#registration-form" >Sign up</a>
			</li><!--
			--><li class="nav-item">
				<a data-toggle="tab" href="#resetpassword-form">Reset Password</a>
			</li><!--
		--></ul>
	</div>

	<div class="tab-content">
		<div id="login-form" class="tab-pane fade in active">
			<p class="message">Please fill in this form to get your todo list:</p>
			<form method="post" action="Index_serv" name="formular">
				<input type="hidden" name="op" value="seconnecter" />
				<div class="form-item">
					<input type="text" placeholder="Username" name="identifiant">	
				</div>

				</br>

				<div class="form-item">
					<input type="password" placeholder="Password" name="mdp">
				</div>
				</br>

				<div class="div-btn">
					<input type="submit" class="btn" value="Sign in"> 
				</div>
			</form>
		</div>

	<div id="registration-form" class="tab-pane fade in">
			<p class="message">Please fill in this form to create your account:</p>
			<form method="post" action="Index_serv" name="formular">
				<input type="hidden" name="op" value="s'inscrire" /> 
				<div class="form-item">
					<input type="Nom" id="Nom" name="nom"
					class="form-control" placeholder="Nom" required autofocus
					value="<%if(request.getAttribute("nom")!=null)request.getAttribute("nom");%>"> 
				</div>

				</br>
				<div class="form-item">
					<input type="Prenom" id="Prenom" name="prenom" class="form-control"
					placeholder="Prénom" required autofocus
					value="<%if(request.getAttribute("prenom")!=null)request.getAttribute("prenom");%>">
				</div>

				</br>

				<div class="form-item">
					<input
					type="identifiant" id="inputId" name="identifiant"
					class="form-control" placeholder="identifiant" required autofocus
					value="<%if(request.getAttribute("identifiant")!=null)request.getAttribute("identifiant");%>">
				</div>
				</br>
				<div class="form-item">
					<input
					type="email" id="inputEmail" name="email" class="form-control"
					placeholder="L'adresse mail" required autofocus
					value="<%if(request.getAttribute("email")!=null)request.getAttribute("email");%>">
				</div>
				</br>

				</br>
				<div class="form-item">
					<input
					type="password" id="inputPassword" name="mdp" class="form-control"
					placeholder="Mot de passe" required>
				</div>
				</br>
				
				</br>
				<div class="form-item">
					 <input type="password" id="inputConfirmationPassword"
						name="confirmationMdp" class="form-control"
						placeholder="Confirmation mot de passe" required>
				</div>
				</br>
				
				<div class="div-btn">
					<input type="submit" class="btn" Value="Sign up"> 
				</div>
			</form>
		</div>
	<div id="resetpassword-form" class="tab-pane fade in">
			<p class="message">Please enter your email :</p>

			<form>

				</br>
				<div class="form-item">
					<input type="text" placeholder="Email">	
				</div>

				</br>

				</br>

				<div class="div-btn">
					<input type="submit" class="btn" value="Send"> 
				</div>
			</form>
	</form>
	</div>
	</div>
</div>



</body>
</html>