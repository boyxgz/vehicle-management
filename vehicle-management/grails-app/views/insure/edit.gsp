<%@ page import="com.surelution.vms.Insure" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'insure.label', default: 'Insure')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="modal-header">
			<h1><g:message code="default.editInsure.label" args="[entityName]" /></h1>
		</div>
		<g:form method="post" >
		<div class="modal-body">
		<div id="edit-insure" class=" scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${insureInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${insureInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:hiddenField name="id" value="${insureInstance?.id}" />
			<g:hiddenField name="version" value="${insureInstance?.version}" />
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.insureContractNo.label" default="Insure Contract No" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="insureContractNo" name="insureContractNo" required="required" value="${insureInstance?.insureContractNo }"/>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.effectivedAt.label" default="Effectived At" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" name="effectivedAt" id="effectivedAt" value="${insureInstance?.effectivedAt}"/>
					<script type="text/javascript">
						$('#effectivedAt').datetimepicker({
							isRTL:false,
							format:'yyyy.mm.dd',
							autoclose:true,
							minView:'month',
							language:'zh-CN'
						});
					</script>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.expiredAt.label" default="Expired At" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" name="expiredAt" class="form-control" id="expiredAt" value="${insureInstance?.expiredAt}"  />
					<script type="text/javascript">
						$('#expiredAt').datetimepicker({
							isRTL:false,
							format:'yyyy.mm.dd',
							autoclose:true,
							minView:'month',
							language:'zh-CN'
						});
					</script>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.insureMan.label" default="Insure Man" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<g:textField name="insureMan" class="form-control" value="${insureInstance?.insureMan}"/>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.insureMoney.label" default="Insure Money" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" name="insureMoney" required="required" class="form-control" value="${insureInstance?.insureMoney }"/>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.insureType.label" default="Insure Type" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<g:select name="insureType" value="${insureInstance?.insureType.name() }" from="${Insure.InsureType.values()}"  class="form-control" keys="${Insure.InsureType.values()*.name()}" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.insuredAt.label" default="Insured At" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" name="insuredAt" id="insuredAt" class="form-control"  value="${insureInstance?.insuredAt}"  />
					<script type="text/javascript">
						$('#insuredAt').datetimepicker({
							isRTL:false,
							format:'yyyy.mm.dd',
							autoclose:true,
							minView:'month',
							language:'zh-CN'
						});
					</script>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.insurer.label" default="Insurer" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<g:select id="insurer" name="insurer" class="form-control" from="${com.surelution.vms.Insurer.list()}" optionKey="id" optionValue="name" required="" value="${insureInstance?.insurer?.id}"/>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.firstInsure.label" default="First Insure" />
					</label>
				</dt>
				<dd> 
					<%--<g:checkBox name="firstInsure" value="0" id="firstInsure" />--%>
					<input type="checkbox" name="firstInsure" value="0" id="firstInsure"/>
					<script>
						$("#firstInsure").change(function(){
							if($("#firstInsure").attr("checked") == undefined){
								$("#firstInsure").attr("checked","checked");
							}else if($("#firstInsure").attr("checked") == "checked"){
								$("#firstInsure").removeAttr("checked")
							}
							alert($("#firstInsure").attr('checked') == undefined?$("#firstInsure").value = 0: $("#firstInsure").value = 1);
						});
					</script>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="insure.vehicle.label" default="Vehicle" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<g:select id="vehicle" name="vehicle" class="form-control" from="${com.surelution.vms.Vehicle.list()}" optionKey="id" optionValue="vehicleType" required="" value="${insureInstance?.vehicle?.id}"/>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach"><g:message code="insure.detail.label" default="Detail" /></label>
					<span class="required-indicator">&nbsp;</span>
				</dt>
				<dd>
					<textarea class="form-control" name="detail" >${insureInstance?.detail}</textarea>
				</dd>
			</dl>
			</div>
		</div>
		<div class="modal-footer">
			<g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<input type="button" class="btn btn-default" value="取消" data-dismiss="modal"/>
		</div>
		</g:form>
	</body>
</html>
