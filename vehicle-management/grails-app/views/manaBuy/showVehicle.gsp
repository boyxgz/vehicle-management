<%@page import="com.surelution.vms.Vehicle"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>购入车辆记录</title>

<script type="text/javascript">
</script>
</head>
<body>
	<div class="body">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					购入车辆信息录入 <small></small>
				</h1>
			</section>
			<section class="content">
				<g:uploadForm action="saveVehicle">
                    <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.gotDateBuy" default="gotDateBuy"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:textField name="gotDate" value="${params.dateBegin}"
									id="gotDate" class="form-control" required=""/>
								<script type="text/javascript">
									$('#gotDate').datetimepicker({
										isRTL : false,
										format : 'yyyy.mm.dd',
										autoclose : true,
										minView : 'month',
										language : 'zh-CN'
									});
								</script>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehicleNO" default="vehicleNO"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
							<table>
								<tr>
									<td>
										<g:select name="province" from="${com.surelution.vms.Province.list() }" class="form-control" optionKey="id" optionValue="name" required="" style="width:100px;"/>
									</td>
									<td>
										<g:select name="areaCode" from="${'A'..'Y'}" class="form-control" keys="" style="width:100px;"/>
									</td>
									<td>
										<input type="text" name="no" class="form-control" required="required"/>
									</td>
								</tr>
							</table>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> 
								<g:message code="label.vehicle.vehicleBrand" default="vehicleBrand" class="form-control" /> 
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleBrand" class="form-control" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> 
								<g:message code="label.vehicle.vehicleType" default="vehicleType" /> 
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleType" class="form-control" required="required" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehicleModel" default="vehicleModel" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleModel" class="form-control" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> 
								<g:message code="label.vehicle.carFrame" default="carFrame" /> 
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="carFrame" class="form-control" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> 
								<g:message code="label.vehicle.price" default="price" /> 
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="price" class="form-control" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch">
								<g:message code="label.vehicle.emmissionStand" default="emmissionStand" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="emissionStand" class="form-control" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch">
								<g:message code="label.vehicle.emmissionValidity" default="emmissionValidity" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="emissionValidity" id="emissionValidity" class="form-control" required="required"/>
								<script>
									$('#emissionValidity').datetimepicker({
										isRTL : false,
										format : 'yyyy.mm.dd',
										autoclose : true,
										minView : 'month',
										language : 'zh-CN'
									});
								</script>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> 
								<g:message code="label.vehicle.vehiclePhoto" default="vehiclePhoto" class="form-control" /> 
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="file" class="form-control" name="vehiclePhoto" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.billPhoto" default="billPhoto"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="file" class="form-control" name="billPhoto" required="required"/>
							</div>
						</dd>
					</dl>
					<!-- 	111111111											 -->
					
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.enabled" default="enabled"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="checkbox" checked="checked" name="enabled" value="1" id="chx2" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.manufacturerBuy" default="manufacturerBuy"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="manufacturer" class="form-control" required="required"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.buyMan" default="buyMan"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="buyMan" class="form-control" required="required"/>
							</div>
						</dd>
					</dl>

					<fieldset class="buttons">
						<g:submitButton name="create" class="save btn btn-primary"
							value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>

				</g:uploadForm>
			</section>
		</div>
	</div>
</body>
</html>