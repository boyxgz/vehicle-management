<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>准驾证信息</title>
</head>
<body>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">请确认保养信息</h4>
        </div>
        <g:form>
		<div class="modal-body">
		  <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.reason" default="准驾证号" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="drivingPermit" class="form-control"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.reason" default="送保人" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="drivingPermit" class="form-control"/>
							</div>
						</dd>
					</dl>
		    <div>
		   </div>

		 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.returnTime" default="保养项目"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="maintainItem" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.reason" default="保养费用" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="maintainFee" class="form-control"/>
							</div>
						</dd>
					</dl>
		 
		 </div>	
		 <div class="modal-footer">		
				<fieldset class="buttons">
					<input type="submit" value="确认保养" onclick="return confirm('确认保养吗？')" class="btn btn-default"/>
					<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
				</fieldset>
		</div>
		</g:form>
</body>
</html>