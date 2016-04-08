<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>转让详细信息</title>
<script type="text/javascript">
</script>
</head>
<body>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">请填写转让车辆详细信息</h4>
        </div>
        <g:uploadForm action="vehicleTransfer" method="post">
		<div class="modal-body">
		  <dl class="dl-horizontal">
						<dt>
							<label for="branch"><g:message
									code="label.vehicle.transferTime" default="转让时间" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
							  <g:textField name="transferTime" value="${new Date().format('yyyy.MM.dd HH:mm')}" id="datetimepicker" class="form-control"/>
						          <script type="text/javascript">
						                $('#datetimepicker').datetimepicker({
						                	isRTL: false,
						                    format: 'yyyy.mm.dd',
						                    autoclose:true,
						                    minView: 'month',
						                    language: 'zh-CN'
											});
						        </script>
							</div>
						</dd>
					</dl>
		    <div>
		   </div>
		    <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.money" default="转让金额"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="money" class="form-control" required/>
							</div>
						</dd>
					</dl>
					 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.contractNO" default="转让合同编号"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="contractNO" class="form-control" required/>
							</div>
						</dd>
					</dl>
		 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.tansferMan" default="接收方"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="tansferMan" class="form-control" required/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.transferReason" default="转让原因" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<textarea class="form-control" name="transferReason" required></textarea>
							</div>
						</dd>
					</dl>
					<input type="hidden" name="vehicleId" value="${params.id}"/>
		 </div>	
		 <div class="modal-footer">		
				<fieldset class="buttons">
					<input type="submit" value="确认转让" onclick="return confirm('确认转让吗？')" class="btn btn-primary"/>
					<button type="button" class="btn btn-primary" data-dismiss="modal" >取消</button>
				</fieldset>
		</div>
		</g:uploadForm>
		
</body>
</html>