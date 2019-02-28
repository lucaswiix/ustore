<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>uStore - Saruman Panel</title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
  <body style="background-color:#eee;padding-top: 0;">
    
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/">uStore</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/panel/saruman">My Panel <span class="sr-only">(current)</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" onclick="document.forms['logoutForm'].submit()" style="cursor: pointer;">Logout</a>
      </li>
    </ul>
    <span class="navbar-text">
    </span>
  </div>
</nav>


	<div class="container" style="margin-top:3em;">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Hello, ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>

    <hr>
	<div style="padding:20px;width: 200px;height: auto;text-align: left;">
    <a href="/new/order">
		<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#doOrder">New Order</button>
    </a>
	</div>

	<hr>
	<div style="height: 50px;background-color:#ccc;"><center><h1>Soldiers</h1></center></div>

		<div class="row">

      <c:forEach items="${user}" var="user">
			<div class="col-sm-4" style="padding:10px;">
				<div class="card" style="width: 18rem;">
  					<img src="https://www.tibiawiki.com.br/images/2/21/Orc.gif" class="card-img-top" alt="Orc">
  					<div class="card-body">
					<h5 class="card-title" > <c:out value="${user.username}"/> </h5>
    				<p class="card-text">
    					<table width="100%">
    						<tr>
    							<td class="col-sm-3 font-weight-bold">Group:</td><td><c:out value="${user.grouping}"/></td></tr>
                  <tr>
    							<td class="col-sm-3 font-weight-bold">Area:</td><td><c:out value="${user.area}"/></td>
                  </tr>
    						
    					</table>
    					
    				</p>
   					 <a href="/edit/${user.id}" class="btn btn-default">Change</a>
   					 <a href="/delete/${user.id}" class="btn btn-danger">Delete</a>
  					</div>
				</div>				
			</div>
      </c:forEach>

		</div>
	
	</div>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>