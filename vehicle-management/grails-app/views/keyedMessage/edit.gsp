<%@ page import="com.surelution.vms.KeyedMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'keyedMessage.label', default: 'KeyedMessage')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">编辑关键字</h4>
        </div>
        <g:form method="post">
		<div class="modal-body">
				<g:hiddenField name="id" value="${keyedMessageInstance?.id}" />
				<g:hiddenField name="version" value="${keyedMessageInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
		</div>
		 <div class="modal-footer">		
				<fieldset class="buttons">
				<g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
				</fieldset>
		</div>
		</g:form>
	</body>
</html>
