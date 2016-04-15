<%@page import="com.surelution.vms.Vehicle"%>
<%@page import="java.awt.Desktop.Action"%>
<%@page import="org.springframework.stereotype.Controller"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="jarvis"/>
<title>购入车辆管理档案</title>

<style type="text/css">
.tab{ width: 70%; text-align: center;}
.pagination{position: relative; top: 84%; left: 50%;}
</style>
</head>
<body>
     <div class="content-wrapper">
         <section class="content-header">
				<h1>
					车辆管理档案 <small></small>
				</h1>
				</section>
	<section class="content">
<g:if test="${flash.message}">
			<div class="message" role="status" style="color:red; font-weight:bold;">${flash.message}</div>
			</g:if>
		<div class="box box-info">
                <div class="box-header with-border">
                  <h4 class="box-title">车辆查询</h4>
                </div>
                <div class="box-body">
		             <g:form action="list" >
					     <fieldset class="form">
						    <div class="fieldcontain  ">
						     <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.vehicleNO" default="vehicleNO" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                  <input type="text" name="vehicleNO" value="${params.vehicleNO}" class="form-control">
	                               </div>
	                            </dd>
	                        </dl>
	                        <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.vehicleType" default="vehicleType" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                  <input type="text" name="vehicleType" value="${params.vehicleType}" class="form-control">
	                               </div>
	                            </dd>
	                        </dl>
	                         <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.prepairStatus" default="车辆维修状态" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                   <g:select name="status" value="${params.status }" from="${Vehicle.PrerepairStatus.values()}" keys="${Vehicle.PrerepairStatus.values()*.name()}" class="form-control" />
	                               </div>
	                            </dd>
	                        </dl>
						 </div>
						</fieldset>
					
					 <fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: 'Search')}" />
					</fieldset>
					</g:form>
					</div>
					</div>
					
			<h3>车辆列表</h3>
			
			<div>
			<table class="table table-bordered  table-striped">
			    <thead>
				  <tr>
				  	<th>车牌号码</th>
				    <th><g:message code="label.vehicle.vehicleType" default="vehicleType"/></th>
				    <th><g:message code="label.vehicle.vehicleBrand" default="vehicleBrand"/></th>
				    <%--<th><g:message code="label.vehicle.insureEndDate" default="insureEndDate"/></th>--%>
                    <th><g:message code="label.vehicle.recordTime" default="recordTime"/></th>
                     <th><g:message code="label.vehicle.statu" default="statu"/></th>
                    <th>操作</th>
                  </tr>
                 </thead>
               <tbody>
                
                 <g:each in="${vehicleResult }" var="vehicle">
                   <tr>
                   	  <td><g:link action="showVehicleSource" id="${vehicle?.id}">${Vehicle.vehicleNO(vehicle)}</g:link></td>
                      <td>${vehicle?.vehicleType}</td>
                      <td>${vehicle?.vehicleBrand}</td>
                       <%--<td><g:formatDate date="${vehicle.insureEndDate}" format="yyyy-MM-dd"/></td>--%>
                      <td><g:formatDate date="${vehicle.recordTime}" format="yyyy-MM-dd"/></td>
                       <td>${vehicle.statu}</td>
                      <td>
                        <g:if test="${vehicle.vsource.title.equals('购买')}">
                           <g:if test="${vehicle?.transfer?.isTransfer==true}">
                               <span class="btn btn-default btn-sm" style="cursor:auto;">该车辆已经转让</span>
                           </g:if>
                          <g:elseif test="${vehicle?.scrapped?.isScrapped==true}">
                              <span class="btn btn-default btn-sm" style="cursor:auto;">该车辆已经报废</span>
                          </g:elseif>
                           <g:else>
                              <g:link action="showTansfer"  id="${vehicle.id}" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#showTransfer" >转让</g:link>
                              <a href="${createLink(action:'showVehicleScrapped',controller:'manaBuy',id:vehicle.id)}" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#showScrapped" >报废</a>
                           </g:else>
                        </g:if>
                        <g:else>
                           <g:if test="${vehicle?.stopRent?.isStopRent==true}">
                               <span class="btn btn-default btn-sm" style="cursor:auto;">该车已经停止租赁</span>
                           </g:if>
                           <g:else>
                               <a href="${createLink(action:'vehicleStopRent',controller:'manaRent',id:vehicle.id)}" class="btn btn-primary btn-sm">停止租赁</a>
                           </g:else>
                        </g:else>
                      </td>
                   </tr>
                 </g:each>
               </tbody>
			</table>
			</div>
			<div class="pagination">
				<g:paginate total="${vehicleCount}" />
			</div>
			<div class="modal fade" id="showTransfer" role="dialog">
                                 <div class="modal-dialog">
                                     <!-- Modal content-->
                                    <div class="modal-content"> 
                                    </div>
                                 </div>
                             </div>	
                             
                             <div class="modal fade" id="showScrapped" role="dialog">
                                 <div class="modal-dialog">
                                     <!-- Modal content-->
                                    <div class="modal-content"> 
                                    </div>
                                 </div>
                             </div>	
		</section>
		</div>
</body>
</html>