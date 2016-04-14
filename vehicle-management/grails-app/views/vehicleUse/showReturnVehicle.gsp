<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="jarvis"/>
<title>车辆归还情况</title>
</head>
<body>
    <div class="content-wrapper">
        <section class="content-header">
				<h1>
					车辆归还情况 <small> <a href="${createLink(action:'returnVehicle',controller:'vehicleUse')}" class="btn btn-default">还车登记表</a></small>
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
	               <td>${vehicleInUse.vehicle.province.name }${vehicleInUse.vehicle.areaCode }${vehicleInUse.vehicle.no }</td>
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
	               <th>准驾证</th>
	               <td>${vehicleInUse.drivingPermit.dpNO }</td>
	            </tr>
	            <tr> 
	               <th>驾驶员</th>
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
	               <th>借出记录人</th>
	               <td>${vehicleInUse.borrowRecordMan }</td>
	            </tr>
	            <tr> 
	               <th>出借原因</th>
	               <td>${vehicleInUse.borrowReason }</td>
	            </tr>
	            <tr> 
	               <th>归还时间</th>
	               <td><g:formatDate date="${vehicleInUse.returnTime }" format="yyyy-MM-dd HH:mm"/></td>
	            </tr>
	            <tr> 
	               <th>归还记录人</th>
	               <td>${vehicleInUse.returnRecordMan }</td>
	            </tr>
	            <tr> 
	               <th>接车里程数</th>
	               <td>${vehicleInUse.receiveMile}</td>
	            </tr>
	            <tr> 
	               <th>交车里程数</th>
	               <td>${vehicleInUse.returnMile}</td>
	            </tr>
	            <tr>
	               <th>车辆是否延期</th>
	               <td>
	                  <g:if test="${vehicleInUse.isDelay==true}">是</g:if>
	                  <g:else>否</g:else>
	               </td>
	            </tr>
	            <tr>
	               <th>延期理由</th>
	               <td>${vehicleInUse.delayReason}</td>
	            </tr>
	        </tbody>
	     </table>
	        
	        <%--<dl class="dl-horizontal" style="margin-left:13%;">
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
	            
	            <dl class="dl-horizontal" style="margin-left:13%;">
	               <dt><label for="branch">
		              <g:message code="label.vehicleInUse.returnPic" default="交车里程数照片 "/>
		              <span class="required-indicator">*</span>
	               </label></dt>
	            <dd>
	                <div class="col-xs-8">
	                     <img src="${createLink(action:'showReturnPic',controller:'vehicleUse',id:vehicleInUse.id)}" class="img-rounded" style="width: 100px; height: 100px;"/>
	                </div>
	            </dd>
	            </dl>
	            --%></section>
    </div>
</body>
</html>