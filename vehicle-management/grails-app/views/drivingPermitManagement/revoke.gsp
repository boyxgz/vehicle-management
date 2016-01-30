
<%@ page import="com.surelution.vms.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jarvis">
	<title>准驾证吊销</title>
	<style>
		
		.modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:45%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
	</style>
	<script type="text/javascript">
	   $(document).ready(function() {
		 $("a[data-target=#modelpostpone]").click(function(event) {
			$(this).data('modelpostpone',null);
		    event.preventDefault();
		    var target = $(this).attr("href"); 
			    $("#modelpostpone").load(target, function() { 
			    	$("#modelpostpone").addClass("modalstyle")
	                $("#modelpostpone").modal('show');  }); 				    	
			    });
    });
		
		
	</script>
</head>

<body>
<div class="content-wrapper"><!--  -->
	<section class="content-header" >
		<h3>准驾证吊销</h3>
	</section>
	<section class="content">
<div class="box box-info">
	<div id="list-user" class="content scaffold-lis" role="main">
		<div class="box-body">
		<dl class="dl-horizontal" style="margin-left:-80px;">
			<dt>
			<label for="branch">
				<g:message code="label.vehicle.carNO" default="准驾证号" />
			</label>
			</dt>
			<g:uploadForm action="revoke">
			<dd>
				<div class="col-xs-3">
					<input type="text" name="dpNO" value="${params.dpNO }" class="form-control">
				</div>
				<fieldset class="buttons">
					<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: '查询')}" />
				</fieldset>
			</dd>
			</g:uploadForm>
		</dl>
		</div>

		<%--<span>
			<g:link class="create glyphicon glyphicon-plus" action="create" style="color:#000; font-weight:bold;" data-toggle="modal" data-target="#myModal" >&nbsp;chaxun<g:message code="default.new.label" args="[entityName]" /></g:link>
		</span>
	--%><g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div style="height:10px;"></div>
		<div style="overflow-x:hidden;overflow:auto;">
		<g:uploadForm action="uodatimerevoke">
		<table class = "table-striped table-bordered table" style="width:;">
			<thead>
			<tr style=" background-color:#3C8DBD;">
				<th><g:message code="drivingPermit.dpno.label" default="准驾证号码"/></th>
				<th><g:message code="drivingPermit.name.label" default="驾驶员"/></th>
				<th><g:message code="drivingPermit.trainingDate.label" default="培训日期"/></th>
				<%--<th><g:message code="drivingPermit.score.label" default="考核成绩"/></th> --%>
				<%--<th><g:message code="drivingPermit.description.label" default="描述"/></th>
				<th><g:message code="drivingPermit.age.label" default="年龄"/></th>
				<th><g:message code="drivingPermit.sex.label" default="性别"/></th>--%>
				<th><g:message code="drivingPermit.dlicense.label" default="驾驶证"/></th>
				<th><g:message code="drivingPermit.borrowNum.label" default="借车次数"/></th>
				<th><g:message code="drivingPermit.numbIllgle.label" default="违章次数"/></th>
				<%--<th><g:message code="drivingPermit.delay.label" default="是否延期"/></th>
				<th><g:message code="drivingPermit.delayTo.label" default="延期时长"/></th>
				--%><th><g:message code="drivingPermit.licensRevoked.label" default="是否吊销"/></th>
				<th><g:message code="drivingPermit.revokedate.label" default="吊销时间"/></th>
				<th>吊销操作</th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${dp}"  var="drivingPermit">
			<tr>
				<td>${drivingPermit.dpNO }</td>
				<td>${drivingPermit.name }</td>
				<td><g:formatDate date="${drivingPermit.trainingDate }" format="yyyy-MM-dd"/></td>
				<td>${drivingPermit.dlicense }</td>
				<td>${drivingPermit.borrowNum }</td>
				<td>${drivingPermit.numbIllgle }</td>
				<%--<td><g:formatBoolean boolean="${drivilicense.delay }" /></td>
				<td>${drivilicense.delayTo }</td>
				--%><td><g:formatBoolean boolean="${drivingPermit.licensRevoked }" /></td>
				<td><g:formatDate date="${drivingPermit.revokeDate }" format="yyyy-MM-dd"/></td>
				<g:if test="${drivingPermit.licensRevoked==false}">
				<td> 
					<a href="${createLink(action:'updatimerevoke',id:drivingPermit.id) }" data-toggle="modal" data-target="#modelpostpone"  class="btn btn-primary">
		          	吊销  
		 			</a>
				</td>	
				</g:if>
			</tr>
			</g:each>
		</tbody>
		</table>
		</g:uploadForm>
		</div>
			<div style="height:10px;"></div>
			</div>
			</div>
		</section>
</div>
<div class="modal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true" id="modelpostpone">
   	<div class="modal-dialog">
    	<div class="modal-content">
    	</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
</html>
			
