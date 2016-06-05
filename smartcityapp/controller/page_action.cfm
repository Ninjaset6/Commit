<cfparam name="action" default="">
<cfset objUser = CreateObject("component","smartcityapp.cfc.user")>
<cfset objLogin = CreateObject("component","smartcityapp.cfc.login")>

<cfswitch expression="#action#">
	<cfcase value="login">
		<cfif StructKeyExists(session, "user")>
			<cflocation url="../dashboard.cfm" addtoken="false">
		<cfelse>
			<!--- db user check --->
			<cfset qryUser = objUser.GetUserLoginInfo(
				email = form.email,
				password = form.password
			)>
			<cfif qryUser.RecordCount>
				<cfset objLogin.SetUserLogin(
					userId = qryUser.USER_ID,
					action = "login"
				)>
				
				<cfset session.user = StructNew()>
				<cfset session.user.user_id = qryUser.USER_ID>
				<cfset session.user.first_name = qryUser.FIRST_NAME>
				<cfset session.user.last_name = qryUser.LAST_NAME>
				<cfset session.user.email_id = qryUser.EMAIL_ID>
				<cfset session.user.zip_code = qryUser.zip_code>
				<cfset session.user.phone = qryUser.phone_no>
			</cfif>
			
			<cflocation url="../dashboard.cfm" addtoken="false">
		</cfif>
	</cfcase>
	
	<cfcase value="logout">
		<cfif StructKeyExists(session, "user")>
			<cfset objLogin.SetUserLogin(
				userId = session.user.user_id,
				action = "logout"
			)>
			<cfset StructDelete(session, "user")>
			
			<cflocation url="../login.cfm" addtoken="false">
		</cfif>
	</cfcase>
	
	<cfcase value="newuser">
		<cfset newUserId = objUser.SetUser(
			email = form.emailaddress,
			password = form.password,
			firstName = form.firstName,
			lastName = form.lastName,
			dob = form.dateofbirth,
			gender = form.gender,
			occupation = form.occupation,
			phone = form.mobileno,
			organization = form.organization,
			area = form.area,
			city = form.city,
			zipCode = form.zipCode,
			country = form.country
		)>
		
		<cfset qryUser = objUser.GetUserLoginInfo(
			email = form.emailaddress,
			password = form.password
		)>
		<cfif qryUser.RecordCount>
			<cfset objLogin.SetUserLogin(
				userId = newUserId,
				action = "login"
			)>
			
			<cfset session.user = StructNew()>
			<cfset session.user.user_id = qryUser.USER_ID>
			<cfset session.user.first_name = qryUser.FIRST_NAME>
			<cfset session.user.last_name = qryUser.LAST_NAME>
			<cfset session.user.email_id = qryUser.EMAIL_ID>
			<cfset session.user.zip_code = qryUser.zip_code>
				<cfset session.user.phone = qryUser.phone_no>
			
			<cflocation url="../dashboard.cfm" addtoken="false">
		<cfelse>
			<cflocation url="../login.cfm" addtoken="false">
		</cfif>
	</cfcase>
</cfswitch>