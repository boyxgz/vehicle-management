<%@ page import="com.surelution.vms.Vehicle"%>
<%@ page import="com.surelution.vms.VehicleInUse"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>借车信息记录</title>
<style>
	.location{ position: absolute; width: 200px; top: 105px; left: 91px;}
</style>
</head>
<body>
	<div class="body">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					还车登记 <small></small>
				</h1>
			</section>
			<section class="content">
			   <div class="box box-info">
                  <div class="box-header with-border">
                     <h4 class="box-title">请将准驾证放置在读卡器上或者输入准驾证号</h4>
                  </div>
                  <div class="box-body">
                  <g:form action="returnVehicle">
                      <dl class="dl-horizontal" style="margin-left:-80px;">
                            <dt><label for="branch">
							        <g:message code="label.vehicle.carNO" default="准驾证号：" />
						         </label>
						    </dt>
                            <dd>
                               <div class="col-xs-3">
                                  <input type="text" name="carNO" value="${params.carNO }" class="form-control">
                               </div>
                            </dd>
                        </dl>
                        <g:select name="vehicleStates" id="vehicleStates" value="${vehicleStates.name()}" from="${VehicleInUse.VehicleStates.values()}" class="form-control location" keys="${VehicleInUse.VehicleStates.values()*.name()}" />
						<script type="text/javascript">
							$("#vehicleStates").change(function(){
								var value = $("#vehicleStates").val();
								if(value == "returns"){
									location.href = "${createLink(action:'returnVehicle',id:"returns")}";
								}else if(value == "unReturns"){
									location.href = "${createLink(action:'returnVehicle',id:"unReturns")}";
								}
							});
						</script>
	                <fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: '查询')}" />
					</fieldset>
					</g:form>
                  </div>
					<g:if test="${flash.message}">
						<div style="color: red; font-weight:bold; position: relative; left:125px; bottom:40px;">${flash.message }</div>
					</g:if>	
                </div>
                
                
                
                <table class="table table-bordered  table-striped">
                    <thead>
                         <tr>
                            <th><g:message code="chepaihao" default="准驾证号"/></th>
                            <th><g:message code="chexing" default="借车人姓名"/></th>
                            <th>厂牌型号</th>
                            <th>车牌号码</th>
                            <th><g:message code="xinghao" default="借车时间"/></th>
                            <th><g:message code="zhuangtai" default="预计还车时间"/></th>
                            <th><g:message code="caozuo" default="操作"/></th>
                         </tr>
                    </thead>
                    <tbody>
                        <g:each in="${vehicleInuseList}" var="vehicleInUse">
                        <tr>
                            <td>${vehicleInUse.drivingPermit.dpNO}</td>
                            <td>${vehicleInUse.drivingPermit.name }</td>
                            <td>${vehicleInUse.vehicle.vehicleBrand }</td>
                            <td>${Vehicle.vehicleNO(vehicleInUse?.vehicle)}</td>
                            <td><g:formatDate date="${vehicleInUse.borrowTime}" format="yyyy-MM-dd HH:mm"/></td>
                            <td><g:formatDate date="${vehicleInUse.expectReturnTime }" format="yyyy-MM-dd HH:mm"/></td>
                            <td>
                            <g:if test="${vehicleInUse?.isReturn==false}">
                               <a href="${createLink(action:'showDetails',id:vehicleInUse.id,params:['excepectReturnTime':vehicleInUse.expectReturnTime,'borrowTime':vehicleInUse.borrowTime])}" rel="external" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#customerModal">还车</a>
                           </g:if>
                           <g:else>
                               <a  href="${createLink(action:'showReturnVehicle',id:vehicleInUse.id)}" class="btn btn-default btn-sm">该车已还</a>
                           </g:else>
                            </td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
                
                <div class="modal" id="customerModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>
			</section>
   </div>
  </div>
</body>
</html>