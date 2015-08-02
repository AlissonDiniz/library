<%@ page import="br.com.library.domain.Subject" %>

<div class="col-xs-8 form-group ${hasErrors(bean: subjectInstance, field: 'code', 'has-error')}">
    <label for="code">
        <g:message code="subject.code.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="code" class="validate required form-control" value="${subjectInstance?.code}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: subjectInstance, field: 'name', 'has-error')}">
    <label for="name">
        <g:message code="subject.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" class="validate required form-control" value="${subjectInstance?.name}"/>
    <span class="glyphicon glyphicon-exclamation-sign form-control-feedback" title="" data-message-required="${message (code: "default.field.required")}" data-message-required="${message (code: "default.field.required")}" aria-hidden="true"></span>
</div>

<div class="col-xs-8 form-group ${hasErrors(bean: subjectInstance, field: 'note', 'has-error')}">
    <label for="note">
        <g:message code="subject.note.label" default="Note" />
    </label>
    <g:textArea name="note" class="form-control" rows="5" cols="40" value="${subjectInstance?.note}" />
</div>
<g:hiddenField name="owner" value="${sec.loggedInUserInfo(field:'username')}" />

