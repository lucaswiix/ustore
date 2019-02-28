<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Ustore - who are you?</title>

      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

      <style>
      a:hover
      {
        text-transform: none;
        text-decoration: none;
      }
      html, body {
    margin: 0;
    height: 100%;
}
        .btn3d {
    transition:all .08s linear;
    position:relative;
    outline:medium none;
    -moz-outline-style:none;
    border:0px;
    margin-right:10px;
    margin-top:15px;
}
.btn3d:focus {
    outline:medium none;
    -moz-outline-style:none;
}
.btn3d:active {
    top:9px;
}
.btn-default {
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #adadad, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#fff;
}
.btn-primary {
    box-shadow:0 0 0 1px #428bca inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #357ebd, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#428bca;
}
 .btn-success {
    box-shadow:0 0 0 1px #5cb85c inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #4cae4c, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#5cb85c;
}
 .btn-info {
    box-shadow:0 0 0 1px #5bc0de inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #46b8da, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#5bc0de;
}
.btn-warning {
    box-shadow:0 0 0 1px #f0ad4e inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #eea236, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#f0ad4e;
}
.btn-danger {
    box-shadow:0 0 0 1px #c63702 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #C24032, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#c63702;
}
      </style>
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
            <a class="nav-link" href="/panel">My Panel <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" onclick="document.forms['logoutForm'].submit()" style="cursor: pointer;">Logout</a>
          </li>
        </ul>
        <span class="navbar-text">
        </span>
      </div>
    </nav>


    <div class="container" style="margin-top: 2em;">
      <c:if test="${pageContext.request.userPrincipal.name != null}">
      
      <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </form>
      <div class="row">
      <h3 class="col-md-6"><img src="https://www.tibiawiki.com.br/images/8/8f/Furious_Orc_Berserker.gif" alt="Orc"> Welcome, ${pageContext.request.userPrincipal.name} !</h3>      
      <span class="col-md-6 text-right" style="font-size: 1.2em;font-weight: 600;">
      <a onclick="document.forms['logoutForm'].submit()" style="cursor: pointer;">Exit!</a>
      </span>
      </div>

      </c:if>
      <hr>

      <div id="action">
        <h5>Action orders:</h5>
        <div class="row">
          <c:forEach items="${order}" var="order">
          <div class="col-md-3 col-sm-4 col-xs-6 p-2" >
            <div class="card">
              <div class="card-body">
                <h6 class="card-subtitle mb-2 text-muted">Saruman order</h6>
                <p class="card-text">${order.message}</p>
              </div>
              <div class="card-footer text-right" style="padding-top: 0;">
                <button type="button" style="margin-bottom:10px;" class="btn btn-info btn3d btn-block">Execute!</button>
              </div>
            </div>
          </div>
          </c:forEach>

        </div>
      </div>

      <hr>


      <div id="messages">
        <h5>Messages orders:</h5>
        <div class="row" >
          <c:forEach items="${order}" var="order">
          <div class="col-md-3 col-sm-4 col-xs-6 p-2" >
            <div class="card">
              <div class="card-body">
                <h6 class="card-subtitle mb-2 text-muted">Saruman says:</h6>
                <p class="card-text">${order.message}</p>
              </div>
              <div class="card-footer text-right">${order.created_at}</div>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>


    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>