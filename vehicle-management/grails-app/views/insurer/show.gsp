
<%@ page import="com.surelution.vms.Insurer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'insurer.label', default: 'Insurer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="content-wrapper">
		<section class="content-header">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
		</section>
		<section class="content">
		<div id="show-insurer" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-respose">
				<thead>
					<tr>
						<th>名称</th>
						<th>内容</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><g:message code="insurer.name.label" default="Name" /></td>
						<td><g:fieldValue bean="${insurerInstance}" field="name"/></td>
					</tr>
					<tr>
						<td><g:message code="insurer.tel.label" default="Tel" /></td>
						<td><g:fieldValue bean="${insurerInstance}" field="tel"/></td>
					</tr>
				</tbody>
			</table>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${insurerInstance?.id}" />
					<g:link class="btn btn-default" action="edit" id="${insurerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		</section>
	</div>
	</body>
</html>
