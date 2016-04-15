
<%@ page import="com.surelution.vms.Insure" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'insure.label', default: 'Insure')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			.table{width:96%; margin-left:2%;}
			.box-body{padding:13px;}
			.defaultmodalstyle{ width:40%; height:auto; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
			.pagination{position: relative; top: 84%; left: 50%;}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
		<section class="content-header">
			<h2><g:message code="default.list.label" args="[entityName]" /></h2>
		</section>
		<section class="content">
		<div id="list-insure" class="box box-info" role="main">
			<div class="box-body">
			<table style="width:40%;">
				<tr>
					<td align="left">
						<g:link class="create" action="create" class="btn btn-default" data-toggle="modal" data-target="#insureCreate"><g:message code="default.new.label" args="[entityName]" /></g:link>
					</td>
					<td align="left">
						<g:select name="states" id="states" value="${states.name() }" from="${Insure.InsureState.values()}" class="form-control" keys="${Insure.InsureState.values()*.name()}" />
						<script type="text/javascript">
							$("#states").change(function(){
								var value = $("#states").val();
								if(value == "VALID"){
									location.href = "${createLink(action:'list',id:"VALID")}";
								}else if(value == "EXPIRE"){
									location.href = "${createLink(action:'list',id:"EXPIRE")}";
								}else{
									location.href = "${createLink(action:'list')}";
								}
							});
						</script>
					</td>
				</tr>
			</table>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-respose">
				<thead>
					<tr>
						<g:sortableColumn class="alink" property="insureContractNo" title="${message(code: 'insure.insureContractNo.label', default: 'Insure Contract No')}" />
						
						<th>保险机构</th>
						
						<th>缴纳保费</th>
						
						<g:sortableColumn class="alink" property="effectivedAt" title="${message(code: 'insure.effectivedAt.label', default: 'Effectived At')}" />
					
						<g:sortableColumn class="alink" property="expiredAt" title="${message(code: 'insure.expiredAt.label', default: 'Expired At')}" />
					
						<g:sortableColumn class="alink" property="firstInsure" title="${message(code: 'insure.firstInsure.label', default: 'First Insure')}" />
					
						<g:sortableColumn class="alink" property="insureMan" title="${message(code: 'insure.insureMan.label', default: 'Insure Man')}" />
						
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${insureInstanceList}" status="i" var="insureInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${insureInstance.id}">${fieldValue(bean: insureInstance, field: "insureContractNo")}</g:link></td>
					
						<td>${insureInstance?.insurer?.name }</td>
						
						<td>${insureInstance?.insureMoney }</td>
						<td><g:formatDate date="${insureInstance.effectivedAt}" format="yyyy.MM.dd"/></td>
					
						<td><g:formatDate date="${insureInstance.expiredAt}" format="yyyy.MM.dd"/></td>
					
						<td><g:formatBoolean boolean="${insureInstance.firstInsure}" /></td>
					
						<td>${fieldValue(bean: insureInstance, field: "insureMan")}</td>
						
						<td>
							<%--<a href="${createLink(controllers:'Insure',action:'delete',id:insureInstance.id) }" onclick='return confirm("${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}")' class="glyphicon glyphicon-trash" data-toggle="tooltip" title="删除"></a>--%>
							&nbsp;&nbsp;&nbsp;
							<a href="${createLink(controllers:'Insure',action:'edit',id:insureInstance.id) }"  class="glyphicon glyphicon-pencil"  title="编辑" data-toggle="modal" data-target="#insureEdit"></a>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${insureInstanceTotal}" />
			</div>
		</div>
		</section>
	</div>
		<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="insureCreate">
	   	<div class="modal-dialog">
	    	<div class="modal-content">
	    	</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="insureEdit">
	   	<div class="modal-dialog">
	    	<div class="modal-content">
	    	</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<script>
		$(document).ready(function() {
			 $("a[data-target=#insureCreate]").click(function(event) {
				$(this).data('insureCreate',null);
			    event.preventDefault();
			    var target = $(this).attr("href"); 
				    $("#insureCreate").load(target, function() { 
				    	$("#insureCreate").addClass("defaultmodalstyle")
		                $("#insureCreate").modal('show');  }); 				    	
				    });
	   	});
		$(document).ready(function() {
			 $("a[data-target=#insureEdit]").click(function(event) {
				$(this).data('insureEdit',null);
			    event.preventDefault();
			    var target = $(this).attr("href"); 
				    $("#insureEdit").load(target, function() { 
				    	$("#insureEdit").addClass("defaultmodalstyle")
		                $("#insureEdit").modal('show');  }); 				    	
				    });
	   	});
	</script>
	</body>
</html>
