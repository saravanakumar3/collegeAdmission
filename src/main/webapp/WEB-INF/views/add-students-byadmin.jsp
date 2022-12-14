<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="En">
<head>
<meta charset="ISO-8859-1">
<title>Registration for college admission </title>
<style type="text/css">
<%@include file="/WEB-INF/css/add-students-by-admin.css"%>
</style>
</head>
<body > 
	<nav>
		<div class="menu">
			<div class="logo">
				<a>Madurai Government Arts College</a>
			</div>
			<ul>
				<li><button class="button1"
        onclick="history.back()">Go Back</button></a></li>
			</ul>
		</div>
	</nav>
<h1>Registration form for college admission</h1>
	<div id="root" class="center">
		<div id="form">
			<form:form action="enterdetails" method="post" modelAttribute="addstudentdetail">
				<div>
					<label for="username">FullName</label>
					<div>
						<form:input path="username" class="form-control" placeholder="Full Name"
						title="This field can't be empty or must contain only alphabets" 
						pattern="^[A-Za-z\s]*$" required="true"/>
					       <form:errors path="username" />
				</div>
				<div>
						<label for="dob">DOB</label>
						<div>
							<form:input path="dob" id="dob" class="form-control" type="date" required="true" onblur="checkDate();"/>
						</div>
					 <form:errors path="dob" />
					</div>
				<div>
					<label for="qualification">Qualification</label>
					<div>
						<form:input path="qualification" class="form-control" placeholder="Qualification"
						title="This field can't be empty or must contain only alphabets" 
						pattern="^[A-Za-z\s]*$" required="true"/>
                       <form:errors path="qualification" />
						
					</div>
				</div>
				<div>
					<label for="sslcMark">Sslc Mark</label>
					<div>
						<form:input path="sslcMark" class="form-control" placeholder="Sslc Mark"
						title="To register, you must have an SSCmark of at least 300" pattern ="[34][0-9]{2}|500"/>
						<form:errors path="sslcMark" />
					</div>
				</div>
				<div>
					<label for="hscMark">Hsc Mark</label>
					<div>
						<form:input path="hscMark"  class="form-control" placeholder="Hsc Mark"
						title="To register, you must have an HscMark of at least 700"  pattern ="[7-9][0-9]{2}|[1][01][0-9]{2}|1200"/>
						<form:errors path="hscMark" />
					</div>
				</div>
				<div>
					<label for="gender">Gender</label></div>
					<div class="form-control" >
					    Male:
						<form:radiobutton path="gender"  value="Male" />
						Female:
						<form:radiobutton path="gender"  value="Female" />
						<form:errors path="gender" />
					</div>
				</div>
				<div><label for="address">Address</label></div>
				<div>    
						<form:textarea path="address"  class="form-textarea"  cols="35" rows="4" required="true" />
						<form:errors path="address"/>
					</div>
				<div>
					<label for="userlocation">User location</label>
					<div>
						<form:input path="userlocation" class="form-control" />
						<form:errors path="userlocation" />
					</div>
				</div>
				<div>
				<div>
					<label for="nation">Nationally</label>
					<div>
						<form:input path="nation" class="form-control" />
						<form:errors path="nation" />
					</div>
				</div>
					<label for="phoneNumber">PhoneNumber</label>
					<div>
						<form:input path="phoneNumber" class="form-control"  placeholder="Mobile Number"
                            pattern="[1-9]{1}[0-9]{9}"
                            title="Phone number should have atleast 10 digits"
                            required="true"/>
					</div>
				</div>
				<div>
					<label for="email">Email</label>
					<div>
						<form:input path="email" class="form-control"   placeholder="Email"
							pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
							title="Enter valid email ex: example@gmail.com" required="true" />
						<form:errors path="email"/>
					</div>
				</div>
				<div>
					<label for="userPassword">User Password</label>
					<div>
						<form:input path="userPassword" class="form-control"  placeholder="User Password" title ="password has only four characters and one digits" pattern="[a-zA-Z)-9]{5}" type="password" />
						<form:errors path="userPassword" />
					</div>
				</div>
				</div>
				<div> ${message}</div>
				<br>
				<div>
				<form:button class="click-button">Sign up</form:button>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript">
	function checkDate() {
	    let dob = document.getElementById('dob').value;
	    let now = new Date();
	    let dt1 = Date.parse(now),
	        dt2 = Date.parse(dob);
	    
	    if (dt2 > dt1) {
	        alert("Date must be in the past or present");
	    }
	}
	</script>
</body>
</html>