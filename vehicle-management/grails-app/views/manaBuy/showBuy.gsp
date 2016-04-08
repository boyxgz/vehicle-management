<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="jarvis"/>
<title>车辆详细信息列表</title>
</head>
<body>
    <div class="content-wrapper">
        <section class="content-header">
				<h1>
					购入车辆管理档案 <small></small>
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
	               <th><g:message code="label.vehicle.vOwner" default="vOwner"/></th>
	               <td> ${vehicleSource.vOwner}</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.recordTime" default="recordTime"/></th>
	               <td> ${vehicleSource.recordTime }</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.status" default="status"/></th>
	               <td>  ${vehicleSource.status }</td>
	            </tr>
	            <tr>
	               <th> <g:message code="label.vehicle.vehicleType" default="vehicleType"/></th>
	               <td> ${vehicleSource.vehicleType }</td>
	            </tr>
	            <tr>
	               <th> <g:message code="label.vehicle.price" default="price"/></th>
	               <td>${vehicleSource.price }</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.vehicleModel" default="vehicleModel"/></th>
	               <td> ${vehicleSource.vehicleModel }</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.vehicleNO" default="vehicleNO"/></th>
	               <td>${vehicleSource.vehicleNO }</td>
	            </tr>
	            <tr>
	               <th> <g:message code="label.vehicle.manufacturer" default="manufacturer"/></th>
	               <td> ${vehicleSource.vsource.manufacturer }</td>
	            </tr>
	             <tr>
	               <th>  <g:message code="label.vehicle.buyMan" default="buyMan"/></th>
	               <td>  ${vehicleSource.vsource.buyMan }</td>
	            </tr>
	             <tr>
	               <th>  <g:message code="label.vehicle.title" default="title"/></th>
	               <td>  ${vehicleSource.vsource.title }</td>
	            </tr>
	             <tr>
	               <th>  <g:message code="label.vehicle.gotDate" default="gotDate"/></th>
	               <td>  ${vehicleSource.vsource.gotDate }</td>
	            </tr>
	        </tbody>
	     
	     </table>
	         
	          <dl class="dl-horizontal" style="margin-left:10%;">
	               <dt><label for="branch">
		              <g:message code="label.vehicle.vehiclePtot" default="vehiclePhoto" />
		              <span class="required-indicator">*</span>
	               </label></dt>
	            <dd>
	                <div class="col-xs-8">
	                     <img src="${createLink(action:'showPic',controller:'manaBuy',id:vehicleSource.id)}" class="img-rounded" style="width: 100px; height: 100px;"/>
	                </div>
	            </dd>
	            </dl>
	             <dl class="dl-horizontal" style="margin-left:10%;">
	               <dt><label for="branch">
		              <g:message code="label.vehicle.vsource" default="vehicleSourcePic "/>
		              <span class="required-indicator">*</span>
	               </label></dt>
	            <dd>
	                <div class="col-xs-8">
	                     <img src="${createLink(action:'showBillPhoto',controller:'manaBuy',id:vehicleSource.vsource.id)}" class="img-rounded" style="width: 100px; height: 100px;"/>
	                </div>
	            </dd>
	            </dl>
	            
	            <dl class="dl-horizontal" style="margin-left:10%;">
	               <dt>操作</dt>
	            <dd>
	                <div class="col-xs-8">
	                    <a href="${createLink(action:'deleteVehicle',controller:'manaBuy',id:vehicleSource.id) }" onclick="return confirm('${message(code: 'default.confirm.message', default: 'Are you sure?')}');"><input type="button" class="btn btn-primary" value="删除站点"></a>&nbsp;&nbsp;
		 <g:link  data-toggle="modal" data-target="#edit">
		          <input type="button" class="btn btn-primary" value="更新站点">   
		 </g:link>
				<div class="modal fade" id="edit" role="dialog">
                        <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                                
                           </div>
                          </div>
                      </div>	
	                </div>
	            </dd>
	            </dl>
	</section>
    </div>
</body>
</html>