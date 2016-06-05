<cfcomponent displayname="login" hint="Updates user login and logout sessions">

<cffunction name="SetUserLogin" access="public" returntype="void" hint="">
	<cfargument name="userId" type="string" required="true">
	<cfargument name="action" type="string" required="true">
	<cfargument name="status" type="string" required="false" default="">
	
	<cfquery name="qrySelUser"  datasource="#request.dsn#">
		SELECT 	COUNT(*) AS cnt
		FROM 	#request.schema#.USER_LOGIN_DATA
		WHERE 
				USER_ID = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
	</cfquery>
	
	<cfif qrySelUser.cnt GT 0>
		<cfquery name="qryUserLogin" datasource="#request.dsn#">
			UPDATE 
					#request.schema#.USER_LOGIN_DATA
			SET 
					<cfif arguments.action EQ 'login'>
					LOGIN_TIME = SYSDATE,
					LOGOUT_TIME = NULL
					<cfelseif arguments.action EQ 'logout'>
					LOGOUT_TIME = SYSDATE
					</cfif>
			WHERE 
					USER_ID = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
		</cfquery>
	<cfelse>
		<cfquery name="qryUserLogin" datasource="#request.dsn#" result="res">
			INSERT INTO 
					#request.schema#.USER_LOGIN_DATA
					(
						USER_ID,
						<cfif arguments.action EQ 'login'>
						LOGIN_TIME,
						LOGOUT_TIME,
						<cfelse>
						LOGOUT_TIME,
						</cfif>
						STATUS
					)
			VALUES	(
						<cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">,
						<cfif arguments.action EQ 'login'>
						SYSDATE,
						NULL,
						'ACTIVE'
						<cfelseif arguments.action EQ 'logout'>
						SYSDATE,
						NULL
						</cfif>
					)
		</cfquery>
	</cfif>
</cffunction>

</cfcomponent>