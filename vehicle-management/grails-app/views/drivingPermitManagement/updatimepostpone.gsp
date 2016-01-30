<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>更新时间</title>
<script src="${resource(dir:'js',file:'bootstrap.js') }"></script>
</head>

<body>
	<div class="modal-header" style="height:20px; border:0px solid #000; text-align:center; font-size:20px; font-weight:bold;">延期时长</div>
	<g:uploadForm action="updatepostpone">
	<div class="modal-body" style="margin-top:30px;">
	<dl class="dl-horizontal" style="margin-left:-80px;">
			<dt>
			<label for="branch">
				<g:message code="label。DivingPermit.time" default="时间选择" />
			</label>
			</dt>
			
			<dd>
				<div class="col-xs-6">
					<g:textField value="${params.delayTo }" name="delayTo" id="datetimepicker" class="form-control col-xs-4" />
					<script type="text/javascript">
					$('#datetimepicker').datetimepicker({
						isRTL:false,
						format:'yyyy.mm.dd',
						autoclose:true,
						minView:'month',
						language:'zh-CN'
					});
					</script>
				</div>
			</dd>
		</dl>
		
		<input type="hidden" value="${params.id}" name="delayToid">	
	</div>
	<div class="modal-footer">
	<fieldset class="buttons">
		<g:actionSubmit class="save move btn btn-default" action="updatepostpone" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
			
		<input type="button" class="btn btn-default" data-dismiss="modal" value="取消" />
		 
		</fieldset>
	</div>
	</g:uploadForm>
</body>
</html>
