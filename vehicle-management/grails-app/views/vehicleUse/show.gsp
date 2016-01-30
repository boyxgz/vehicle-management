<%@page import="com.surelution.vms.Vehicle"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>借车信息记录</title>

<script type="text/javascript">
    
</script>
</head>
<body>
	<div class="body">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					借车登记 <small></small>
				</h1>
			</section>
			<section class="content">
			   <div class="box box-info">
                  <div class="box-header with-border">
                     <h4 class="box-title">车辆查询</h4>
                  </div>
                  <div class="box-body">
                  <g:form action="show">
                      <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.vehicleNO" default="车牌号" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                  <input type="text" name="vehicleNO" value="${params.vehicleNO }" class="form-control">
	                               </div>
	                            </dd>
	                        </dl>
	                        
	                <fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: '查询')}" />
					</fieldset>
					</g:form>
                  </div>
                </div>
                
                <table class="table table-bordered  table-striped">
                    <thead>
                         <tr>
                            <th><g:message code="chepaihao" default="车牌号"/></th>
                            <th><g:message code="chexing" default="车型"/></th>
                            <th><g:message code="xinghao" default="发动机号"/></th>
                            <th>厂牌型号</th>
                            <th><g:message code="zhuangtai" default="车辆使用状态"/></th>
                            <th><g:message code="weixiu" default="维修状态"/></th>
                            <th><g:message code="caozuo" default="操作"/></th>
                         </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vehicleList}" var="vehicle">
                        <tr>
                            <td>${vehicle?.vehicleNO}</td>
                            <td>${vehicle?.vehicleType}</td>
                            <td>${vehicle?.vehicleModel }</td>
                            <td>${vehicle?.vehicleBrand }</td>
                            <td>
                                <g:if test="${vehicle?.inuse==true}">正在使用</g:if>
                                <g:else>可以使用 </g:else>
                            </td>
                            <td>${vehicle?.statu}</td>
                            <td>
                               <g:if test="${vehicle?.inuse==false && vehicle?.stopRent==null && vehicle?.transfer==null && vehicle?.scrapped==null}">
                                  <a href="${createLink(action:'showDrivingPermit',id:vehicle.id) }" rel="external" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#customerModal">出借</a>
                               </g:if>
                               <g:elseif test="${vehicle?.stopRent?.isStopRent==true}">
                                  <a href="" class="btn btn-default btn-sm">该车已经停止租赁</a>
                               </g:elseif>
                               <g:elseif test="${vehicle?.transfer?.isTransfer==true }">
                                  <a href="" class="btn btn-default btn-sm">该车已经转让</a>
                               </g:elseif>
                               <g:elseif test="${vehicle?.scrapped?.isScrapped==true }">
                                  <a href="" class="btn btn-default btn-sm">该车已经报废</a>
                               </g:elseif>
                               <g:else>
                                  <a href="${createLink(action:'showlend',id:vehicle.id)}"   class="btn btn-default btn-sm">车辆已经借出</a>
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