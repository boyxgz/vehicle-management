
<%@ page import="com.surelution.vms.Insurer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'insurer.label', default: 'Insurer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.table{width:96%; margin-left:2%;}
			.box-body{padding:13px;}
			.defaultmodalstyle{ width:40%; height:40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
		<section class="content-header">
			<h1><g:message code="default.listInsurer.label" args="[entityName]" /></h1>
			<%--<a href="#list-insurer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--%>
			<%--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
		</section>
		<section class="content">
		<div id="list-insurer" class="box box-info" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="box-body">
				<g:link class="create" action="create" class="btn btn-default" data-toggle="modal" data-target="#insurerCreate"><g:message code="default.new.label" args="[entityName]" /></g:link>
			</div>
			<table class="table table-bordered table-respose">
				<thead>
					<tr>
					
						<g:sortableColumn property="name" class="alink" title="${message(code: 'insurer.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="tel" class="alink" title="${message(code: 'insurer.tel.label', default: 'Tel')}" />
						
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${insurerInstanceList}" status="i" var="insurerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><%--<g:link action="show" id="${insurerInstance.id}"></g:link>--%>${fieldValue(bean: insurerInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: insurerInstance, field: "tel")}</td>
						
						<td>
							<%--<a href="${createLink(action:'delete',id:insurerInstance.id) }" onclick='return confirm("${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}")' class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>--%>
							&nbsp;&nbsp;&nbsp;
							<a href="${createLink(action:'edit',id:insurerInstance.id) }"  class="glyphicon glyphicon-pencil"  title="编辑" data-toggle="modal" data-target="#insurerEdit"></a>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${insurerInstanceTotal}" />
			</div>
		</div>
		</section>
	</div>
	<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="insurerCreate">
	   	<div class="modal-dialog">
	    	<div class="modal-content">
	    	</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="insurerEdit">
	   	<div class="modal-dialog">
	    	<div class="modal-content">
	    	</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<script>
		$(document).ready(function() {
			 $("a[data-target=#insurerCreate]").click(function(event) {
				$(this).data('insurerCreate',null);
			    event.preventDefault();
			    var target = $(this).attr("href"); 
				    $("#insurerCreate").load(target, function() { 
				    	$("#insurerCreate").addClass("defaultmodalstyle")
		                $("#insurerCreate").modal('show');  }); 				    	
				    });
	   	});
		$(document).ready(function() {
			 $("a[data-target=#insurerEdit]").click(function(event) {
				$(this).data('insurerEdit',null);
			    event.preventDefault();
			    var target = $(this).attr("href"); 
				    $("#insurerEdit").load(target, function() { 
				    	$("#insurerEdit").addClass("defaultmodalstyle")
		                $("#insurerEdit").modal('show');  }); 				    	
				    });
	   	});
	</script>
	</body>
</html>
