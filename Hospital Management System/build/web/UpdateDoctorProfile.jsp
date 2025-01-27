<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%@ page import="com.bean.Patient"%>
<%@ page import="com.patient.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/logo.png" rel="icon" />
<title>Online Hospital Management System</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#doctorlist').show();
		$('.doctor li:first-child a').addClass('active');
		$('.doctor li a').click(function(e) {

			var tabDiv = this.hash;
			$('.doctor li a').removeClass('active');
			$(this).addClass('.active');
			$('.switchgroup').hide();
			$(tabDiv).fadeIn();
			e.preventDefault();

		});

	});
</script>
</head>
<body>
	<div class="container-fluid">

		<!--- Header Start -------->
		<div class="row header">

			<div class="col-md-10">
				<h2>
					Nobel Hospital Management System
					</h3>
			</div>

			<div class="col-md-2 ">
				<ul class="nav nav-pills ">
					<li class="dropdown dmenu"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><%=session.getAttribute("uname")%> <span
							class="caret"></span></a>
						<ul class="dropdown-menu ">

							<li><a href="UpdateDoctorProfile.jsp">Change Profile</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout.jsp">Logout</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
		<!--- Header Ends --------->
		<%
			if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
		%>
		<div class="row">

			<!----- Menu Area Start ------>
			<div class="col-md-2 menucontent">

				<a href="#"><h1>Dashboard</h1></a>

				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="afterDoctorLogin.jsp">My Appointment</a></li>
					<li role="presentation"><a href="UpdateDoctorProfile.jsp">Update Profile</a></li>
				</ul>
			</div>
			<!---- Menu Ares Ends  -------->
			<!---- Content Ares Start  -------->
			<div class="col-md-10 maincontent">
				<!----------------   Menu Tab   --------------->

				<div class="panel panel-default contentinside">
					<div class="panel-heading">Edit Doctor Profile</div>
					<!----------------   Panel body Start   --------------->
					<div class="panel-body">
						<ul class="nav nav-tabs doctor">
							<li role="presentation"><a href="#adddoctor">Click Here to Edit
									 Doctor Profile</a></li>
						</ul>



						<!----------------   Display Patient Data List Ends  --------------->
						<%
								Connection con = ConnectionProvider.getCon();
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from doctor where doc_name='" + session.getAttribute("uname") + "'");
								while (rs.next()) {
						%>
						<!----------------   Add Patient Start   --------------->
						<div id="adddoctor" class="switchgroup">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" action="UpdateDoctorInfo"
										method="post">
										<div class="form-group">

											<div class="col-sm-4">
												<input type="hidden" class="form-control" name="doctor_id"
													value="<%=rs.getInt(1)%>">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="doctorname"
													placeholder="Name" value="<%=rs.getString(2)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Email</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" name="email"
													placeholder="Email" value="<%=rs.getString(3)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input type="password" class="form-control" name="pwd"
													placeholder="Password" value="<%=rs.getString(4)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add"
													placeholder="Address" value="<%=rs.getString(5)%>">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="phon"
													placeholder="Phone No." value="<%=rs.getString(6)%>">
											</div>
										</div>
										

										<div class="form-group">
											<label class="col-sm-2 control-label">Department</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="department"
													placeholder="Age" value="<%=rs.getString(7)%>">
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<input type="submit" class="btn btn-primary"
													value="Update Doctor Info">
											</div>
										</div>
									</form>
									<%
										}
									%>

								</div>
							</div>
						</div>
						<!----------------   Add Patients Ends   --------------->
					</div>
					<!----------------   Panel body Ends   --------------->
				</div>
			</div>
		</div>
                                                                        
                  <div class="row footer navbar-fixed-bottom">
			<div class="col-md-12">
				<div>Developed By :- PRABHAT SINGH CHANDEL , AJAY & ABHISHEK</div>
				<p>Copyrights � Nobel Hospital Management System 2021. All rights
					reserved.</p>
			</div>
		</div>

	</div>





	<script src="js/bootstrap.min.js"></script>
	<%
		} else {
			response.sendRedirect("doctorLogin.jsp");
		}
	%>
</body>
</html>l>