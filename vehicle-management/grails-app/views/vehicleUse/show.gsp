<%@page import="com.surelution.vms.Vehicle"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>借车信息记录</title>
<script type="text/javascript">
	var input;
	var wrap;
	var key;
	$(document).ready(function(){
		input = $("#key");
		wrap = $("#showList");
		key = "";
		input.keyup(function(){
			sendKeyWord(event);
		});
		input.blur(function(){
			setTimeout(function(){
				wrap.hide();
				},100)
		});
	});
	//在输入框中输入内容触发事件,1、当键入字符的时候；2、当键入上下方向键时。
	function sendKeyWord(event){
		if(wrap.css('display')=='block'&&event.keyCode == 38||event.keyCode == 40){ 
			var current = wrap.find("li.hover");
			if(event.keyCode == 38){
				if(current.length > 0){
					var front = current.removeClass("hover").prev();
					if(front.length > 0){
						front.addClass("hover");
						input.val(front.html());
					}
				}else{
					var last = wrap.find("li:last");
					last.addClass("hover");
					input.val(last.html());
				}
			}else if(event.keyCode == 40){
				if(current.length > 0){
					var bock = current.removeClass("hover").next();
					if(bock.length > 0){
						bock.addClass("hover");
						input.val(bock.html());
					}
				}else{
					var first = wrap.find("li:first");
					first.addClass("hover");
					input.val(first.html());
				}
			}
	    }else{   
	        var valText = $.trim(input.val());
	        if(valText ==''||valText==key){  
	            return;  
	        }
	        sendKeyWordToBack(valText);  
	        key = valText;  
	    }
	}
	
	//实例化输入提示的JS,参数为进行查询操作时要调用的函数名  
	//参数为一个字符串，是搜索输入框中当前的内容  
	function sendKeyWordToBack(keyword){
		var obj = {"keyword":keyword};
		var dataOut = [];
		var i = 0;
		$.ajax({
			url:"${createLink(controller:'VehicleUse',action:'pushData')}",
			async:false,
			data:obj,
			dataType:"json",
			success: function(data){
				$.each(data,function(){
					dataOut[i] = this.vehicle;
					i++;
				});
			}
		});
		dataDisplay(dataOut);
		  
	}
	
	//请求返回后，执行数据展示  
	function dataDisplay(data){  
	    if(data.length<=0){  
	        wrap.hide();  
	        return;  
	    }  
	      
	    //往搜索框下拉建议显示栏中添加条目并显示  
	    var li;  
	    var tmpFrag = document.createDocumentFragment();  
	    wrap.find('ul').html('');  
	    for(var i=0; i<data.length; i++){  
	        li = document.createElement('LI');  
	        li.innerHTML = data[i];  
	        tmpFrag.appendChild(li);  
	    }  
	    wrap.find('ul').append(tmpFrag);  
	    wrap.show();
	      
	    //为下拉选项绑定鼠标事件  
	    //hover(functionIn,functionOut),当鼠标悬停在标签上产生的事件 
	    wrap.find('li').hover(function(){  
	    	wrap.find('li').removeClass('hover');  
	            $(this).addClass('hover');  
	        },function(){  
	            $(this).removeClass('hover');  
	    }).bind('click',function(){  
	        input.val(this.innerHTML);  
	        wrap.hide(100);  
	    });  
	}  
</script>
<style>
	li.hover{background-color:red;}
	ul{border:1px solid red;}
	li{list-style: none;}
	#showList{    
			position: absolute;
		    top: 85px;
		    left: 98px;
		    background-color: #FFF;
		    border-radius: 0.5em;
		    line-height: 1.4;
		    min-width:22%;
	}
</style>
</head>
<body>
	<div class="body">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					借车登记 <small></small>
				</h1>
			</section>
			<section class="content">
			   <div class="box box-info">
                  <div class="box-header with-border">
                     <h4 class="box-title">车辆查询</h4>
                  </div>
                  <div class="box-body">
                  <g:form action="show">
                      <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.vehicleNO" default="车牌号" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                  <input type="text" name="vehicleNO" id="key" value="${params.vehicleNO }" class="form-control">
	                               </div>
		                           <div id="showList"><ul></ul></div>
	                            </dd>
	                        </dl>
	                        
	                <fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: '查询')}" />
					</fieldset>
					</g:form>
                  </div>
                </div>
                
                <table class="table table-bordered  table-striped">
                    <thead>
                         <tr>
                            <th><g:message code="chepaihao" default="车牌号"/></th>
                            <th><g:message code="chexing" default="车型"/></th>
                            <th><g:message code="xinghao" default="发动机号"/></th>
                            <th>厂牌型号</th>
                            <th><g:message code="zhuangtai" default="车辆使用状态"/></th>
                            <th><g:message code="weixiu" default="维修状态"/></th>
                            <th><g:message code="caozuo" default="操作"/></th>
                         </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vehicleList}" var="vehicle">
                        <tr>
                            <td>${vehicle?.vehicleNO}</td>
                            <td>${vehicle?.vehicleType}</td>
                            <td>${vehicle?.vehicleModel }</td>
                            <td>${vehicle?.vehicleBrand }</td>
                            <td>
                                <g:if test="${vehicle?.inuse==true}">正在使用</g:if>
                                <g:else>可以使用 </g:else>
                            </td>
                            <td>${vehicle?.statu}</td>
                            <td>
                               <g:if test="${vehicle?.inuse==false && vehicle?.stopRent==null && vehicle?.transfer==null && vehicle?.scrapped==null}">
                                  <a href="${createLink(action:'showDrivingPermit',id:vehicle.id) }" rel="external" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#customerModal">出借</a>
                               </g:if>
                               <g:elseif test="${vehicle?.stopRent?.isStopRent==true}">
                                  <a href="" class="btn btn-default btn-sm">该车已经停止租赁</a>
                               </g:elseif>
                               <g:elseif test="${vehicle?.transfer?.isTransfer==true }">
                                  <a href="" class="btn btn-default btn-sm">该车已经转让</a>
                               </g:elseif>
                               <g:elseif test="${vehicle?.scrapped?.isScrapped==true }">
                                  <a href="" class="btn btn-default btn-sm">该车已经报废</a>
                               </g:elseif>
                               <g:else>
                                  <a href="${createLink(action:'showlend',id:vehicle.id)}"   class="btn btn-default btn-sm">车辆已经借出</a>
                               </g:else>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                
                <div class="modal" id="customerModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>
			</section>
   </div>
  </div>
</body>
</html>