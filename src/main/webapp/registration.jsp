<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>uStore - Creating Account</title>
  
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

      <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
  </head>

  <body style="color:#D7C798;padding-top: 0;">
    
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="/">uStore</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/login">Login <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/registration">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/">Who i am?</a>
      </li>
    </ul>
    <span class="navbar-text">
    </span>
  </div>
</nav>

    <div class="container">

        <form:form method="POST" modelAttribute="userForm" class="form-signin">
            <h2 class="form-signin-heading">Create accoount</h2>

            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="username" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="grouping">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:select path="grouping" class="form-control"
                               >
                               <option value="" selected disabled>Your Group</option>

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
                               <option value="" selected disabled>Your Region</option>
                               <option value="Isengard">Isengard</option>
                               <option value="Orthanc">Orthanc</option>
                               <option value="Rohan">Rohan</option>                                 
                               </form:select>
                    <form:errors path="area"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                    <form:errors path="password"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="passwordConfirm" class="form-control"
                                placeholder="Confirm your password"></form:input>
                    <form:errors path="passwordConfirm"></form:errors>
                </div>
            </spring:bind>

            <input type="hidden" value="0" name="permission" path="permission" />

            <button class="btn btn-lg btn-primary btn-block" type="submit">Join</button>
        </form:form>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>
