
<%@ page import="com.surelution.vms.Insure" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'insure.label', default: 'Insure')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style>
			.defaultmodalstyle{ width:40%; height:auto; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
		<section class="content-header">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
		</section>
		<section class="content">
		<div id="show-insure" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-respose">
				<thead><tr>
					<th>名称</th>
					<th>内容</th>
				</tr></thead>
				<tbody>
					<tr>
						<td><g:message code="insure.detail.label" default="Detail" /></td>
						<td><g:fieldValue bean="${insureInstance}" field="detail"/></td>
					</tr>
					<tr>
						<td><g:message code="insure.effectivedAt.label" default="Effectived At" /></td>
						<td><g:formatDate date="${insureInstance?.effectivedAt}" /></td>
					</tr>
					<tr>
						<td><g:message code="insure.expiredAt.label" default="Expired At" /></td>
						<td><g:formatDate date="${insureInstance?.expiredAt}" /></td>
					</tr>
					<tr>
						<td><g:message code="insure.firstInsure.label" default="First Insure" /></td>
						<td><g:formatBoolean boolean="${insureInstance?.firstInsure}" /></td>
					</tr>
					<tr>
						<td><g:message code="insure.insureContractNo.label" default="Insure Contract No" /></td>
						<td><g:fieldValue bean="${insureInstance}" field="insureContractNo"/></td>
					</tr>
					<tr>
						<td><g:message code="insure.insureMan.label" default="Insure Man" /></td>
						<td><g:fieldValue bean="${insureInstance}" field="insureMan"/></td>
					</tr>
					<tr>
						<td><g:message code="insure.insureMoney.label" default="Insure Money" /></td>
						<td><g:fieldValue bean="${insureInstance}" field="insureMoney"/></td>
					</tr>
					<tr>
						<td><g:message code="insure.insureType.label" default="Insure Type" /></td>
						<td><g:fieldValue bean="${insureInstance}" field="insureType"/></td>
					</tr>
					<tr>
						<td><g:message code="insure.insuredAt.label" default="Insured At" /></td>
						<td><g:formatDate date="${insureInstance?.insuredAt}" /></td>
					</tr>
					<tr>
						<td><g:message code="insure.insurer.label" default="Insurer" /></td>
						<td><g:link controller="insurer" action="show" id="${insureInstance?.insurer?.id}">${insureInstance?.insurer?.name}</g:link></td>
					</tr>
					<tr>
						<td><g:message code="insure.vehicle.label" default="Vehicle" /></td>
						<td><g:link controller="manaBuy" action="showVehicleSource" id="${insureInstance?.vehicle?.id}">${insureInstance?.vehicle?.vehicleNO}</g:link></td>
					</tr>
				</tbody>
			</table>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${insureInstance?.id}" />
					<g:link class="edit" action="edit" id="${insureInstance?.id}" class="btn btn-default" data-toggle="modal" data-target="#insureEdit" >编辑</g:link>
					<%--<g:actionSubmit class="btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
				</fieldset>
			</g:form>
		</div>
		</section>
	</div>
	<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="insureEdit">
	   	<div class="modal-dialog">
	    	<div class="modal-content">
	    	</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<script>
	$(document).ready(function() {
		 $("a[data-target=#insureEdit]").click(function(event) {
			$(this).data('insureEdit',null);
		    event.preventDefault();
		    var target = $(this).attr("href"); 
			    $("#insureEdit").load(target, function() { 
			    	$("#insureEdit").addClass("defaultmodalstyle")
	                $("#insureEdit").modal('show');  }); 				    	
			    });
  	});
	</script>
	</body>
</html>
