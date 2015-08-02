<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<nav id="left-navigation" class="left-navigation sidebar" role="navigation">
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <ul class="nav navbar-nav side-nav">
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#register">
                <i class="fa fa-fw fa-list"></i> <g:message code="nav.register" /> <i class="fa fa-fw fa-caret-down"></i>
            </a>
            <ul id="register" class="collapse">
                <li>
                    <g:link controller="library" action="index"><g:message code="nav.register.library" /></g:link>
                </li>
                <li>
                    <g:link controller="collection" action="index"><g:message code="nav.register.collection" /></g:link>
                </li>
                <li>
                    <g:link controller="author" action="index"><g:message code="nav.register.author" /></g:link>
                </li>
                <li>
                    <g:link controller="publisher" action="index"><g:message code="nav.register.publisher" /></g:link>
                </li>
                <li>
                    <g:link controller="subject" action="index"><g:message code="nav.register.subject" /></g:link>
                </li>
                <li>
                    <g:link controller="storage" action="index"><g:message code="nav.register.storage" /></g:link>
                </li>
                <li>
                    <g:link controller="file" action="index"><g:message code="nav.register.file" /></g:link>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#search">
                <i class="fa fa-fw fa-search"></i> <g:message code="nav.search" /> <i class="fa fa-fw fa-caret-down"></i>
            </a>
            <ul id="search" class="collapse">
                <li>
                    <g:link controller="library" action="search"><g:message code="nav.search.library" /></g:link>
                </li>
                <li>
                    <g:link controller="collection" action="search"><g:message code="nav.search.collection" /></g:link>
                </li>
                <li>
                    <g:link controller="author" action="search"><g:message code="nav.search.author" /></g:link>
                </li>
                <li>
                    <g:link controller="publisher" action="search"><g:message code="nav.search.publisher" /></g:link>
                </li>
                <li>
                    <g:link controller="subject" action="search"><g:message code="nav.search.subject" /></g:link>
                </li>
                <li>
                    <g:link controller="storage" action="search"><g:message code="nav.search.storage" /></g:link>
                </li>
                <li>
                    <g:link controller="file" action="search"><g:message code="nav.search.file" /></g:link>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#reports">
                <i class="fa fa-fw fa-file-text-o"></i> <g:message code="nav.report" /> <i class="fa fa-fw fa-caret-down"></i>
            </a>
            <ul id="reports" class="collapse">
                <li>
                    <g:link controller="library" action="report"><g:message code="nav.report.library" /></g:link>
                </li>
                <li>
                    <g:link controller="collection" action="report"><g:message code="nav.report.collection" /></g:link>
                </li>
                <li>
                    <g:link controller="author" action="report"><g:message code="nav.report.author" /></g:link>
                </li>
                <li>
                    <g:link controller="publisher" action="report"><g:message code="nav.report.publisher" /></g:link>
                </li>
                <li>
                    <g:link controller="subject" action="report"><g:message code="nav.report.subject" /></g:link>
                </li>
                <li>
                    <g:link controller="storage" action="report"><g:message code="nav.report.storage" /></g:link>
                </li>
                <li>
                    <g:link controller="file" action="report"><g:message code="nav.report.file" /></g:link>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#system">
                <i class="fa fa-fw fa-gears"></i> <g:message code="nav.system" /> <i class="fa fa-fw fa-caret-down"></i>
            </a>
            <ul id="system" class="collapse">
                <li>
                    <g:link controller="storageType" action="index"><g:message code="nav.register.storageType" /></g:link>
                </li>
                <li>
                    <g:link controller="fileType" action="index"><g:message code="nav.register.fileType" /></g:link>
                </li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                <li>
                    <g:link controller="secUser" action="index"><g:message code="nav.system.secUser" /></g:link>
                </li>
                </sec:ifAnyGranted>
            </ul>
        </li>
    </ul>
</nav>