
<%@ page import="com.surelution.vms.KeyedMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'keyedMessage.label', default: 'KeyedMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<style type="text/css">
		     .modalstyle{ width: 40%; background-color:#F5F5F5;filter:alpha(opacity=50); margin-left:30%; height:50%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
		</style>
		
		<script type="text/javascript">
		$(function(){
			$("a[data-target=#myModal]").click(function(event) {
				$(this).data('myModal',null)
			    event.preventDefault();
			    var target = $(this).attr("href"); 
				    $("#myModal").load(target, function() { 
				    	$("#myModal").addClass("modalstyle")
	                   $("#myModal").modal('show');  			    	
			    });
			});
			});
		</script>
	</head>
	<body>
	   <div class="content-wrapper">
         <section class="content-header">
				<h1>
					关键字设置 <small></small>
				</h1>
				</section>
	<section class="content">
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"  data-toggle="modal" data-target="#created"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-keyedMessage" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered  table-striped">
				<thead>
					<tr>
					    <th><g:message code="keyedMessage.key.label" default="Key"/></th>
					    <th><g:message code="keyedMessage.description.label" default="Description"/></th>
					    <th><g:message code="keyedMessage.message.label" default="Message"/></th>
					    <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${keyedMessageInstanceList}" status="i" var="keyedMessageInstance">
					<tr>
						<td>${fieldValue(bean: keyedMessageInstance, field: "key")}</td>
						<td>${fieldValue(bean: keyedMessageInstance, field: "description")}</td>
						<td>${fieldValue(bean: keyedMessageInstance, field: "message")}</td>
						<td>
						     <a href="${createLink(action:'delete',controller:'keyedMessage',id:keyedMessageInstance.id)}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><span class="glyphicon glyphicon-trash" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="删除关键字"></span></a>
		 
		&nbsp;&nbsp;
		
		 <g:link rel="external" action="edit" id="${keyedMessageInstance?.id}"  data-toggle="modal" data-target="#myModal">
		 <span class="glyphicon glyphicon-pencil" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="更新关键字"></span></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${keyedMessageInstanceTotal}" />
			</div>
			
			</div>
			</section>
			
			<div class="modal fade" id="created" role="dialog">
                                 <div class="modal-dialog">
                                     <!-- Modal content-->
                                    <div class="modal-content"> 
                                    </div>
                                 </div>
                             </div>	
                             
                             <div class="modal" id="myModal" role="dialog">
                                 <div class="modal-dialog">
                                     <!-- Modal content-->
                                    <div class="modal-content"> 
                                    </div>
                                 </div>
                             </div>	
		</div>
	</body>
</html>
