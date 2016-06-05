<cfif structKeyExists(session, "user")>
	<cflocation url="dashboard.cfm" addtoken="false">
</cfif>

<cfinclude template="header.cfm">

<body class="body-Login-back">

    <div class="container">
       
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center logo-margin" style="margin-top:10px">
				<img src="assets/img/logo.jpg" alt=""/>
            </div>
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default" style="margin-top:10px">                  
                    <div class="panel-heading" align="center">
                        <h3 class="panel-title">Sign Up</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" name="frmReg" action="controller/page_action.cfm?action=newuser">
                            <table width="100%">
								<tr class="tr50">
									<td class="td40">
										User Name*
									</td>
									<td class="td60">
										<input type="text" class="txt" name="userName" placeholder="Choose a user name">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Password*
									</td>
									<td class="td60">
										<input type="password" class="txt" name="password" placeholder="Enter password">
									</td>
								</tr>
								<tr class="tr50">
									<td colspan="2">
									<hr>
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
										Last Name
									</td>
									<td class="td60">
										<input type="text" class="txt" name="lastname" placeholder="Last Name">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Date of Birth
									</td>
									<td class="td60">
										<input type="text" class="txt" name="dateofbirth" placeholder="DD-MM-YYYY">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Gender
									</td>
									<td class="td60">
										<input type="text" class="txt" name="gender" placeholder="Male / Female">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Mobile No*
									</td>
									<td class="td60">
										<input type="text" class="txt" name="mobileno" maxlength="10" placeholder="Only 10 Digit">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Email Address
									</td>
									<td class="td60">
										<input type="text" class="txt" name="emailaddress" placeholder="Ex: Abc@gmail.com">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Occupation
									</td>
									<td class="td60">
										<input type="text" class="txt" name="occupation" placeholder="Occupation">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Organization
									</td>
									<td class="td60">
										<input type="text" class="txt" name="organization" placeholder="Organization">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Area
									</td>
									<td class="td60">
										<input type="text" class="txt" name="area" placeholder="Area / Muhalla">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										City
									</td>
									<td class="td60">
										<input type="text" class="txt" name="city" placeholder="City">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Zip Code
									</td>
									<td class="td60">
										<input type="text" class="txt" name="zipcode" maxlength="6" placeholder="Zip Code">
									</td>
								</tr>
								<tr class="tr50">
									<td class="td40">
										Country
									</td>
									<td class="td60">
										<input type="text" class="txt" name="country" placeholder="Country">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="padding-top:20px">
										<input type="submit" class="btn btn-success" value="SignUp">
										<button type="reset" class="btn btn-warning">Reset</button>
										<hr>
										Already a user, <a href="login.cfm">Click Here</a> to Sign In
									</td>
								</tr>
							</table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<cfinclude template="footer.cfm">