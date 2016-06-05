<cfinclude template="header.cfm">

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
                                    <span class="pull-right text-muted small">12 Ticket(s)</span>
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
                        <li><a href="login.cfm"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
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
                    <li>
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
					<li class="selected">
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
			<form>
			<div class="row">
                 <!-- Page header-->
                <div class="col-lg-12">
                    <h1 class="page-header">Password Management</h1>
                </div>
                 <!--End Page header-->
            </div>
            <div class="row">
                <div class="col-lg-12">
                     <!-- Default Buttons-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Change Password
                        </div>
                        <div class="panel-body">
							<table width="100%">
								<tr class="tr50">
									<td width="50%">										
										<table width="100%">
											<tr class="tr50">
												<td class="td40">
													Old Password*
												</td>
												<td class="td60">
													<input type="text" class="txt" name="oldpassword" placeholder="Old Password" maxlength="16">
												</td>
											</tr>
											<tr class="tr50">
												<td class="td40">
													New Password*
												</td>
												<td class="td60">
													<input type="text" class="txt" name="newpassword" placeholder="New Password" maxlength="16">
												</td>
											</tr>
											<tr class="tr50">
												<td class="td40">
													Confirm Password*
												</td>
												<td class="td60">
													<input type="text" class="txt" name="confirmpassword" placeholder="Confirm Password" maxlength="16">
												</td>
											</tr>
											<tr class="tr50">
												<td colspan="2" class="td" align="center">
													<button type="submit" class="btn btn-success">SignUp</button>
													<button type="reset" class="btn btn-warning">Reset</button>
												</td>
											</tr>
										</table>
									</td>
									<td width="50%">										
										<table width="100%">
											<tr class="tr50">
												<td class="td">
													<b>Password Suggesion</b>
													<hr>
													<i>It should meet the following criterias-</i>
													<ul>
													<li>Password Length: 8 Char to 16 Char</li>
													<li>Should Comtain a Capetal Letter</li>
													<li>Should Comtain a Lower Letter</li>
													<li>Should Comtain a Special Charecter</li>
													</ul>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							
                        </div>
                    </div>
                     <!-- End Default Buttons-->
                </div>
            </div>
			</form>
		</div>
        <!-- end page-wrapper -->

    </div>
    <!-- end wrapper -->

<cfinclude template="footer.cfm">
