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
					车辆管理档案 <small></small>
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
	               <th><g:message code="label.vehicle.vehicleNO" default="vehicleNO"/></th>
	               <td>${vehicleSource.vehicleNO}</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.vehicleType" default="vehicleType"/></th>
	               <td>${vehicleSource.vehicleType}</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.vehicleBrand" default="vehicleBrand"/></th>
	               <td>${vehicleSource.vehicleBrand}</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.vehicleModel" default="vehicleModel"/></th>
	               <td>${vehicleSource.vehicleModel}</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.price" default="price"/></th>
	               <td>${vehicleSource.price}</td>
	            </tr>
	             <tr>
	               <th><g:message code="label.vehicle.title" default="title"/></th>
	               <td>${vehicleSource.vsource.title }</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.manufacturer" default="manufacturer"/></th>
	               <td>${vehicleSource.vsource.manufacturer}</td>
	            </tr>
	            <tr>
	               <th><g:message code="label.vehicle.insureEndDate" default="insureEndDate"/></th>
	                <td><g:formatDate date="${vehicleSource.insureEndDate}" format="yyyy-MM-dd"/></td>
	            </tr>
	            <g:if test="${vehicleSource.vsource.title=='购买' }">
	            	<tr>
		               <th><g:message code="label.vehicle.gotDateBuy" default="gotDateBuy"/></th>
		               <td><g:formatDate date="${vehicleSource.vsource.gotDate }" format="yyyy-MM-dd"/></td>
		            </tr>
	                 <tr>
	                    <th><g:message code="label.vehicle.buyMan" default="buyMan"/></th>
	                    <td>${vehicleSource.vsource.buyMan}</td>
	                 </tr>
	                 
	                 <g:if test="${vehicleSource?.transfer?.isTransfer==true}">
	                     <tr>
	                        <th><g:message code="label.vehicle.transferDate" default="transferDate"/></th>
	                        <td><g:formatDate date="${vehicleSource.transfer?.transferDate}" format="yyyy-MM-dd"/></td>
	                     </tr>
	                     <tr>
	                        <th><g:message code="label.vehicle.transferMan" default="transferMan"/></th>
	                        <td>${vehicleSource.transfer?.transferMan}</td>
	                     </tr>
	                     <tr>
	                        <th><g:message code="label.vehicle.transferReason" default="transferReason"/></th>
	                        <td>${vehicleSource.transfer?.transferReason}</td>
	                     </tr>
	                      <tr>
	                        <th><g:message code="label.vehicle.money" default="money"/></th>
	                        <td>${vehicleSource.transfer?.money}</td>
	                     </tr>
	                      <tr>
	                        <th><g:message code="label.vehicle.contractNO" default="contractNO"/></th>
	                        <td>${vehicleSource.transfer?.contractNO}</td>
	                     </tr>
	                 </g:if>
	                 
	                 <g:if test="${vehicleSource?.scrapped?.isScrapped==true}">
	                      <tr>
	                        <th><g:message code="label.vehicle.scrapTime" default="scrapTime"/></th>
	                        <td><g:formatDate date="${vehicleSource.scrapped?.scrapTime}" format="yyyy-MM-dd"/></td>
	                     </tr>
	                 </g:if>
	            </g:if>
	            <g:if test="${vehicleSource.vsource.title=='租赁' }">
	            	<tr>
		               <th><g:message code="label.vehicle.gotDateRent" default="gotDateRent"/></th>
		               <td><g:formatDate date="${vehicleSource.vsource.gotDate }" format="yyyy-MM-dd"/></td>
		            </tr>
	                 <tr>
	                    <th><g:message code="label.vehicle.rentTo" default="rentTo"/></th>
	                    <td><g:formatDate date="${vehicleSource.vsource.rentTo }" format="yyyy-MM-dd"/></td>
	                 </tr>
	                 <tr>
	                    <th><g:message code="label.vehicle.rentMan" default="rentMan"/></th>
	                    <td>${vehicleSource.vsource.rentMan }</td>
	                 </tr>
	                 
	                 <g:if test="${vehicleSource.stopRent?.isStopRent==true}">
	                    <tr>
	                    <th><g:message code="label.vehicle.stopRentTime" default="stopRentTime"/></th>
	                    <td><g:formatDate date="${vehicleSource.stopRent.stopRentTime}" format="yyyy-MM-dd"/></td>
	                 </tr>
	                 </g:if>
	            </g:if>
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
	             <g:if test="${vehicleSource.vsource.title=='购买' }">
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
	            </g:if>
	            
	            <g:if test="${vehicleSource.vsource.title=='租赁' }">
	             <dl class="dl-horizontal" style="margin-left:10%;">
	               <dt><label for="branch">
		              <g:message code="label.vehicle.vsource1" default="vehicleSourcePic "/>
		              <span class="required-indicator">*</span>
	               </label></dt>
	            <dd>
	                <div class="col-xs-8">
	                     <img src="${createLink(action:'showRentPhoto',controller:'manaRent',id:vehicleSource.vsource.id)}" class="img-rounded" style="width: 100px; height: 100px;"/>
	                </div>
	            </dd>
	            </dl>
	            </g:if>
	            
	            </section>
    </div>
</body>
</html>