<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>更新时间</title>
<script src="${resource(dir:'js',file:'bootstrap.js') }"></script>
</head>

<body>
	<div class="modal-header" style="height:20px; border:0px solid #000; text-align:center; font-size:20px; font-weight:bold;">准驾证吊销</div>
	<g:uploadForm action="updaterevoke">
	<div class="modal-body" style="margin-top:30px;">
			<p align="center">确认吊销</p>
			<input type="hidden" value="${params.id }"name="revokeId">
	</div>
	<div class="modal-footer">
	<fieldset class="buttons">
		<g:actionSubmit class="save move btn btn-default" action="updaterevoke" value="吊销"/>
			
		<input type="button" class="btn btn-default" data-dismiss="modal" value="取消" />
		 
		</fieldset>
	</div>
	</g:uploadForm>
</body>
</html>
