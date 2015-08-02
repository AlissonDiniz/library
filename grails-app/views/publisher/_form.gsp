<%@ page import="br.com.library.domain.Publisher" %>

<div class="col-xs-8 form-group ${hasErrors(bean: publisherInstance, field: 'name', 'has-error')}">
    <label for="name">
        <g:message code="publisher.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" class="validate required form-control" value="${publisherInstance?.name}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: publisherInstance, field: 'address', 'has-error')}">
    <label for="address">
        <g:message code="publisher.address.label" default="address" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="address" class="validate required form-control" value="${publisherInstance?.address}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: publisherInstance, field: 'note', 'has-error')}">
    <label for="note">
        <g:message code="publisher.note.label" default="Note" />
    </label>
    <g:textArea name="note" class="form-control" rows="5" cols="40" value="${publisherInstance?.note}" />
</div>
<g:hiddenField name="owner" value="${sec.loggedInUserInfo(field:'username')}" />

