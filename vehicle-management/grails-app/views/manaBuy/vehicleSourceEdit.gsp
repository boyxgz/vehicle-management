<!DOCTYPE html>
<%@ page import="com.surelution.vms.Vehicle" %>
<html>
	<head>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<style>
			.modal-header{height:50px;}
			.-left{margin-left:-16px;}
		</style>
	</head>
	<body>
		<div class="modal-header">
			<h4>编辑车辆信息</h4>
		</div>
		<g:uploadForm method="post" action="vehicleSourceUpdate" id="${vehicleSource?.id }">
		<div class="modal-body">
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.vehicleNO" default="vehicleNO" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<div class="col-xs-8 -left">
						<table>
							<tr>
								<td>
									<g:select name="province" value="${vehicleSource?.province?.name }" from="${com.surelution.vms.Province.list() }" class="form-control" optionKey="id" optionValue="name" required="" style="width:65px;"/>
								</td>
								<td>
									<g:select name="areaCode" value="${vehicleSource?.areaCode }" from="${'A'..'Y'}" class="form-control" keys="" style="width:65px;"/>
								</td>
								<td>
									<input type="text" name="no" value="${vehicleSource?.no }" class="form-control" required="required" style="width:200px;"/>
								</td>
							</tr>
						</table>
					</div>
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.vehicleType" default="vehicleType" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="vehicleType" name="vehicleType" value="${vehicleSource?.vehicleType }" required="required" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.vehicleBrand" default="vehicleBrand" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="vehicleBrand" name="vehicleBrand" value="${vehicleSource?.vehicleBrand }" required="required" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.vehicleModel" default="vehicleModel" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="vehicleModel" name="vehicleModel" value="${vehicleSource?.vehicleModel }" required="required" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.carFrame" default="carFrame" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="carFrame" name="carFrame" value="${vehicleSource?.carFrame }" required="required" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.price" default="price" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="price" name="price" value="${vehicleSource?.vehicleBrand }" required="required" />
				</dd>
			</dl>
			<%--<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.title" default="title" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="title" name="title" value="${vehicleSource?.vsource?.title }" required="required" />
				</dd>
			</dl>--%>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.manufacturer" default="manufacturer" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="manufacturer" name="manufacturer" value="${vehicleSource?.vsource?.manufacturer }" required="required" />
				</dd>
			</dl>
			<g:if test="${vehicleSource?.vsource?.title == '购买' }">
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.gotDateBuy" default="gotDateBuy" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="gotDateBuy" name="gotDateBuy" value="<g:formatDate date="${vehicleSource?.vsource?.gotDate }" format="yyyy.MM.dd" />" required="required" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.buyMan" default="buyMan" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="buyMan" name="buyMan" value="${vehicleSource?.vsource?.buyMan }"/>
				</dd>
			</dl>
				<g:if test="${vehicleSource?.transfer?.isTransfer==true}">
					<dl class="dl-horizontal">
						<dt>
							<label class="brach">
								<g:message code="label.vehicle.transferDate" default="transferDate" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<input type="text" class="form-control" id="transferDate" name="transferDate" value="<g:formatDate date="${vehicleSource.transfer?.transferDate}" format="yyyy.MM.dd" />" required="required" />
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label class="brach">
								<g:message code="label.vehicle.transferMan" default="transferMan" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<input type="text" class="form-control" id="transferMan" name="transferMan" value="${vehicleSource.transfer?.transferMan}" required="required" />
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label class="brach">
								<g:message code="label.vehicle.transferReason" default="transferReason" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<input type="text" class="form-control" id="transferReason" name="transferReason" value="${vehicleSource.transfer?.transferReason}" required="required" />
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label class="brach">
								<g:message code="label.vehicle.money" default="money" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<input type="text" class="form-control" id="money" name="money" value="${vehicleSource.transfer?.money }" required="required" />
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label class="brach">
								<g:message code="label.vehicle.contractNO" default="contractNO" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<input type="text" class="form-control" id="contractNO" name="contractNO" value="${vehicleSource.transfer?.contractNO }" required="required" />
						</dd>
					</dl>
				</g:if>
				<g:if test="${vehicleSource?.scrapped?.isScrapped==true}">
					<dl class="dl-horizontal">
						<dt>
							<label class="brach">
								<g:message code="label.vehicle.scrapTime" default="scrapTime" />
								<span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<input type="text" class="form-control" id="scrapTime" name="scrapTime" value="<g:formatDate date="${vehicleSource.scrapped?.scrapTime}" format="yyyy.MM.dd" />" required="required" />
						</dd>
					</dl>
	           	</g:if>
			</g:if>
			<g:elseif test="${vehicleSource?.vsource?.title == '租赁'}">
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.gotDateRent" default="gotDateRent" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="gotDateRent" name="gotDateRent" value="<g:formatDate date="${vehicleSource?.vsource?.gotDate }" format="yyyy.MM.dd" />" required="required" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.rentTo" default="rentTo" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="rentTo" name="rentTo" value="${vehicleSource?.vsource?.rentTo }" required="required" />
				</dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.rentMan" default="rentMan" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="text" class="form-control" id="rentMan" name="rentMan" value="${vehicleSource?.vsource?.rentMan }"/>
				</dd>
			</dl>
			</g:elseif>
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.vehiclePtot" default="vehiclePhoto" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="file" class="form-control" id="vehiclePhoto" name="vehiclePhoto"/>
				</dd>
			</dl>
			<g:if test="${vehicleSource?.vsource?.title == '购买' }">
			<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.billPhoto" default="billPhoto" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="file" class="form-control" id="billPhoto" name="billPhoto"/>
				</dd>
			</dl>
			</g:if>
			<g:elseif test="${vehicleSource.vsource.title=='租赁' }">
				<dl class="dl-horizontal">
				<dt>
					<label class="brach">
						<g:message code="label.vehicle.rentPhoto" default="rentPhoto" />
						<span class="required-indicator">*</span>
					</label>
				</dt>
				<dd>
					<input type="file" class="form-control" id="rentPhoto" name="rentPhoto" />
				</dd>
			</dl>
			</g:elseif>
		</div>
		<div class="modal-footer">
			<input type="submit" name="submit" value="提交" class="btn btn-default"/>
			<input type="button" name="close" value="取消" data-dismiss="modal" class="btn btn-default"/>
		</div>
		</g:uploadForm>
	</body>
</html>
