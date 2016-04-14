<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>准驾证信息</title>

<script type="text/javascript">
      function compare(){
        var expectTime = $(".rl").val();
        var borrowTime = $(".fl").val();
        var expect = new Date(expectTime.replace(" ", "T").replace(".", "-").replace(".", "-") + ":00");
        var borrow = new Date(borrowTime.replace(" ", "T").replace(".", "-").replace(".", "-") + ":00");
        if(borrow>expect){
              $("#mess").html("预计归还时间应该大于借车时间！")
              $("#sub").prop('disabled', true);
            }else{
            	$("#mess").html("");
                $("#sub").prop('disabled', false);
                }
      }

</script>
</head>
<body>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">请将准驾证放置在读卡器上或输入准驾证号</h4>
        </div>
        <g:uploadForm action="lendVehicle" method="post">
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
								<div style="width:70%;float:left;"><input type="text" name="drivingPermit" id="drivingPermit" value="${params.drivingPermit }" class="form-control" onchange="check()"/></div>
								<div style="float:left;"><input type="button" class="btn btn-primary" value="提交" onclick="check()"/></div>
							</div>
						</dd>
					</dl>
		    <div>
		   </div>
		   
		     <span id="message" style="margin-left:10%;"></span>
         <h4 style="border-bottom: 1px solid grey;"></h4>
		 <table class="table table-bordered" style="width: 80%;margin-left:10%;">
		    <thead>
		       <tr>
		          <td>驾驶员姓名</td>
		          <td>驾驶证号</td>
		          <td>准驾证号</td>
		          <td>准驾证状态</td>
		       </tr>
		    </thead>
		    <tbody>
		       <tr>
		          <td id="name"></td>
		          <td id="dlicense"></td>
		          <td id="dpNO"></td>
		          <td id="status"></td>
		       </tr>
		    </tbody>
		 </table>
		 
		 <input type="hidden" id="dpId" name="dpId">
		 <input type="hidden" value="${params.id}" name="vehicleId"/>
		 
		 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.borrowTime" default="车辆借出时间"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
						   
						
							<div class="col-xs-8">
								<g:textField name="borrowTime" value="${new Date().format('yyyy.MM.dd HH:mm')}" id="datetimepicker" class="form-control fl" required=""/>
								<script type="text/javascript">
									$('#datetimepicker').datetimepicker({
										isRTL : false,
										format : 'yyyy.mm.dd hh:ii',
										autoclose : true,
										minView : 'hour',
										language : 'zh-CN'
									});
								</script>
							</div>
						</dd>
					</dl>
		 
		 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.expectReturnTime" default="预计归还时间"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:textField name="expectReturnTime" value="${params.expectReturnTime}"
									id="datetimepicker5" class="form-control rl" onchange="compare()" required=""/>
								<script type="text/javascript">
									$('#datetimepicker5').datetimepicker({
										isRTL : false,
										format : 'yyyy.mm.dd hh:ii',
										autoclose : true,
										minView : 'hour',
										language : 'zh-CN'
									});
								</script>
								<span id="mess" style="color: red;"></span>
							</div>
						</dd>
					</dl>
					
					
					
					
					<%--<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.receiveMile" default="接车里程数" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" class="form-control" name="receiveMile"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.receivePic" default="接车里程数照片" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="file" class="form-control" name="receivePic"/>
							</div>
						</dd>
					</dl>--%>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.reason" default="出借事由" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<textarea class="form-control" name="reason" required=""></textarea>
							</div>
						</dd>
					</dl>
		 </div>	
		 <div class="modal-footer">		
				<fieldset class="buttons">
					<input type="submit" id="sub" value="确认借出" onclick="return comfirm('确认提交吗？')" class="btn btn-primary" disabled="disabled"/>
					<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
				</fieldset>
		</div>
		</g:uploadForm>
		
		<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script type="text/javascript">
        function check(){
        	var drivingPermit = $("#drivingPermit").val();
        	//alert(drivingPermit);
            var url ="${createLink(action:'checkDrivingPermit',controller:'vehicleUse')}";
            $.ajax({
	        type :"post",
	        url :url , 
	        data: {
	        	drivingPermit:drivingPermit
	        },
	        dataType : "json",
	        success : function(data) { 
		        if(data==false){
                  	$("#message").html("该准驾证不可用，请检查准驾证信息！")
                  	$("#sub").prop('disabled', true);
                  	$("#dpId").val(" ");
		    	    $("#name").html(" ");
			        $("#dlicense").html(" ");
			        $("#dpNO").html(" ");
			        $("#status").html(" ");
			    }else{
			        $("#dpId").val(data[0].id);
			        $("#name").html(data[0].name);
			        $("#dlicense").html(data[0].dlicense);
			        $("#dpNO").html(data[0].dpNO);
			        $("#status").html(data[0].enabled);
			        $("#message").html("");
			        $("#sub").prop('disabled', false);
		        }
	        }  
	    });  
            }
      </script>
</body>
</html>