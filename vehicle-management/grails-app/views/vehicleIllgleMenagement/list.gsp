
<%@page import="java.awt.Desktop.Action"%>
<%@ page import="com.surelution.vms.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jarvis">
	<title>违章</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style>
		.modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:65%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
	     td th{width:200px;}
	     tr{line-height:30px;}
	</style>
	
	<script type="text/javascript">
	 $(document).ready(function() {
		 $("a[data-target=#customerModal]").click(function(event) {
			$(this).data('customerModal',null);
		    event.preventDefault();
		    var target = $(this).attr("href"); 
			    $("#customerModal").load(target, function() { 
			    	$("#customerModal").addClass("modalstyle")
	                $("#customerModal").modal('show');  }); 				    	
			    });
    });
	</script>
</head>

<body>
<div class="content-wrapper"><!--  -->
	<section class="content-header" >
		<h3 style="margin-top:-1px">违章</h3>
	</section>
<section class="content">
<div class="box box-info">
	<div id="list-user" class="content scaffold-lis" role="main">
	<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
		<g:uploadForm action="list">
		<div class="box-body">
			<dl class="dl-horizontal" style="margin-left:-80px;">
				<dt>
				<label for="branch">
					<g:message code="label.vehicleIllgle.voucherID" default="违章单号" />
				</label>
				</dt>
				<dd>
					
					<div class="col-xs-3">
						<input type="text" name="voucherID" class="form-control">
					</div>	
					<fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: 'search')}" />
					</fieldset>
				</dd>
			</dl>
		</div>
		</g:uploadForm>
		<div style="height:10px;"></div>
		<div>
		<table class = "table-striped table-bordered table" >
			<thead>
			<tr style=" background-color:#3C8DBD;">
			<th><g:message code="label.VehicleIllgle.voucherID" default="违章单号"/></th>
			<th><g:message code="label.vehicle.vehicleNO" default="vehicleNO" /></th>
			<th><g:message code="VehicleIllgle.illgleTime.label" default="illgleTime"/></th>
			<th><g:message code="VehicleIllgle.location.label" default="location"/></th>
			<th><g:message code="VehicleIllgle.processingUnit.label" default="processingUnit"/></th>
			<th><g:message code="VehicleIllgle.illgleSituation.label" default="违章情况"/></th>
			<th>违章是否处理</th>
			<th><g:message code="VehicleIllgle.dealTime.label" default="dealTime"/></th>
			<th><g:message code="VehicleIllgle.dealResult.label" default="dealResult"/>
			<th><g:message code="VehicleIllgle.dealMan.label" default="dealMan"/></th>
			
			<th><g:message code="pic" default="违章凭证"/></th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${illgle}"  var="illgel">
			<tr>
			<td>
			<a href="${createLink(action:'dispose',params:['voucherID':illgel?.voucherID])}">${illgel?.voucherID }</a>
			</td>
			<td>
				<g:if test="${illgel.vehicleInUse == null}">
					${illgel?.vehicle?.vehicleNO }
					 
				</g:if>
				<g:else>
					${illgel?.vehicleInUse?.vehicle?.vehicleNO }
				</g:else>
			</td>
			<td><g:formatDate date="${illgel?.illgleTime }" format="yyyy-MM-dd HH:mm"/></td>
			<td>${illgel?.location }</td>
			<td>${illgel?.processingUnit }</td>
			<td>${illgel?.illgleSituation }</td>
			<td>
			   <g:if test="${illgel?.ischecked==true}">是</g:if>
			   <g:else>否</g:else>
			</td>
			<td><g:formatDate date="${illgel?.dealTime }" format="yyyy-MM-dd HH:mm"/></td>
			<td>${illgel?.dealResult }</td>
			<td>${illgel?.dealMan }</td>
			<td>
			   <g:link action="show" id="${illgel.id }" data-toggle="modal" data-target="#customerModal" class="btn btn-default">显示图片</g:link>
			</td>
			</tr>
			</g:each>
		</tbody>
		</table>
			<div style="height:10px;"></div>
			</div>
			 <div class="modal" id="customerModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>
	</div>
	</div>
</section>
</div>
</body>
</html>
			
