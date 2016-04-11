
<%@ page import="com.surelution.vms.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jarvis">
	<title>准驾证管理</title>
	<style>
		.delete{text-decoration: line-through;}
	</style>
</head>
<style>
	td th{width:200px;}
	tr{line-height:30px;}
</style>
<body>
<div class="content-wrapper"><!--  -->
	<section class="content-header" >
		<h3>准驾证管理</h3>
	</section>
<section class="content">
<div class="box box-info">
	<div id="list-user" class="content scaffold-lis" role="main">
		<%--<g:uploadForm action="DriviLicense">
		<div class="box-body">
			<dl class="dl-horizontal" style="margin-left:-80px;">
				<dt>
				<label for="branch">
					<g:message code="label.DrivingPermit.dpONdfas" default="准驾证号码" />
				</label>
				</dt>
				<dd>
					
					<div class="col-xs-3">
						<input type="text" name="dpNO" value="${params.dpNO }" class="form-control">
					</div>	
					<fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: 'search')}" />
					</fieldset>
				</dd>
			</dl>
		</div>
		</g:uploadForm>--%>

		<%--<span>
			<g:link class="create glyphicon glyphicon-plus" action="create" style="color:#000; font-weight:bold;" data-toggle="modal" data-target="#myModal" >&nbsp;chaxun<g:message code="default.new.label" args="[entityName]" /></g:link>
		</span>
		--%><g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div style="height:10px;"></div>
		<div style="overflow-x:hidden;overflow:auto;">
		<table class = "table-striped table-bordered table" style="width:1300px;">
			<thead>
			<tr style=" background-color:#3C8DBD;">
				<th><g:message code="drivingPermit.dpno.label" default="准驾证号码"/></th>
				<th><g:message code="drivingPermit.trainingDate.label" default="培训日期"/></th>
				<th>核发时间</th>
				<th><g:message code="drivingPermit.score.label" default="考核成绩"/></th>
				<th><g:message code="drivingPermit.delayTo.label" default="延期时长"/></th>
				<th><g:message code="drivingPermit.revokedate.label" default="吊销日期"/></th>
				<th><g:message code="drivingPermit.name.label" default="驾驶员"/></th>
				<th><g:message code="drivingPermit.birthDay.label" default="出生日期"/></th>
				<th><g:message code="drivingPermit.sex.label" default="性别"/></th>
				<th><g:message code="drivingPermit.dlicense.label" default="驾驶证"/></th>
				<th><g:message code="drivingPermit.borrowNum.label" default="借车次数"/></th>
				<th><g:message code="drivingPermit.numbIllgle.label" default="违章次数"/></th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${dpList}"  var="drivilicense">
			<tr class="${drivilicense?.licensRevoked ? 'delete' : ' '}">
				<td><g:link action="showDrivi" id="${drivilicense?.id }">${drivilicense?.dpNO }</g:link></td>
				<td><g:formatDate date="${drivilicense?.trainingDate }" format="yyyy-MM-dd" /></td>
				<td><g:formatDate date="${drivilicense?.issueDate }" format="yyyy-MM-dd" /></td>
				<td>${drivilicense?.score }</td>
				<td><g:formatDate date="${drivilicense?.delayTo }" format="yyyy-MM-dd" /></td>
				<td><g:formatDate date="${drivilicense?.revokeDate }" format="yyyy-MM-dd" /></td>
				<td>${drivilicense?.name }</td>
				<td><g:formatDate date="${drivilicense?.birthDay }" format="yyyy-MM-dd" /></td>
				<td>${drivilicense?.sex }</td>
				<td>${drivilicense?.dlicense }</td>
				<td>${drivilicense?.borrowNum }</td>
				<td>${drivilicense?.numbIllgle }</td>	
			</tr>
			</g:each>
		</tbody>
		</table>
		</div>
			<div style="height:10px;"></div>
			</div>
	</div>
</section>
</div>
</body>
</html>
			
