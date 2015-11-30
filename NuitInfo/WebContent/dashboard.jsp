<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,ejb.*, servelets.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.6-dist\css\bootstrap.css">
    <link rel="stylesheet" type="text/css" href="font-awesome-4.4.0\css\font-awesome.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="script.js"></script>

	<title>Welcome at your TodoList</title></head>
<body class="background fullscreen">
<div class="list centered-2 ">

			<div class="form-2">
				<form method="post" action="Index_serv">
				<input type="hidden" name="op" value="todo_list">
					<div "form-item">
						<input type="text" id="text" name="text" placeholder="Please wrote your task here" />
					</div>
					<div class="div-btn">
						<input type="submit" class="btn" value="ajouter"> 
					</div>
				</form>
			</div>
			
	<div class="tasks">
		<ul class="tasks-list">
			
			<% if(request.getAttribute("taches")!=null){
							Collection<Tache> taches = (Collection<Tache>) request.getAttribute("taches");
									if(!taches.isEmpty()){%>
				<%for(Tache t : taches){%>
				<li class="task nostyle">
				<div class="list-item">
					<i class="fa fa-thumb-tack"></i>
					<span><%=t.getNom() %> </span>
				</div>
				<i class="fa fa-check check"></i>
				<i class="fa fa-times remove"></i>
				</li>
				<%}%>
		</ul>
				<%}else {%><h2>Aucune tache</h2>
				<%}}else {%><h2>Aucune tache</h2>
				<%}%>
	</div>
	
</div>
</body>
</html>