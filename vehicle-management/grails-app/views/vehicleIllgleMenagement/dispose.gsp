<%@page import="com.surelution.vms.DrivingPermit"%>
<%@page import="com.surelution.vms.Vehicle" %>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>车辆违章处理</title>
<script type="text/javascript">
	$("#document").ready(function(){
		var tr = 'true';
		var ischeck = $("#ischecked").val();
		if(tr === ischeck){
			$("#sub").prop('disabled',true);
			$("#dealMan").prop('readonly',true);
			$('#dealResult').prop('readonly',true);
			$('#dealTime').prop('readonly',true);
		}
	});


	function check(form){
		if(form.dealResult.value.length == 3){
			form.dealResult.value.length == '';
			alert("请输入处理方式!");
			return false;
		}
		if(form.dealMan.value.length == 3){
			form.dealMan.value = '';
			alert("请输入处理人!");
			return false;
		}
	        return true;
	}


</script>
</head>
<body>
<div class="content-wrapper">
<section class="content-header">
	<h1>车辆违章处理</h1>
</section>
<section class="content">
<div style="margin-left:10%;">
<dl class="dl-horizontal" style="margin-left:-80px;">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.voucherID" default="违章单号" />
	</label>
	</dt>
	<g:form action="dispose">
	<dd>
		<div class="col-xs-6">
		<input type="text" name="voucherID" value="${illgle?.voucherID }"class="form-control" required="required">
		</div>
		<fieldset class="buttons">
		<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: 'search')}" />
		</fieldset>
	</dd>
	</g:form>
</dl>
</div>
<div style="margin-left:40%; font-size:22px; font-weight:bold; color:red;">
<g:if test="${flash.message }">
${flash.message }
</g:if>
</div>
<div>
<h3 style="font-weight:bold;">违章情况：</h3>

<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicle.vehicleNO" default="vehicleNO" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
			<input type="text" name="vehicleNO" value="${Vehicle.vehicleNO(vehicle)}" class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>
<div>

</div>
<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicle.vehicleType" default="vehicleType" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
			<input type="text" name="vehicleType" value="${vehicle?.vehicleType}" class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicle.vsource" default="vsource" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		   <input type="text" name="vsource" value="${vehicle?.vsource?.title}" class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.illgleTime" default="illgleTime" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="illgleTime" value="${illgle?.illgleTime }" class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.location" default="location" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="location" value="${illgle?.location }" class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>

<dl class="dl-horizontal"  >
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.processingUnit" default="processingUnit" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="processingUnit" value="${illgle?.processingUnit} " class="form-control" readonly="readonly">
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.image" default="image" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<g:if test="${illgle?.image }">
		<img src="${createLink(action:'showPic',controller:'VehicleIllgleMenagement',id:illgle?.id)}" class="img-rounded" style="width: 100px; height: 100px;">
		</g:if>
		</div>
	</dd>
</dl>
<g:form action="updata" onsubmit="return check(this)">
<input type="hidden" name="voucherID" value="${illgle?.voucherID }" class="form-control">
<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.dealTime" default="dealTime" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<g:if test="${illgle?.dealTime == null }">
		<input type="text" value="${new Date().format('yyyy-MM-dd HH:mm') }" name="dealTime" id="dealTime" class="form-control" required/>
		<script type="text/javascript">
		$('#dealTime').datetimepicker({
			isRTL:false,
			format:'yyyy.mm.dd hh:ii',
			autoclose:true,
			minView:'hour',
			language:'zh-CN'
		});
		</script>
		</g:if>
		<g:else>
		<input type="text" value="<g:formatDate date="${illgle?.dealTime }" format="yyyy-MM-dd HH:mm"/>" name="dealTime" id="dealTime" class="form-control" required/>
		</g:else>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.dealResult" default="dealResult" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="dealResult" value="${illgle?.dealResult}" id="dealResult" class="form-control"   required>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal" >
	<dt>
	<label for="branch">
		<g:message code="label.vehicleIllgle.dealMan" default="dealMan" />
	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="dealMan"  id="dealMan" value="${illgle?.dealMan}" class="form-control"  required="required" />
		</div>
	</dd>
</dl>
<div style="width:70px; margin-left:66%;">
<input type="hidden" value="${illgle?.ischecked}" id="ischecked"/>
<fieldset class="buttons">
	<%--<g:actionSubmit id="sub" class="save move btn btn-primary"  value="${message(code: 'default.button.update.label', default: '提交 ')}"/>--%>
   <input type="submit" id="sub" onclick="return check(this.form)" class="save move btn btn-primary"  value="${message(code: 'default.button.update.label', default: '提交 ')}"/>
</fieldset>
</div>
</g:form>
</div>
</section>
<div style="height:10px;"></div>
</div>
</body>
</html>