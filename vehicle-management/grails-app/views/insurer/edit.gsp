<%@ page import="com.surelution.vms.Insurer" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'insurer.label', default: 'Insurer')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<style>
			.modal-body{height:auto;}
		</style>
	</head>
	<body>
		<div class="modal-header">
			<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
		</div>
		<g:form method="post" >
		<div class="modal-body">
		<div id="edit-insurer" class="scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${insurerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${insurerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:hiddenField name="id" value="${insurerInstance?.id}" />
			<g:hiddenField name="version" value="${insurerInstance?.version}" />
			<dl class="dl-horizontal">
				<dt>
					<label class="branch"><g:message code="insurer.name.label" default="Name" /></label>
				</dt>
				<dd>
					<g:textField name="name" class="form-control"  value="${insurerInstance?.name }"/>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="branch"><g:message code="insurer.tel.laeel" default="Tel"/></label>
				</dt>
				<dd>
					<g:textField name="tel" class="form-control" value="${insurerInstance?.tel }" />
				</dd>
			</dl>
		</div>
		</div>
		<div class="modal-footer">
			<g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<%--<g:link action="update" id="${insurerInstance?.id }"><input type="submit" class="btn btn-default" value="确认" /></g:link>--%>
			<input type="button" class="btn btn-default" value="取消" data-dismiss="modal"/>
		</div>
		</g:form>
	</body>
</html>
