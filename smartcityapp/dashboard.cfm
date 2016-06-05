<cfif NOT structKeyExists(session, "user")>
	<cflocation url="login.cfm" addtoken="false">
</cfif>

<cfinclude template="header.cfm">

<cfquery name="qryUserPost" datasource="#request.dsn#">
	SELECT COUNT(REQUEST_ID) AS pcount 
	FROM REQUEST_DETAILS 
	WHERE USER_ID = <cfqueryparam value="#session.user.user_id#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfquery name="qryCommPost" datasource="#request.dsn#">
	SELECT COUNT(REQUEST_ID) AS ccount 
	FROM REQUEST_DETAILS 
	WHERE USER_ID = <cfqueryparam value="#session.user.user_id#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfquery name="qrySupport" datasource="#request.dsn#">
	SELECT COUNT(SUPPORT_COUNT) AS scount 
	FROM REQUEST_DETAILS 
	WHERE USER_ID = <cfqueryparam value="#session.user.user_id#" cfsqltype="cf_sql_varchar">
</cfquery>

<!--- <cfquery name="qryComments" datasource="#request.dsn#">
</cfquery> --->

    <!--  wrapper -->
    <div id="wrapper">
        <!-- navbar top -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="dashboard.cfm">
                    <img src="assets/img/logo.jpg" alt="" />
                </a>
            </div>
            <!-- end navbar-header -->
            <!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- main dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" href="newrequest.cfm">
                        <span class="top-label label label-warning">New Request</span>  <i class="fa fa-edit fa-3x"></i>
                    </a>
                </li>
				
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="top-label label label-warning">15</span>  <i class="fa fa-bell fa-3x"></i>
                    </a>
                    <!-- dropdown alerts-->
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="notifications.cfm">
                                <div>
                                    <i class="fa fa-thumbs-up fa-fw"></i>Support On Your Posts
                                    <span class="pull-right text-muted small">4 Ticket(s)</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="notifications.cfm">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i>Comment On Your Posts
                                    <span class="pull-right text-muted small">4 Ticket(s)</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="notifications.cfm">
                                <div>
                                    <i class="fa fa-heart fa-fw"></i>Support On Supports
                                    <span class="pull-right text-muted small">4 Ticket(s)</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="notifications.cfm">
                                <div>
                                    <i class="fa fa-comments fa-fw"></i>Comment On Supports
                                    <span class="pull-right text-muted small">4 Ticket(s)</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="notifications.cfm">
                                <strong>See All Notifications</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- end dropdown-alerts -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-3x"></i>
                    </a>
                    <!-- dropdown user-->
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="profile.cfm"><i class="fa fa-user fa-fw"></i>User Profile</a>
                        </li>
                        <li><a href="activity.cfm"><i class="fa fa-flask fa-fw"></i>User Activity</a>
                        </li>
                        <li><a href="changepassword.cfm"><i class="fa fa-gear fa-fw"></i>Change Password</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="controller/page_action.cfm?action=logout"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
                        </li>
                    </ul>
                    <!-- end dropdown-user -->
                </li>
                <!-- end main dropdown -->
            </ul>
            <!-- end navbar-top-links -->

        </nav>
        <!-- end navbar top -->

        <!-- navbar side -->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <!-- sidebar-collapse -->
            <div class="sidebar-collapse">
                <!-- side-menu -->
                <ul class="nav" id="side-menu">
                    <li>
                        <!-- user image section-->
                        <div class="user-section">
                            <div class="user-section-inner">
                                <img src="assets/img/user.jpg" alt="">
                            </div>
                            <div class="user-info">
                                <div>User Name</div>
                                <div class="user-text-online">
                                    Online
                                </div>
                            </div>
                        </div>
                        <!--end user image section-->
                    </li>
					<!--
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </li>
					-->
                    <li class="selected">
                        <a href="dashboard.cfm"><i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="activity.cfm"><i class="fa fa-flask fa-fw"></i>My Activity</a>
                    </li>
                    <li>
                        <a href="requests.cfm"><i class="fa fa-table fa-fw"></i>Requests</a>
                    </li>
                    <li>
                        <a href="clusters.cfm"><i class="fa fa-bar-chart-o fa-fw"></i>Clusters</a>
                    </li>
					<li>
						<a href="supportedrequests.cfm"><i class="fa fa-list fa-fw"></i>Supported Requests</a>
					</li>
					<li>
						<a href="notifications.cfm"><i class="fa fa-bell fa-fw"></i>Notifications</a>
					</li>
					<!--
					<li>
						<a href="search.cfm"><i class="fa fa-search fa-fw"></i>Search Page</a>
					</li>
					-->
					<li>
						<a href="newrequest.cfm"><i class="fa fa-edit fa-fw"></i>New Request</a>
					</li>
                </ul>
                <!-- end side-menu -->
            </div>
            <!-- end sidebar-collapse -->
        </nav>
        <!-- end navbar side -->
        <!--  page-wrapper -->
        <div id="page-wrapper">

            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!--End Page Header -->
            </div>

            <div class="row">
                <!-- Welcome -->
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-list"></i><b>&nbsp;Hello ! </b>Welcome Back <b>User Name </b>
 <i class="fa  fa-pencil"></i><b>&nbsp;Count </b>requests are pending and waiting your suport.
                    </div>
                </div>
                <!--end  Welcome -->
            </div>

			<cfoutput>
            <div class="row">
                <!--quick info section -->
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-pencil fa-3x"></i>&nbsp;<a href="requests.cfm"><b>#qryUserPost.pcount# </b>Posts from you</a>

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-success text-center">
                        <i class="fa  fa-pencil-square fa-3x"></i>&nbsp;<a href="supportedrequests.cfm"><b>#qryCommPost.ccount# </b>Posts you supported</a>  
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-heart fa-3x"></i>&nbsp;<a href="notifications.cfm"><b>#qrySupport.scount# </b>Supports on your posts</a>

                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="alert alert-warning text-center">
                        <i class="fa  fa-comment fa-3x"></i>&nbsp;<a href="notifications.cfm"><b>23 </b>Comments on your posts</a>
                    </div>
                </div>
                <!--end quick info section -->
            </div>
			</cfoutput>

            <div class="row">
                <div class="col-lg-8">



                    <!--Area chart example -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>Area Chart Example
                            
                        </div>

                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>

                    </div>
                    <!--End area chart example -->

                </div>
				
				<div class="col-lg-4">
                    <!-- Notifications-->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i>Notifications Panel
                        </div>

                        <div class="panel-body">
                            <div class="list-group">
                                <a href="notifications.cfm" class="list-group-item">
                                    <i class="fa fa-thumbs-up fa-fw"></i>Support On Your Posts
                                    <span class="pull-right text-muted small"><em>9 Ticket(s)</em></span>
                                </a>
                                <a href="notifications.cfm" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i>Comment On Your Posts
                                    <span class="pull-right text-muted small"><em>4 Ticket(s)</em></span>
                                </a>
                                <a href="notifications.cfm" class="list-group-item">
                                    <i class="fa fa-heart fa-fw"></i>Support On Supports
                                    <span class="pull-right text-muted small"><em>12 Ticket(s)</em></span>
                                </a>
                                <a href="notifications.cfm" class="list-group-item">
                                    <i class="fa fa-comments fa-fw"></i>Comment On Supports
                                    <span class="pull-right text-muted small"><em>4 Ticket(s)</em></span>
                                </a>
                                <a href="requests.cfm" class="list-group-item">
                                    <i class="fa fa-pencil fa-fw"></i>Your Posts
                                    <span class="pull-right text-muted small"><em>7 Ticket(s)</em></span>
                                </a>
                                <a href="supportedrequests.cfm" class="list-group-item">
                                    <i class="fa fa-pencil-square fa-fw"></i>Your Supports
                                    <span class="pull-right text-muted small"><em>13 Ticket(s)</em></span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                            <a href="activity.cfm" class="btn btn-default btn-block">View Your Activity Page</a>
                        </div>

                    </div>
                    <!--End Notifications-->
                </div>
				
            </div>
			
        </div>
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->

<cfinclude template="footer.cfm">