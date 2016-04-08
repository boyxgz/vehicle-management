              <%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="jarvis"/>
<title>车辆借出情况</title>
</head>
<body>
    <div class="content-wrapper">
        <section class="content-header">
				<h1>
					车辆借出情况 <small></small>
				</h1>
				</section>
	<section class="content">
	     <table class="table table-bordered  table-striped">
	        <thead>
	           <tr>
	              <th>名称</th>
	              <th>内容</th>
	           </tr>
	        </thead>
	        <tbody>
	            <tr> 
	               <th>车牌号码</th>
	               <td>${vehicleInUse.vehicle.vehicleNO }</td>
	            </tr>
	            <tr> 
	               <th>车型</th>
	               <td>${vehicleInUse.vehicle.vehicleType }</td>
	            </tr>
	            <tr> 
	               <th>厂牌型号</th>
	               <td>${vehicleInUse.vehicle.vehicleBrand }</td>
	            </tr>
	            <tr> 
	               <th>借出人准驾证</th>
	               <td>${vehicleInUse.drivingPermit.dpNO }</td>
	            </tr>
	            <tr> 
	               <th>借出人姓名</th>
	               <td>${vehicleInUse.drivingPermit.name }</td>
	            </tr>
	            <tr> 
	               <th>借出时间</th>
	               <td><g:formatDate date="${vehicleInUse.borrowTime }" format="yyyy-MM-dd HH:mm"/></td>
	            </tr>
	            <tr> 
	               <th>预计归还时间</th>
	               <td><g:formatDate date="${vehicleInUse.expectReturnTime }" format="yyyy-MM-dd HH:mm"/></td>
	            </tr>
	            <tr> 
	               <th>借车记录人</th>
	               <td>${vehicleInUse.borrowRecordMan }</td>
	            </tr>
	            <tr> 
	               <th>出借事由</th>
	               <td>${vehicleInUse.borrowReason}</td>
	            </tr>
	             <%--<tr> 
	               <th>接车里程数</th>
	               <td>${vehicleInUse.receiveMile}</td>
	            </tr>
	        --%></tbody>
	     </table><%--
	     <dl class="dl-horizontal" style="margin-left:13%;">
	               <dt><label for="branch">
		              <g:message code="label.vehicleInUse.receivePic" default="接车里程数照片 "/>
		              <span class="required-indicator">*</span>
	               </label></dt>
	            <dd>
	                <div class="col-xs-8">
	                     <img src="${createLink(action:'showReceivePic',controller:'vehicleUse',id:vehicleInUse.id)}" class="img-rounded" style="width: 100px; height: 100px;"/>
	                </div>
	            </dd>
	            </dl>
	            --%></section>
    </div>
</body>
</html>