<%@ page import="com.surelution.vms.Insure" %>



<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'detail', 'error')} ">
	<label for="detail">
		<g:message code="insure.detail.label" default="Detail" />
		
	</label>
	<g:textField name="detail" value="${insureInstance?.detail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'effectivedAt', 'error')} required">
	<label for="effectivedAt">
		<g:message code="insure.effectivedAt.label" default="Effectived At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="effectivedAt" precision="day"  value="${insureInstance?.effectivedAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'expiredAt', 'error')} required">
	<label for="expiredAt">
		<g:message code="insure.expiredAt.label" default="Expired At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="expiredAt" precision="day"  value="${insureInstance?.expiredAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'firstInsure', 'error')} ">
	<label for="firstInsure">
		<g:message code="insure.firstInsure.label" default="First Insure" />
		
	</label>
	<g:checkBox name="firstInsure" value="${insureInstance?.firstInsure}" />
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'insureContractNo', 'error')} required">
	<label for="insureContractNo">
		<g:message code="insure.insureContractNo.label" default="Insure Contract No" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="insureContractNo" type="number" value="${insureInstance.insureContractNo}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'insureMan', 'error')} ">
	<label for="insureMan">
		<g:message code="insure.insureMan.label" default="Insure Man" />
		
	</label>
	<g:textField name="insureMan" value="${insureInstance?.insureMan}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'insureMoney', 'error')} required">
	<label for="insureMoney">
		<g:message code="insure.insureMoney.label" default="Insure Money" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="insureMoney" value="${fieldValue(bean: insureInstance, field: 'insureMoney')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'insureType', 'error')} ">
	<label for="insureType">
		<g:message code="insure.insureType.label" default="Insure Type" />
		
	</label>
	<g:textField name="insureType" value="${insureInstance?.insureType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'insuredAt', 'error')} required">
	<label for="insuredAt">
		<g:message code="insure.insuredAt.label" default="Insured At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="insuredAt" precision="day"  value="${insureInstance?.insuredAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'insurer', 'error')} required">
	<label for="insurer">
		<g:message code="insure.insurer.label" default="Insurer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="insurer" name="insurer.id" from="${com.surelution.vms.Insurer.list()}" optionKey="id" required="" value="${insureInstance?.insurer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: insureInstance, field: 'vehicle', 'error')} required">
	<label for="vehicle">
		<g:message code="insure.vehicle.label" default="Vehicle" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vehicle" name="vehicle.id" from="${com.surelution.vms.Vehicle.list()}" optionKey="id" required="" value="${insureInstance?.vehicle?.id}" class="many-to-one"/>
</div>

