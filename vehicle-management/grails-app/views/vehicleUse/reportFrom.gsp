<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.surelution.vms.Vehicle" %>
<html>
<head>
	<meta name="layout" content="jarvis"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>报表</title>
	<style>
		#box-form{line-height:50px; margin-top:20px; width:70%; margin-left:10px;}
		.title{width:100px;}
		.col-md-1{padding: 0px; width: 10px;}
		.brach{margin-bottom: 13px;}
	</style>
</head>
<body>
	<div class="content-wrapper">
		<section class="content-header">
			<h1></h1>
		</section>
		<section class="content">
			<div class="box box-info">
			<g:form action="reportFrom">
			<table id="box-form">
				<tr>
					<td align="right" class="title">
						<label class="brach">
							<g:message code="default.reportFrom.dpNO" default="dpNO"/>&nbsp;&nbsp;&nbsp;
						</label>
					</td>
					<td>
						<input type="text" name="dpNO" id="dpNO" value="${params.dpNO }" class="form-control"/>
					</td>
					<td align="right" class="title">
						<label>
							<g:message code="default.reportFrom.vehicleNO" default="vehicleNO"/>&nbsp;&nbsp;&nbsp;
						</label>
					</td>
					<td>
						<input type="text" name="vehicleNO" value="${params.vehicleNO }" class="form-control" />
					</td>
				</tr>
				<tr>
					<td align="right" class="title">
						<label class="brach">
							<g:message code="default.reportFrom.borrowDate" default="borrowDate" />&nbsp;&nbsp;&nbsp;
						</label>
					</td>
					<td>
						<input type="text" name="startDate" id="startDate" value="${params?.startDate }" class="form-control"/>
					</td>
					<td align="center">
						~
					</td>
					<td>
						<input type="text" name="endDate" id="endDate" value="${params?.endDate }" class="form-control"/>
					</td>
					
				</tr>
				<tr>
					<td align="right">
						<input type="submit" name="submit" class="btn btn-info" /> 
					</td>
					<td></td>
				</tr>
			</table>
			</g:form>
			</div>
			<div>
				<table class="table table-bordered table-respose">
				<thead>
					<tr>
						<th><g:message code="default.reportFrom.vehicleNO" default="vehicleNO"/></th>
						<th><g:message code="default.reportFrom.drivingPermit" default="drivingPermit"/></th>
						<th><g:message code="default.reportFrom.borrowRecordMan" default="borrowRecordMan" /></th>
						<th><g:message code="default.reportFrom.returnRecordMan" default="returnRecordMan" /></th>
						<th><g:message code="default.reportFrom.borrowReason" default="borrowReason" /></th>
						<th><g:message code="default.reportFrom.borrowTime" default="borrowTime"/></th>
						<th><g:message code="default.reportFrom.returnTime" default="returnTime" /></th>
						<th><g:message code="default.reportFrom.isDelay" default="isDelay" /></th>
						<th><g:message code="default.reportFrom.delayReason" default="delayReason" /></th>
					</tr>
				</thead>
				<g:each in="${vehicleInUse }" var="inUse">
				<tbody>
					<tr>
						<td>${Vehicle.vehicleNO(inUse.vehicle)}</td>
						<td>${inUse?.drivingPermit?.name }</td>
						<td>${inUse?.borrowRecordMan }</td>
						<td>${inUse?.returnRecordMan }</td>
						<td>${inUse?.borrowReason }</td>
						<td>${inUse?.borrowTime }</td>
						<td>${inUse?.returnTime }</td>
						<td>
							<g:if test="${inUse?.isDelay }">
								是
							</g:if>
							<g:else>否</g:else>
						</td>
						<td>${inUse?.delayReason }</td>
					</tr>
				</tbody>
				</g:each>
				</table>
				<div class="pagination">
					<g:paginate total="${vehicleInUseTotal}" />
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		$('#startDate').datetimepicker({
			isRTL:false,
			format:'yyyy.mm.dd',
			autoclose:true,
			minView:'month',
			language:'zh-CN'
		});
		$('#endDate').datetimepicker({
			isRTL:false,
			format:'yyyy.mm.dd',
			autoclose:true,
			minView:'month',
			language:'zh-CN'
		});
	</script>
</body>
</html>