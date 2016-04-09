
<%@ page import="com.surelution.vms.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jarvis">
	<title>${drivi.name }</title>
	<script src="${resource(dir:'js',file:'bootstrap-tooltip.js') }"></script>
	<style>
		.modalstyle{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; height:35%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
		.edit{ width: 40%; background-color:#F5F5F5; filter:alpha(opacity=50); margin-left:30%; margin-top:5%; border-radius:5px; border: 1px solid #C5CBD7}
	</style>
</head>
<body>
<div class="content-wrapper"><!--  -->
	<section class="content-header" >
		<table>
			<tr>
				<td>
					<g:link action="edit" id="${drivi.id }" data-toggle="modal" data-target="#edit" >
						<input type="button" value="编辑" class="btn btn-default"/>
					</g:link>
				</td>
			</tr>
		</table>
	</section>
	<section class="content">
		<div style="width:50%;">
			<table class="table table-bordered  table-striped">
		        <thead>
		           <tr>
		              <th>名称</th>
		              <th>内容</th>
		           </tr>
		        </thead>
		        <tbody>
		            <tr>
		               <th><g:message code="label.DrivingPermit.dpNO" default="dpNO"/></th>
		               <td> ${drivi.dpNO}</td>
		            </tr>
		            <tr>
		               <th><g:message code="label.DrivingPermit.name" default="name"/></th>
		               <td> ${drivi.name }</td>
		            </tr>
		            <tr>
		               <th><g:message code="label.DrivingPermit.sex" default="sex"/></th>
		               <td>  ${drivi.sex }</td>
		            </tr>
		            <tr>
		               <th> <g:message code="label.DrivingPermit.birthDay" default="birthDay"/></th>
		               <td><g:formatDate date="${drivi.birthDay }" format="yyyy-MM-dd"/></td>
		            </tr>
		            <tr>
		               <th> <g:message code="label.DrivingPermit.dlicense" default="dlicense"/></th>
		               <td>${drivi.dlicense }</td>
		            </tr>
		            <tr>
		               <th><g:message code="label.DrivingPermit.trainingDate" default="trainingDate"/></th>
		               <td> <g:formatDate date="${drivi.trainingDate }" format="yyyy-MM-dd"/></td>
		            </tr>
		            <tr>
		               <th><g:message code="label.DrivingPermit.issueDate" default="issueDate"/></th>
		               <td><g:formatDate date="${drivi.issueDate }" format="yyyy-MM-dd"/></td>
		            </tr>
		            <tr>
		               <th> <g:message code="label.DrivingPermit.score" default="score"/></th>
		               <td> ${drivi.score }</td>
		            </tr>
		             <tr>
		               <th><g:message code="label.DrivingPermit.licensRevoked" default="licensRevoked"/></th>
		               <td>
		               		<g:if test=" ${drivi.licensRevoked }">是</g:if>
		               		<g:else>否</g:else>
		               </td>
		            </tr>
		             <tr>
		               <th><g:message code="label.DrivingPermit.revokeDate" default="revokeDate"/></th>
		               <td><g:formatDate  date="${drivi.revokeDate }" format="yyyy-MM-dd HH:mm"/></td>
		            </tr>
		             <tr>
		               <th><g:message code="label.DrivingPermit.delayTo" default="delayTo"/></th>
		               <td><g:formatDate date="${drivi.delayTo }" format="yyyy-MM-dd"/></td>
		            </tr>
		            <tr>
		               <th><g:message code="label.DrivingPermit.borrowNum" default="borrowNum"/></th>
		               <td>  ${drivi.borrowNum }</td>
		            </tr>
		            <tr>
		               <th><g:message code="label.DrivingPermit.dlligle" default="dlligle"/></th>
		               <td>  ${drivi.dlligle }</td>
		            </tr>
		            <tr>
		               <th><g:message code="label.DrivingPermit.description" default="description"/></th>
		               <td><g:textArea name="description" style="width:100%; height:80px;" readonly="readonly">${drivi.description }</g:textArea> </td>
		            </tr>
		            <tr>
		            	<td><b>操作</b></td>
		            	<td>
		            		<g:link  rel="external" data-toggle="modal" data-target="#modelpostpone" action="updatimepostpone" id="${drivi.id}">
				          		<input type="button" class="btn btn-primary" value="延期操作">   
				 			</g:link>
				 			<a href="${createLink(action:'updatimerevoke',id:drivi.id) }" data-toggle="modal" data-target="#revoke"  class="btn btn-primary">吊销操作</a>           	
		            	</td>
		            </tr>
		        </tbody>
		     </table>
	     </div>
	     
	     <div style="position:absolute; right:80px; top:114px;">
	     	<img alt="" src="${createLink(action:'showPic',id:drivi?.id) }" style="max-width:400px;">
	     </div>
	</section>
</div>
<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="modelpostpone">
   	<div class="modal-dialog">
    	<div class="modal-content">
    	</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="revoke">
   	<div class="modal-dialog">
    	<div class="modal-content">
    	</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="edit">
   	<div class="modal-dialog">
    	<div class="modal-content">
    	</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
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
	 $(document).ready(function() {
		 $("a[data-target=#revoke]").click(function(event) {
			$(this).data('revoke',null);
		    event.preventDefault();
		    var target = $(this).attr("href"); 
			    $("#revoke").load(target, function() { 
			    	$("#revoke").addClass("modalstyle")
	                $("#revoke").modal('show');  }); 				    	
			    });
    });
	 $(document).ready(function() {
		 $("a[data-target=#edit]").click(function(event) {
			$(this).data('edit',null);
		    event.preventDefault();
		    var target = $(this).attr("href"); 
			    $("#edit").load(target, function() { 
			    	$("#edit").addClass("edit")
	                $("#edit").modal('show');  }); 				    	
			    });
    });
</script>
</body>
</html>
			
