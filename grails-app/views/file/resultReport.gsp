<!DOCTYPE html>
<html>
    <head>
        <title><g:message code="file.result-report.label" /></title>
    <r:require module="bootstrap"/>
    <r:require module="resultReport"/>
    <r:layoutResources/>
</head>
<body>
    <div class="report-wrapper">
        <div class="header">
            <div class="logo-header">
                <g:img dir="images" file="maac-logo.jpg" />
            </div>
            <h3><g:message code="file.result-report.label" /></h3>
        </div>
        <div class="content">
            <g:if test="${params.detail}">
                <table align="center" class="table" cellpadding="5" cellspacing="0">
                    <thead>
                        <tr>
                            <td width="70px"><g:message code="file.code.label" /></td>
                            <td width="200px"><g:message code="file.name.label" /></td>
                            <td width="200px"><g:message code="file.title.label" /></td>
                            <td width="80px"><g:message code="file.edition.label" /></td>
                            <td width="80px" style="font-size: 10px"><g:message code="file.location.label" /></td>
                            <td width="80px" style="font-size: 10px"><g:message code="file.type.label" /></td>
                            <td><g:message code="file.note.label" /></td>
                            <td width="70px" class="center" style="font-size: 10px"><g:message code="default.owner.label" /></td>
                            <td width="90px" class="center"><g:message code="default.dateCreated.label" /></td>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${fileInstanceList}" status="i" var="fileInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td>${fieldValue(bean: fileInstance, field: "code")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "name")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "title")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "edition")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "location")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "type.name")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "note")}</td>
                                <td class="center">${fieldValue(bean: fileInstance, field: "owner")}</td>
                                <td class="center small"><g:formatDate date="${fileInstance.dateCreated}" format="${message (code: "default.datetime.format")}" /></td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </g:if>
            <g:else>
                <table align="center" class="table" cellpadding="5" cellspacing="0">
                    <thead>
                        <tr>
                            <td width="70px"><g:message code="file.code.label" /></td>
                            <td width="200px"><g:message code="file.name.label" /></td>
                            <td width="200px"><g:message code="file.title.label" /></td>
                            <td width="80px"><g:message code="file.edition.label" /></td>
                            <td width="100px" style="font-size: 10px"><g:message code="file.location.label" /></td>
                            <td width="100px" style="font-size: 10px"><g:message code="file.type.label" /></td>
                            <td><g:message code="file.note.label" /></td>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${fileInstanceList}" status="i" var="fileInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td>${fieldValue(bean: fileInstance, field: "code")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "name")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "title")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "edition")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "location")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "type.name")}</td>
                                <td>${fieldValue(bean: fileInstance, field: "note")}</td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </g:else>
            <div class="legend"><g:message code="default.listSize.legend" /> ${fileInstanceList.size()}</div>
        </div>
        <div class="footer">
            <div class="footer-right">
                <sec:username />, <g:formatDate date="${new Date()}" format="${message (code: "default.datetime.format")}" />
                <br />
                <span class="print-button glyphicon glyphicon-print" onclick="javascript:window.print()"></span>
            </div>
        </div>
    </div>
</body>
<r:layoutResources/>
</html>
