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
<body style="background:url('${contextPath}/resources/img/background-img.jpg');background-size: auto 100%;background-repeat: no-repeat;background-position: center;background-color:#0E100F;">

<div class="container display-block h-100" >

  		<div class="row align-items-center text-center h-100">
    
        <div class="col">

        <div class="col-sm-6" style="background-color: rgba(255,255,255,0.2);display:inline-block;border-radius:4px;padding:30px;">
        <h3 style="color:#fff;">Who are you?</h3>

        <a href="/login">
        <button type="button" class="btn btn-warning btn-lg btn3d" style="width: 200px;height: 200px;"><img src="https://www.tibiawiki.com.br/images/8/8f/Furious_Orc_Berserker.gif" alt="Orc" width="32"> <br>Orc</button>
        </a>

        <a href="/saruman/login">
        <button type="button" class="btn3d btn btn-default btn-lg" style="width: 200px;height: 200px;"> 
          <div style="background:url('${contextPath}/resources/img/saruman.gif'); width: 40px;
    height: 40px;
    margin-bottom: -10px;
    background-position: right bottom;
    background-repeat: no-repeat;
    display: inline-block;
  "></div><br> Saruman </button>
        </a>


        </div>

        </div>

      </div>
</div> 

  </body>
  </html>