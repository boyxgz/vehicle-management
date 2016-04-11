<%@ page import="com.surelution.vms.Insurer" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'insurer.label', default: 'Insurer')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<style>
			.modal-header{height:auto;}
			.modal-body{position:relative; top:15px; right:55px;}
			.modal-footer{}
		</style>
	</head>
	<body>
		<div class="modal-header">
			<h2><g:message code="default.create.label" args="[entityName]" /></h2>
		</div>
		<g:form action="save">
		<div class="modal-body">
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
			<dl class="dl-horizontal">
				<dt>
					<label class="branch"><g:message code="insurer.name.label" default="Name" /></label>
				</dt>
				<dd>
					<g:textField name="name" class="form-control"  value="${insureerInstace?.name }"/>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="branch"><g:message code="insurer.tel.laeel" default="Tel"/></label>
				</dt>
				<dd>
					<g:textField name="tel" c value="${insurerInstace?.tel }" />
				</dd>
			</dl>
		</div>
		<div class="modal-footer">
			<input type="submit" name="create" class="btn btn-default" value="确认"/>
			<input type="button" class="btn btn-default" data-dismiss="modal" value="取消"/>
		</div>
		</g:form>
	</body>
</html>
