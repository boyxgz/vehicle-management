<%@page import="com.surelution.vms.DrivingPermit"%>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body>
	  <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">修改${drivi.name }的信息</h4>
        </div>
        <g:uploadForm action="update" method="post" >
         <div class="modal-body">
				<g:hiddenField name="id" value="${drivi?.id}" />
				<g:hiddenField name="version" value="${drivi?.version}" />
				<div>
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.dpNO" default="dpNO" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <g:textField name="dpNO" id="dpNO" value="${drivi?.dpNO}" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.name" default="name" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <g:textField name="name" id="name" value="${drivi?.name}" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.sex" default="sex" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <g:select name="sex" value="${drivi?.sex.name() }" from="${DrivingPermit.Sex.values()}" class="form-control" keys="${DrivingPermit.Sex.values()*.name()}" />
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.birthDay" default="sex" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <input type="text" name="birthDay" id="birthDay" value="<g:formatDate date="${drivi?.birthDay}" format="yyyy-MM-dd"/>" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.dlicense" default="dlicense" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <g:textField name="dlicense" id="dlicense" value="${drivi?.dlicense}" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.score" default="score" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <g:textField name="score" id="score" value="${drivi?.score}" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.trainingDate" default="trainingDate" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="trainingDate" id="trainingDate" value="<g:formatDate date="${drivi?.trainingDate}" format="yyyy-MM-dd"/>" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.issueDate" default="issueDate" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <input type="text" name="issueDate" id="issueDate" value="<g:formatDate date="${drivi?.issueDate}" format="yyyy-MM-dd"/>" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.revokeDate" default="revokeDate" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <input type="text" name="revokeDate" id="revokeDate" value="<g:formatDate date="${drivi?.revokeDate}" format="yyyy-MM-dd"/>" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.delayTo" default="delayTo" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <input type="text" name="delayTo" id="delayTo" value="<g:formatDate date="${drivi?.delayTo}" format="yyyy-MM-dd"/>" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="image"> <g:message code="label.DrivingPermit.permitPic"
									default="permitPic" />
							</label>
							<span class="required-indicator">*</span>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="file" id="permitPic" name="permitPic" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="name">
					        	<g:message code="label.DrivingPermit.description" default="description" />
					        	<span class="required-indicator">*</span>
					        </label>
						</dt>
						<dd>
							<div class="col-xs-8">
							    <textarea name="description" id="description"  class="form-control">${drivi?.description}</textarea>
							</div>
						</dd>
					</dl>
				</div>
		</div>			
        <div class="modal-footer">
       		<g:actionSubmit class="save btn btn-primary" action="update" value="提交" />
          	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
     </g:uploadForm>
	</body>
</html>
