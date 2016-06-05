<cfcomponent displayname="request">

<cffunction name="GetUserRequest" access="public" returntype="query" hint="">
	<cfargument name="userId" type="string" required="true">
	<cfscript>
		var qryReq = "";
	</cfscript>
	
	<cfquery name="qryReq" datasource="#request.dsn#">
		SELECT REQ.REQUEST_ID, REC.CATEGORY_NAME, RSC.SUB_CATEGORY_NAME, REQ.POST_DATE, REQ.STATUS, COUNT(SUPPORT_COUNT) NO_OF_SUPPORT, CATEGORY_RANK
		FROM REQUEST_DETAILS REQ, REQ_CATEGORY REC, REQ_SUB_CATEGORY RSC
		WHERE REQ.CATEGORY_ID = REC.CATEGORY_ID
		AND REC.CATEGORY_ID = RSC.CATEGORY_ID
		AND REQ.USER_ID = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_varchar">
		GROUP BY REQ.REQUEST_ID, REC.CATEGORY_NAME, RSC.SUB_CATEGORY_NAME, REQ.POST_DATE, REQ.STATUS, CATEGORY_RANK
	</cfquery>
	
	<cfreturn qryReq>
</cffunction>

<!--- <cffunction name="SetUserRequest" access="public" returntype="string" hint="">
	<cfquery>
	INSERT
	</cfquery>
</cffunction> --->

</cfcomponent>