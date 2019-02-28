<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Ustore - Saruman</title>

      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/solid.css" integrity="sha384-r/k8YTFqmlOaqRkZuSiE9trsrDXkh07mRaoGBMoDcmA58OHILZPsk29i2BsFng1B" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/fontawesome.css" integrity="sha384-4aon80D8rXCGx9ayDt85LbyUHeMWd3UiBaWliBlJ53yzm9hqN21A+o1pqoyK04h+" crossorigin="anonymous">

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
.menua:hover
{
  border:solid 2px #c63702 !important ;
}
.mapping a
{
  transition: 0.2s linear all;
  color:#ccc;
}
.mapping a:hover
{
  color:#B1B1B1;
}
.form-control
{
  border-radius: 0;
}
.form-control:focus
{
  box-shadow: none;
  border:none;
  border:1px solid #FF6000;
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

        <div class="row">
        <h2 class="col-md-6 col-sm-12">
        <div style="background:url('${contextPath}/resources/img/saruman.gif');    width: 40px;
    height: 40px;
    margin-bottom: -10px;
    background-position: right bottom;
    background-repeat: no-repeat;
    display: inline-block;

  "></div>
         Hail my king, ${pageContext.request.userPrincipal.name}.</h2>
        <h4 class="col-md-6 col-sm-12 text-right"><a onclick="document.forms['logoutForm'].submit()" style="cursor: pointer;">Leave</a></h4>
        </div>
    </c:if>
  <hr>
  <h5 style="margin-bottom: -20px;">Menu:</h5>
	<div class="menu row" style="width: 100%;height: 150px;border-top:solid 1px #ccc;border-bottom: solid 2px #ccc;margin:20px 0px 20px 0px;">

   <button type="button" class="menua col-md-3 col-sm-4 col-xs-6" style="font-size:1.4em;color:#444;font-weight:500;height: 150px;border:none;background-color:#5cb85c;" onclick="window.location='/';">
    Show Soldiers   
   </button>

   <button type="button" class="menua col-md-3 col-sm-4 col-xs-6" style="font-size:1.4em;color:#444;font-weight:500;height: 150px;border:none;background-color:#F0AD4E;" onclick="window.location='/new/order';">
    Send message     
   </button>

    <button type="button" class="menua col-md-3 col-sm-4 col-xs-6" style="font-size:1.4em;color:#444;font-weight:500;height: 150px;border:none;background-color:#5BC0DE;" onclick="window.location='/new/action';">
    Send Action     
   </button>

   <button type="button" class="menua col-md-3 col-sm-4 col-xs-6" style="font-size:1.4em;color:#444;font-weight:500;height: 150px;border:none;background-color:#428bca;" onclick="window.location='/order';">
    Last Messages   
   </button>
	</div>

<hr>
  
  <div class="content-wrap">
	<div style="height: 50px;background-color:#ccc;"><center><h1>Soldiers</h1></center></div>

		<div class="row">

      <c:forEach items="${user}" var="user">
			<div class="col-xl-3 col-md-4 col-sm-6 col-xs-12" style="padding:10px;">
				<div class="card">
  					<img src="https://www.tibiawiki.com.br/images/2/21/Orc.gif" class="card-img-top"  alt="Orc">
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
          </div>
          <div class="card-footer">
            <div class="row">
              <div class="col-md-6">
   					 <a href="/edit/${user.id}" class="btn btn-default">Change</a>
             </div>
             <div class="col-md-6 text-right">
   					 <a href="/delete/${user.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this soldier?');">Delete</a>
             </div>
             </div>
  					</div>
            </div>
				</div>
      </c:forEach>

		</div>
	
	</div>
  </div>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>