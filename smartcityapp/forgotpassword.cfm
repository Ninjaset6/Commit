<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart City Issues Tracker</title>
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/main-style.css" rel="stylesheet" />
    <link href="assets/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
</head>

<body class="body-Login-back">

    <div class="container">
       
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center logo-margin ">
				<img src="assets/img/logo.jpg" alt=""/>
            </div>
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">                  
                    <div class="panel-heading" align="center">
                        <h3 class="panel-title">Forgot Password</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
								<table width="100%">
									<tr class="tr50">
										<td class="td40">
											User ID*
										</td>
										<td class="td60">
											<input type="text" class="txt" name="userid" placeholder="User ID">
										</td>
									</tr>
									<tr class="tr50">
										<td class="td40">
											First Name*
										</td>
										<td class="td60">
											<input type="text" class="txt" name="firstname" placeholder="First Name">
										</td>
									</tr>
									<tr class="tr50">
										<td class="td40">
											Mobile No*
										</td>
										<td class="td60">
											<input type="text" class="txt" name="mobileno" placeholder="Mobile No" maxlength="10">
										</td>
									</tr>
								</table>
								<br>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="password.cfm" class="btn btn-success btn-block">Forgot Password</a>
                                <hr>
                                New user, <a href="registration.cfm">Click Here</a> for Sign Up.
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <!-- Core Scripts - Include with every page -->
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>

</body>

</html>
