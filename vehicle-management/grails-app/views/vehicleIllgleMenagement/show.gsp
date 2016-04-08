<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>准驾证信息</title>
</head>
<body>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">违章凭证</h4>
        </div>
		<div class="modal-body">
	        <img src="${createLink(action:'showPic',id:params.id)}" style="width: 300px; height:300px; margin-left:20%;"/>
		 </div>	
		 <div class="modal-footer">		
				<fieldset class="buttons">
					<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
				</fieldset>
		</div>
	
</body>
</html>