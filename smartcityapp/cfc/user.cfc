<cfcomponent displayname="user" hint="Manages user actions like add, update actions and gets user info.">
	
<cffunction name="GetUserLoginInfo" returntype="query" access="public" hint="Returns basic user info from db in query format, by email and password.">
	<cfargument name="email" type="string" required="true">
	<cfargument name="password" type="string" required="true">
	<cfscript>
		var qryUserInfo = "";
		var basicColumnList = "ud.USER_ID, ud.FIRST_NAME, ud.LAST_NAME, ud.EMAIL_ID, ud.zip_code, ud.PHONE_NO";
		
		qryUserInfo = GetUser(
			email = arguments.email,
			password = arguments.password,
			columnList = basicColumnList
		);
		
		return qryUserInfo;
	</cfscript>
</cffunction>

<cffunction name="SetUser" returntype="string" access="public" hint="Returns full user info from db in query format.">
	<cfargument name="email" type="string" required="true">
	<cfargument name="password" type="string" required="true">
	<cfargument name="firstName" type="string" required="true">
	<cfargument name="lastName" type="string" required="true">
	<cfargument name="dob" type="date" required="true">
	<cfargument name="gender" type="string" required="true">
	<cfargument name="occupation" type="string" required="false" default="">
	<cfargument name="phone" type="string" required="false" default="">
	<cfargument name="userId" type="string" required="false" default="">
	<cfargument name="status" type="string" required="false" default="">
	<cfargument name="rating" type="numeric" required="false" default="0">
	<cfargument name="organization" type="string" required="false" default="">
	<cfargument name="area" type="string" required="false" default="">
	<cfargument name="city" type="string" required="false" default="">
	<cfargument name="zipCode" type="string" required="false" default="">
	<cfargument name="country" type="string" required="false" default="">
	<cfargument name="createdby" type="string" required="false" default="">
	<cfargument name="lastModifiedBy" type="string" required="false" default="">
	<cfscript>
		var usrId = "";
		
		if(len(arguments.userId) EQ 0)
		{
			usrId = createUser(
				email = arguments.email,
				password = arguments.password,
				firstName = arguments.firstName,
				lastName = arguments.lastName,
				dob = arguments.dob,
				gender = arguments.gender,
				occupation = arguments.occupation,
				phone = arguments.phone,
				organization = arguments.organization,
				area = arguments.area,
				city = arguments.city,
				zipCode = arguments.zipCode,
				country = arguments.country
			);
		}
		
		return usrId;
	</cfscript>
</cffunction>

<cffunction name="createUser" returntype="string" access="public" hint="creates new user in system.">
	<cfargument name="email" type="string" required="true">
	<cfargument name="password" type="string" required="true">
	<cfargument name="firstName" type="string" required="true">
	<cfargument name="lastName" type="string" required="true">
	<cfargument name="dob" type="date" required="true">
	<cfargument name="gender" type="string" required="true">
	<cfargument name="occupation" type="string" required="false" default="">
	<cfargument name="phone" type="string" required="false" default="">
	<cfargument name="organization" type="string" required="false" default="">
	<cfargument name="area" type="string" required="false" default="">
	<cfargument name="city" type="string" required="false" default="">
	<cfargument name="zipCode" type="string" required="false" default="">
	<cfargument name="country" type="string" required="false" default="">
	<cfscript>
		var qryNextVal = "";
		var qryUserInsert = "";
		var nextUserId = "";
	</cfscript>
	
	<cfquery name="qryNextVal" datasource="#request.dsn#">
		SELECT 	#request.schema#.USER_SEQ.NEXTVAL 	AS newID
		FROM dual
	</cfquery>
	
	<cfset nextUserId = qryNextVal.newID>
	
	<cftransaction>
		<cfquery name="qryUserInsert" datasource="#request.dsn#">
			INSERT INTO #request.schema#.USER_DETAILS(
				USER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, USER_GENDER, USER_OCCUPATION, PHONE_NO, EMAIL_ID, USER_ORGANIZATION, AREA, CITY, ZIP_CODE, 
				COUNTRY, CREATED_DATE
			)
			VALUES
			(
				<cfqueryparam value="#nextUserId#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.firstName)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.lastName)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.dob)#" cfsqltype="cf_sql_date">,
				<cfqueryparam value="#trim(arguments.gender)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.occupation)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.phone)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.email)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.organization)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.area)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.city)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.zipCode)#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.country)#" cfsqltype="cf_sql_varchar">,
				SYSDATE
			)
		</cfquery>
		
		<cfquery name="qryUserInsert" datasource="#request.dsn#">
			INSERT INTO #request.schema#.USER_LOGIN(
				USER_ID, PASS, STATUS, CREATED_DATE
			)
			VALUES
			(
				<cfqueryparam value="#nextUserId#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#trim(arguments.password)#" cfsqltype="cf_sql_varchar">,
				'active',
				SYSDATE
			)
		</cfquery>
	</cftransaction>
	
	<cfreturn nextUserId>
</cffunction>

<cffunction name="GetUser" returntype="query" access="public" hint="Returns full user info from db in query format.">
	<cfargument name="email" type="string" required="false" default="">
	<cfargument name="password" type="string" required="false" default="">
	<cfargument name="userId" type="string" required="false" default="">
	<cfargument name="status" type="string" required="false" default="">
	<cfargument name="columnList" type="string" required="false" default="">
	<cfargument name="orderBy" type="string" required="false" default="">
	<cfscript>
		var qryUser = "";
		var fullColumnList = "ud.USER_ID,ud.FIRST_NAME,ud.LAST_NAME,ud.DATE_OF_BIRTH,ud.USER_GENDER,ud.USER_OCCUPATION,ud.PHONE_NO,ud.EMAIL_ID,ud.USER_RATING,ud. USER_ORGANIZATION,ud.AREA,ud.CITY,ud.ZIP_CODE,ud.COUNTRY,ud.CREATED_DATE,ud.CREATED_BY,ud.LAST_MODIFIED_BY,ud.LAST_MODIFIED_DATE";
	</cfscript>

	<cfquery name="qryUser" datasource="#request.dsn#">
		SELECT
				<cfif len(arguments.columnList)>
					#arguments.columnList#
				<cfelse>
					#fullColumnList#
				</cfif>
		FROM
				#request.schema#.USER_DETAILS ud
		JOIN 	#request.schema#.USER_LOGIN ul ON 	ul.user_id = ud.user_id
		WHERE
				1 = 1
		<cfif len(arguments.email)>
		AND 	ud.EMAIL_ID = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
		</cfif>
		<cfif len(arguments.password)>
		AND 	ul.PASS = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
		</cfif>
		<cfif len(arguments.userId)>
		AND 	ud.USER_ID = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
		</cfif>
		<cfif len(arguments.status)>
		AND 	ul.STATUS = <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_varchar">
		<cfelse>
		AND 	lower(ul.STATUS) = 'active'
		</cfif>
		<cfif len(arguments.orderBy)>
		ORDER BY 	#arguments.orderBy#
		</cfif>
	</cfquery>
	
	<cfreturn qryUser>
</cffunction>

</cfcomponent>