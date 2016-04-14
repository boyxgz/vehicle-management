<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.surelution.vms.Vehicle" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
</head>
<body>
  <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">车辆报废信息确认</h4>
        </div>
        <g:uploadForm action="vehicleScrapped" method="post">
		<div class="modal-body">
		  <dl class="dl-horizontal">
						<dt>
							<label for="branch"><g:message
									code="label.vehicle.scrappedTime" default="报废时间" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
							  <g:textField name="scrappedTime" value="${new Date().format('yyyy.MM.dd HH:mm') }" id="datetimepicker" class="form-control"/>
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
									code="label.vehicle.vehicleNO" default="车牌号码"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleNO" value="${Vehicle.vehicleNO(vehicle)}" class="form-control" readonly="readonly"/>
							</div>
						</dd>
					</dl>
					 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehicleType" default="车型大小"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleType" value="${vehicle.vehicleType }" class="form-control" readonly="readonly"/>
							</div>
						</dd>
					</dl>
		 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehicleBrand" default="厂牌型号"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleBrand" value="${vehicle.vehicleBrand }" class="form-control" readonly="readonly"/>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.price" default="价格" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text"  value="${vehicle.price }"  class="form-control"   name="price" readonly="readonly"></textarea>
							</div>
						</dd>
					</dl>
					<input type="hidden" name="vehicleId" value="${params.id}"/>
		 </div>	
		 <div class="modal-footer">		
				<fieldset class="buttons">
					<input type="submit" value="确认报废" onclick="return confirm('确认报废吗？')" class="btn btn-default"/>
					<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
				</fieldset>
		</div>
		</g:uploadForm>
</body>
</html>