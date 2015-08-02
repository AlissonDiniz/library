<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="<g:createLink action="index" controller="i18n" />"></script>
        <r:require module="web"/>
        <r:layoutResources/>
    </head>
    <body class="body">
        <header>
            <div class="container">
                <div class="row">
                    <g:img class="maac" dir="images" file="maac-logo.jpg" />
                    <span>Biblioteca</span>
                </div>
            </div>
        </header>
        <div class="wrapper container">
            <div class="row">
                <section>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-search fa-fw"></i> Pesquisar no acervo da Biblioteca
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-default" data-toggle="tab">Pesquisa Simples</a></li>
                                <li><a href="#tab-full" data-toggle="tab">Pesquisa Avançada</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab-default" class="tab-pane fade in active">
                                    <g:render template="default" />
                                </div>
                                <div id="tab-full" class="tab-pane fade">
                                    <g:render template="full" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <footer>
                    <p>© Desenvolvido por <a href="http://about.me/alissondiniz" target="_blank">Alisson Diniz</a></p>
                    <g:img class="furne" dir="images" file="furne-logo.png" />
                    <g:img class="bndes" dir="images" file="bndes-logo.jpg" />
                    <g:img class="brasil" dir="images" file="brasil-logo.jpg" />
                </footer>
            </div>
        </div>
    </body>
    <r:layoutResources/>
</html>
