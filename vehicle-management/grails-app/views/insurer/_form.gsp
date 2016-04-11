<%@ page import="com.surelution.vms.Insurer" %>



<div class="fieldcontain ${hasErrors(bean: insurerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="insurer.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${insurerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: insurerInstance, field: 'tel', 'error')} ">
	<label for="tel">
		<g:message code="insurer.tel.label" default="Tel" />
		
	</label>
	<g:textField name="tel" value="${insurerInstance?.tel}"/>
</div>

