<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Ops</title>

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

</style>
</head>
<body style="background:url('${contextPath}/resources/img/background-img.jpg');background-size: auto 100%;background-repeat: no-repeat;background-position: center;background-color:#0E100F;">
<div class="container display-block h-100" >

      <div class="row align-items-center text-center h-100">
      	<div class="col">
      		<div class="col-sm-6">
      			<div class="mapping" style="color:#fff;font-weight:500;position: absolute;top:-24px;left:5px;">
          		<span><a href="/"><i class="fas fa-home"></i> Home</a>
             <i class="fas fa-caret-right" style="font-size:0.8em;"></i> Orc Login</span>
			<div class="col-sm-10" style="display:inline-block;">
				
				<h2>ERROR 404</h2>
				<p>We did not find this page =(</p>

			</div>
      		</div>
      		</div>
      	</div>
      </div>
  </div>
	
</body>
</html>