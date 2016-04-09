<!DOCTYPE html>
<html>
<head>
<r:layoutResources />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>公车管理系统</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'logo.png')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'logo.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'logo.png')}">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'AdminLTE.min.css')}">
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'skin-blue.min.css')}">
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap.css">
<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script src="${resource(dir:'js',file:'jquery.js') }"></script>
<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'all.css') }">
<script src="${resource(dir:'jarvis/js',file:'app.min.js') }"></script>
<link rel="stylesheet" href="${resource(dir:'jarvis/css',file:'bootstrap-datetimepicker.min.css') }">
<script src="${resource(dir:'jarvis/js',file:'bootstrap-datetimepicker.min.js') }"></script>
<script src="${resource(dir:'jarvis/js',file:'bootstrap-datetimepicker.zh-CN.js') }"></script>
<script src="${resource(dir:'jarvis/js',file:'jquery-ui.min.js') }"></script>
<script src="${resource(dir:'jarvis/js',file:'jquery.cookie.js') }"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <g:layoutHead/>
  
  <style type="text/css">
     .current{ font-weight:bold}
  </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
         $(".treeview-menu li a").click(function(){
            	   $.cookie("navstation", $(this).html(), { path: "/" });           	   
             })
        })
</script>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
            <!-- Logo -->
			<a href="" class="logo" style="background-color:#3C8DBC"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini" style="background-color:#3C8DBC"><b></b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg" style="background-color:#3C8DBC"><b></b></span>
			</a>
			
			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				
				<div style="float: left; color: white; line-height: 100%; margin-left: 30%;"><h4 style="font-size:24px;">公车管理系统
				   </h4></div>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
				   
					<ul class="nav navbar-nav sidebar-menu">				
						<li class="dropdown user user-menu treeview" id="alink">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
              <span class="hidden-xs" style="font-size:16px;">当前用户：<sec:username /></span>
            </a>
            <ul class="dropdown-menu" id="dropdown-menu"> 
              <li class="user-header">
                <p><small>公车管理系统</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                 <g:link controller="user" action="updatepassword" class="btn btn-default btn-flat">修改密码</g:link>
                </div>
                
                <div class="pull-right">
                  <g:link controller="logout" class="btn btn-default btn-flat">退出登录</g:link>
                </div>
              </li>
            </ul>
          </li>
								
						<!-- Control Sidebar Toggle Button -->
						<%--<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					--%></ul>
				</div>
			</nav>
		</header>
		
		<aside class="main-sidebar">			
			<section class="sidebar">				
				<ul class="sidebar-menu">
					<%--<li class="header"></li>		
					
					--%><!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa  fa-map"></i>
							<span>车辆使用</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="vehicleUse" action="show">借车</g:link></li>
				            <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="vehicleUse" action="returnVehicle">还车</g:link></li>
						</ul></li>
					<!-- 一个导航链接结束 -->
					
					<%--<!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa  fa-hand-stop-o (alias)"></i>
							<span>车辆维保</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="ManaMantain" action="showMantain">常规保养</g:link></li>
			                <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="warningRuleToBranchCustomer">报修登记</g:link></li>
			                <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="warningRule" action="listBaseStockWarning">送修登记</g:link></li> 
			               <li><a href="#" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="salesOrder" action="changeFMstatusOpen">维修完结</g:link></li>     
						   <li><a href="#" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="salesOrder" action="changeFMstatusOpen">年检登记</g:link></li>
							<li><a href="#" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="salesOrder" action="changeFMstatusOpen">年检查询</g:link></li>
						</ul></li>
					<!-- 一个导航链接结束 -->
					
					<!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa fa-ambulance"></i>
							<span>车险理赔</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="salesOrder" action="listNewCustomerCount">登记车辆投保</g:link></li>
			                <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="customerVisting" action="list">投保续保提醒</g:link></li>
			                <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="customerVisting" action="list">车辆投保查询</g:link></li>
			                 <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="customer">登记车辆报险记录</g:link></li>
			                <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="customer">登记车辆理赔记录</g:link></li>
			                 <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="customer">登记车辆事故记录</g:link></li>
						</ul></li>
					<!-- 一个导航链接结束 -->
					
					--%><!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa fa-share"></i>
							<span>行车违章</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">												          
					            <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="VehicleIllgleMenagement" action="checkIn">车辆违章登记</g:link></li>
					            <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="VehicleIllgleMenagement" action="dispose">违章处理</g:link></li> 
					            <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="VehicleIllgleMenagement" action="list">违章列表</g:link></li>                    
						</ul></li>
					<!-- 一个导航链接结束 -->
					
					<!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa  fa-gear (alias)"></i>
							<span>准驾证管理</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="drivingPermitManagement" action="driviLicense">准驾证管理</g:link></li>
				            <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="drivingPermitManagement" action="checkin">准驾证核发</g:link></li>
							<%--<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="drivingPermitManagement" action="postpone">准驾证延期</g:link></li>
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="drivingPermitManagement" action="revoke">准驾证吊销</g:link></li>--%>
						</ul></li>
					<!-- 一个导航链接结束 -->
								
					<!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa fa-car"></i>
							<span>车辆管理</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="manaBuy" action="list">车辆管理</g:link></li>
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="manaBuy" action="showVehicle">购入车辆信息录入</g:link></li>
							<li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="manaRent" action="showVehicle">租赁车辆信息录入</g:link></li>
							<%--<li><a href="#" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="salesOrder" action="listApprove">车辆报废</g:link></li>
							<li><a href="#" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="salesOrder" action="changeFMstatusClose">车辆转让</g:link></li>
							<li><a href="#" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="salesOrder" action="changeFMstatusClose">停止租赁</g:link></li>--%>
						</ul></li>
					<!-- 一个导航链接结束 -->
					
					<!-- 一个导航链接开始 -->
					<li class="treeview"><a href="#"><i class="fa fa-asterisk"></i>
							<span>系统设置</span> <i class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">							
				                <li><a href="" style="float:left;"><i class="fa fa-circle-thin"></i></a><g:link controller="user">用户管理</g:link></li>
						</ul></li>
					<!-- 一个导航链接结束 -->
					
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>
 <g:layoutBody/>
 
				
		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs"></div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2016 <a href="http://www.sh-hansi.com" target="_blank">上海悍思企业管理咨询有限公司</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<%--<aside class="control-sidebar control-sidebar-dark">
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					这里显示的是设置按钮的内容
					
				</div>
		   </div>
		</aside>
		--%><!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.1.4 -->
	<br>
	<script type="text/javascript">
         var navstation = $.cookie("navstation");
        if(navstation != null){
            $(".treeview-menu li a").each(function(){
            if($(this).html() == navstation){
               $(this).parent().parent().css("display","block");   
             //  $(".treeview-menu li a").removeClass("current")
               $(this).addClass("current")
               $(this).css("color","white")
        }
    });
}
</script>
</body>
</html>
