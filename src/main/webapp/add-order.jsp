<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>uStore - New Order</title>

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background-color:#eee;padding-top: 0;">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">uStore</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/panel">Panel Soldiers <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/panel/saruman">Panel Saruman</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/new/order">New Order</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" onclick="document.forms['logoutForm'].submit()" style="cursor: pointer;">Logout</a>
      </li>
    </ul>
  </div>
</nav>

<div class="content-page" style="margin-top:2em;">

	<center><h2>New Order</h2></center>

	<div class="container" style="text-align: center;">	

	
		<div style="text-align: left;">	
		<form:form method="POST"
          action="/new/order" modelAttribute="ordem">

			<spring:bind path="message">
        <div class="form-group">
    	<label for="exampleFormControlTextarea1">You order:</label>

    	<form:textarea class="form-control" name="message" placeholder="Message" path="message" id="exampleFormControlTextarea1" rows="3"></form:textarea>
      <br><span ></span>
  		</div>
  		</spring:bind>
		
		<spring:bind path="grupo">
  		<div class="form-group">
		    <label for="togroup">To Group:</label>
		    <form:select name="grouping" path="grupo"  id="togroup" class="form-control">
		    	<option value="goblins">goblins</option>
		    	<option value="uruk-hais">uruk-hais</option>
		    	<option value="snagas">snagas</option>
		    </form:select>
        <br>
        <form:errors path="grupo"></form:errors>
		 </div>
		</spring:bind>

		<spring:bind path="area">
		 <div class="form-group">
		    <label for="toarea">To Area:</label>
		    <form:select name="area" path="area" id="toarea" class="form-control">
		    	<option value="orthanc">Orthanc</option>
		    	<option value="isengard ">Isengard</option>
		    	<option value="rohan">Rohan</option>
		    </form:select>
        <br>
        <form:errors path="area"></form:errors>
		 </div>
		</spring:bind>


      </div>
      <div class="modal-footer">      
      <button type="button" class="btn btn-default" >Close</button>  
        <button type="submit" class="btn btn-success">Send Order</button>
        
      </div>

  		</form:form>
  		</div>
  		</div>
  		</div>
  		</div>
</body>
</html>