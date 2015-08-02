<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<g:form name="form" url="[action:'search']" class="form" >
    <div class="col-xs-12">
        <div class="col-xs-4 form-group column-custom">
            <label for="code">
                <g:message code="file.code.label" default="Code" />
            </label>
            <g:textField name="code" class="form-control" />
        </div>
    </div>
    <div class="col-xs-8 form-group">
        <label for="title">
            <g:message code="file.title.label" default="Title" />
        </label>
        <g:textField name="title" class="form-control" />
    </div>
    <div class="col-xs-8 form-group ">
        <label for="author">
            <g:message code="file.author.label" />
        </label>
        <g:textField name="author" class="form-control" />
    </div>
    <div class="col-xs-8 form-group ">
        <label for="subject">
            <g:message code="file.subject.label" />
        </label>
        <g:textField name="subject" class="form-control" />
    </div>
    <div class="col-xs-8 form-group ">
        <label for="publisher">
            <g:message code="file.publisher.label" />
        </label>
        <g:textField name="publisher" class="form-control" />
    </div>
    <div class="col-xs-8 form-group ">
        <label for="location">
            <g:message code="file.location.label" />
        </label>
        <g:textField name="location" class="form-control" />
    </div>
    <div class="col-xs-8">
        <div class="col-xs-4 form-group column-custom">
            <label for="periodInit">
                <g:message code="file.periodInit.label" />
            </label>
            <g:textField name="periodInit" class="year form-control" maxlength="4" />
        </div>
        <div class="col-xs-4 form-group">
            <label for="periodEnd">
                <g:message code="file.periodEnd.label" />
            </label>
            <g:textField name="periodEnd" class="year form-control" maxlength="4" />
        </div>
    </div>
    <div class="col-xs-8">
        <div class="col-xs-4 form-group column-custom">
            <label for="order">
                <g:message code="default.order.label" />
            </label>
            <g:select name="order" class="form-control" from="${br.com.library.domain.FileListOrder?.values()}" keys="${br.com.library.domain.FileListOrder.values()}" />
        </div>
    </div>
    <div class="col-xs-12 form-group buttons create">
        <button type="button" class="btn btn-warning">
            <span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span> <g:message code="default.button.clean.label" />
        </button>
        <button type="button" data-form="form" class="btn btn-default submit">
            <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span> <g:message code="default.button.search.label" />
        </button>
    </div>
</g:form>
