<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>uStore - New Action</title>

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background-color:#eee;padding-top: 0;">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
    <div style="min-width: 500px;">
		<form:form method="POST"
          action="/new/action" modelAttribute="action">
          <div class="row">
          <h2 class="col">New Action</h2>
          <a href="/actions" class="col text-right">
            <h5>See all actions</h5>
          </a>
          </div>
          <div style="max-width: 300px;">
      <c:if test="${success != null}"><div class="alert alert-success" role="alert">${success}</div></c:if>
      <c:if test="${error != null}"><div class="alert alert-danger" role="alert">${error}</div></c:if>
      </div>

      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Send action</h5>
          <p class="card-text">

			<spring:bind path="soldierId">
      <div class="form-group">
    	<label for="addAction">Select the soldier:</label>

    	<form:select class="form-control" name="soldierId" path="soldierId" id="addAction">
          <c:forEach items="${users}" var="users">
            <option value="${users.id}">${users.username}</option>
          </c:forEach>        
      </form:select>
      <form:errors path="soldierId"></form:errors>
      <br>
  		</div>
  		</spring:bind>
		
            <spring:bind path="grupo">
                <div class="input-group mb-3 ${status.error ? 'has-error' : ''}">
                  <div class="input-group-prepend" style="width:30%;min-width: 75px;">
                    <label class="input-group-text" for="grupo" style="width: 100%;" >Invite to group:</label>
                  </div>
                    <form:select id="grupo" path="grupo" class="custom-select">
                               <option value="goblins">Goblins</option>
                               <option value="uruk-hais">Uruk-hais</option>
                               <option value="snagas">Snagas</option>
                               </form:select>
                    <form:errors path="grupo"></form:errors>
                </div>
            </spring:bind>

        <spring:bind path="area">
               <div class="input-group mb-3 ${status.error ? 'has-error' : ''}">
                  <div class="input-group-prepend" style="width:30%;min-width: 75px;">
                    <label class="input-group-text" style="width: 100%;" for="area">In area:</label>
                  </div>
                            <form:select path="area" id="area" class="form-control">
                                <option value="Isengard">Isengard</option>
                               <option value="Orthanc">Orthanc</option>
                               <option value="Rohan">Rohan</option>                                 
                            </form:select>
                    <form:errors path="area"></form:errors>
                </div>
            </spring:bind>


      </p>
      <a href="/panel/saruman">
        <button type="button" class="btn btn-default" >Close</button>  
      </a>
        <button type="submit" class="float-right btn btn-success">Send action</button>
        
      </div>
    </div>

  		</form:form>
      </div>
  		</div>
  		</div>
  		</div>
  		</div>
</body>
</html>