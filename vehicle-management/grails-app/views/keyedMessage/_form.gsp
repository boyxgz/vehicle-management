<%@ page import="com.surelution.vms.KeyedMessage" %>


<dl class="dl-horizontal">
	<dt>
		<label for="key"> <g:message code="keyedMessage.key.label"
				default="Key" />

		</label>
	</dt>
	<dd>
		<div class="col-xs-8">
			<g:textField name="key" value="${keyedMessageInstance?.key}" class="form-control"/>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label for="description">
		<g:message code="keyedMessage.description.label" default="Description" />
		
	   </label>
	</dt>
	<dd>
		<div class="col-xs-8">
			<g:textField name="description" value="${keyedMessageInstance?.description}" class="form-control"/>
		</div>
	</dd>
</dl>

<dl class="dl-horizontal">
	<dt>
		<label for="message">
		  <g:message code="keyedMessage.message.label" default="Message" />
    	</label>
	</dt>
	<dd>
		<div class="col-xs-8">
		   <g:textField name="message" value="${keyedMessageInstance?.message}" class="form-control"/>
		</div>
	</dd>
</dl>


