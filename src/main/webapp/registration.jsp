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
<body style="background:url('${contextPath}/resources/img/background-img.jpg');background-size: auto 100%;background-repeat: no-repeat;background-position: center;background-color:#0E100F;">

<div class="container display-block h-100" >

      <div class="row align-items-center text-center h-100">
    
        <div class="col">

        <div class="col-sm-6" style="background-color: rgba(255,255,255,0.2);display:inline-block;border-radius:4px;padding:30px;max-width: 350px;position: relative;">
        <div class="mapping" style="color:#fff;font-weight:500;position: absolute;top:-24px;left:5px;">
          <span>
            <a href="/"><i class="fas fa-home"></i> Home</a>
             <i class="fas fa-caret-right" style="font-size:0.8em;"></i> 
             <a href="/login">Orc Login</a> 
             <i class="fas fa-caret-right" style="font-size:0.8em;"></i> 
                 Orc Register

           </span>
         </div>

      <div style="display:inline-block;">
        <form:form method="POST" modelAttribute="userForm" class="form-signin">
            <h2 class="text-white">KRAK ORRRRRRK!</h2>

            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="username" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username" class="text-white"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="grouping">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:select path="grouping" class="form-control">
                               <option value="" selected disabled>Your Group</option>

                               <option value="goblins">Goblins</option>
                               <option value="uruk-hais">Uruk-hais</option>
                               <option value="snagas">Snagas</option>
                                 
                               </form:select>
                    <form:errors path="grouping" class="text-white"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="area">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:select path="area" class="form-control" >
                               <option value="" selected disabled>Your Region</option>
                               <option value="Isengard">Isengard</option>
                               <option value="Orthanc">Orthanc</option>
                               <option value="Rohan">Rohan</option>                                 
                               </form:select>
                    <form:errors path="area" class="text-white"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                    <form:errors path="password" class="text-white"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="passwordConfirm" class="form-control"
                                placeholder="Confirm your password"></form:input>
                    <form:errors path="passwordConfirm" class="text-white"></form:errors>
                </div>
            </spring:bind>

            <input type="hidden" value="0" name="permission" path="permission" />

            <button class="btn btn-lg btn-warning btn-block" type="submit">Create</button>
        </form:form>

      </div>


        </div>

        </div>

      </div>
</div> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
  </html>
