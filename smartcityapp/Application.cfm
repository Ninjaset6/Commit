
<cfapplication 
	name="smartcityapp"
	applicationTimeout="#CreateTimespan(0,1,0,0)#"
	sessionManagement="true"
	sessionTimeout="#CreateTimespan(0,0,30,0)#"
	clientManagement="true"
>
<!--- Add dsn name here --->
<cfset request.dsn = "hackdsn">
<cfset request.schema = "raushan">

<!--- <cfif NOT structKeyExists(session, "user")>
	<!--- <cfinclude template="login.cfm"> --->
	<cflocation url="login.cfm">
</cfif> --->