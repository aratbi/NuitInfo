<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
Hi Miss, Mr <%=name%>
<form method="post" action="Index_serv">
					<div>
						<input type="hidden" name="op" value="todo_list">
							 <input type="text" id="text" name="text"
									placeholder="text" />
							
						<div class="clear"></div>
						<button class="btn btn-lg btn-primary btn-block" type="submit"
							style="width: 200px;">OK</button>
					</div>
				</form>
</body>
</html>