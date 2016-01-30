<%@page import="com.surelution.vms.DrivingPermit"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>准驾证核发</title>

<script type="text/javascript">
    
</script>
</head>
<body>
<div class="content-wrapper">
<section class="content-header">
	<h1>准驾证核发</h1>
</section>
<div style="height:10px;"></div>
<g:uploadForm action="saveDrivingPermit">
<div style="width:96%; margin-left:10%; ">
<div style="height:10px;"></div>
<dl class="dl-horizontal">
	<dt>
		<label for="bransh">
			<g:message code="zhuanjiaz" default="准驾证号码"/>
			<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
			<input type="text" class="form-control" name="dp" required/>
		</div>
	</dd>	
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="bransh">
			<g:message code="label.DrivingPermit.trainingDate" default="trainingDate" />
			<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
	<div class="col-xs-8">
	<g:textField value="${params.trainingDate }" name="trainingDate" id="datetimepicker" class="form-control" />
	<script type="text/javascript">
		$('#datetimepicker').datetimepicker({
			isRTL:false,
			format:'yyyy.mm.dd',
			autoclose:true,
			minView:'month',
			language:'zh-CN'
		});
	</script>
	</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label for="bransh">
			<g:message code="label.DrivingPermit.issueDate" default="核发日期" />
			<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
	<div class="col-xs-8">
	<g:textField value="${params.issueDate }" name="issueDate" value="${new Date().format('yyyy.MM.dd') }" id="datetimepicker1" class="form-control" />
	<script type="text/javascript">
		$('#datetimepicker1').datetimepicker({
			isRTL:false,
			format:'yyyy.mm.dd',
			autoclose:true,
			minView:'month',
			language:'zh-CN'
		});
	</script>
	</div>
	</dd>
</dl>


<%--<dl class="dl-horizontal">
	<dt>
		<label for="bransh">
			<g:message code="label.DrivingPermit.validityDate" default="有效期" />
			<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
	<div class="col-xs-8">
	<g:textField value="${params.validityDate }" name="validityDate" id="datetimepicker2" class="form-control" />
	<script type="text/javascript">
		$('#datetimepicker2').datetimepicker({
			isRTL:false,
			format:'yyyy.mm.dd',
			autoclose:true,
			minView:'month',
			language:'zh-CN'
		});
	</script>
	</div>
	</dd>
</dl>
--%><dl class="dl-horizontal">
	<dt>
		<label>
			<g:message code="label.DrivingPermit.score" default="score"/>
			<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" class="form-control" name="score" required/>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label>
		<g:message code="label.DrivingPermit.name" default="name" />
		<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="name" class="form-control" required />
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label>
		<g:message code="label.DrivingPermit.description" default="description" />
		<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="description" class="form-control" required />
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label>
		<g:message code="label.DrivingPermit.age" default="age" />
		<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name="age" class="form-control" required />
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label>
		<g:message code="label.DrivingPermit.sex" default="sex" />
		<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<g:select name="sex" from="${DrivingPermit.Sex.values()}" class="form-control" keys="${DrivingPermit.Sex.values()*.name()}" />
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label>
		<g:message code="label.DrivingPermit.dlicense" default="dlicense" />
		<span class="required-indicator">*</span>
		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		<input type="text" name=dlicense class="form-control" required />
		</div>
	</dd>
</dl>
</div>
	<div style="border:0px solid #000; width:80px; margin-left:870px;">
	<fieldset class="buttons">
		<g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</fieldset>
	</div>
</g:uploadForm>
<div style="height:10px;"></div>
</div>
</body>
</html>