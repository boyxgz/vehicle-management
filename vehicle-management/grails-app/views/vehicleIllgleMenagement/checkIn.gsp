
<%@ page import="com.surelution.vms.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jarvis">
	<title>车辆违章登记</title>
	
	<script type="text/javascript">
$('#document').ready(function(){
	if($('#vehi').val() == ''){
		$('#save').prop('disabled',true);
	}
});
</script>
</head>
<style>
	td th{width:200px;}
	tr{line-height:30px;}
</style>
<body>
<div class="content-wrapper"><!--  -->
	<section class="content-header" >
		<h3 style="margin-top:-1px;">车辆违章登记</h3>
	</section>
<section class="content">
<div style="margin-top:2px; margin-left:10%; font-size:22px; font-weight:bold; color:red;">
<g:if test="${flash.message }">
${flash.message }
</g:if>
</div>
<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicle.vehicleNO" default="vehicleNO" />
	</label>
	</dt>
	<g:form action="checkIn">
	<dd>
		<div class="col-xs-6">
		<input type="text" name="vehicleNO" value="${params.vehicleNO }" class="form-control" required>
		</div>
		<fieldset class="buttons">
		<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: 'search')}" />
		</fieldset>
	</dd>
	</g:form>
</dl>

<g:uploadForm action="save">
<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicle.vehicleType" default="vehicleType" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="vehicleType" value="${vehi?.vehicleType}" class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>


<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicle.vsource" default="vsource" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		   <input type="text" name="vsource" value="${vehi?.vsource?.title}" class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.voucherID" default="违章单号" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="voucherID" value="" class="form-control" required>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.illgleTime" default="illgleTime" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<g:textField value="${params.illgletime }" name="illgletime" id="datetimepicker" class="form-control col-xs-4" required=''/>
		<script type="text/javascript">
		$('#datetimepicker').datetimepicker({
			isRTL:false,
			format:'yyyy.mm.dd hh:ii',
			autoclose:true,
			minView:'hour',
			language:'zh-CN'
		});
		</script>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.location" default="location" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="location" value="" class="form-control" required>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.processingUnit" default="processingUnit" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="processingUnit" value="" class="form-control" required>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.illgleSituation" default="违章情况" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="illgleSituation" value="" class="form-control" required>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.image" default="image" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="file" name="illeglePic" class="form-control" required>
		</div>
	</dd>
</dl>
<input type="hidden" value="${vehi }" id="vehi">
<input type="hidden" value="${vehi?.id}" name="vehicleNO"/>
<fieldset class="buttons">
	<g:submitButton name="save" id="save" class="save btn btn-primary" value="${message(code: 'default.button.save.label', default: 'save')}" />
</fieldset>
</g:uploadForm>
</section>
</div>
</div>
</body>
</html>
			
