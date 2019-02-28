<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Ustore - Update Saruman</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

     
      <!-- <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> -->
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
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


	<div class="container" style="text-align: center;margin-top: 2em;">
<div style="display:inline-block;vertical-align: middle;align-items: center;background-color: rgba(255,255,255,0.2);">
	<div class="col-sm-12" style="text-align: left;">
    		<form:form method="POST"
          action="/update/${user.id}" modelAttribute="user">

			<h2>Send Order to Orc!</h2>

<div class="card">
  <img src="https://www.tibiawiki.com.br/images/3/39/Orc_Cult_Fanatic.gif" width="60px" class="card-img-top" alt="Orc">
  <div class="card-body">
    <h5 class="card-title">${user.username}</h5>
    <p class="card-text">

<spring:bind path="grouping">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:select path="grouping" class="custom-select"
                               >
                               <option value="${user.username}" selected disabled>${user.grouping}</option>

                               <option value="goblins">Goblins</option>
                               <option value="uruk-hais">Uruk-hais</option>
                               <option value="snagas">Snagas</option>
                                 
                               </form:select>
                    <form:errors path="grouping"></form:errors>
                </div>
            </spring:bind>

<spring:bind path="area">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:select path="area" class="form-control"
                               >
                               <option value="${user.username}" selected disabled>${user.area}</option>
                               <option value="Isengard">Isengard</option>
                               <option value="Orthanc">Orthanc</option>
                               <option value="Rohan">Rohan</option>                                 
                               </form:select>
                    <form:errors path="area"></form:errors>
                </div>
            </spring:bind>

</p>
 <a href="/panel/saruman">
					<button type="button" class="btn btn-default">Back</button>
					</a>

   <button type="submit" class="float-right btn btn-success">Update</button>
  
  </div>
</div>
 </form:form>

				
			</div>
			</div>
			</form>
		</div>	
		</div>
		</div>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>