grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = [
    test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
    run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
    war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
    console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

grails.project.dependency.resolver = "maven"
grails.project.dependency.resolution = {
    inherits("global") {
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true
        grailsPlugins()
        grailsHome()
        mavenLocal()
        grailsCentral()
        mavenCentral()
        mavenRepo "http://repo.spring.io/milestone/"
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
        // runtime 'mysql:mysql-connector-java:5.1.27'
        // runtime 'org.postgresql:postgresql:9.3-1100-jdbc41'
    }

    plugins {
        build ":tomcat:7.0.50.1"

        compile ":scaffolding:2.0.2"
        compile ':cache:1.1.1'

        runtime ":hibernate:3.6.10.8"
        compile ":mysql-connectorj:5.1.22.1"
        runtime ":database-migration:1.3.8"
        
        runtime ":resources:1.2.1"
        
        compile ":twitter-bootstrap:3.2.1"
        runtime ":jquery:1.11.1"
        compile ":font-awesome-resources:4.2.0.0"

        runtime ":zipped-resources:1.0.1"
        runtime ":cached-resources:1.1"
        runtime ":cache-headers:1.1.5"
        runtime ":yui-minify-resources:0.1.5"

        compile ':spring-security-core:2.0-RC4'
        
        compile ":i18n-enums:1.0.8"
    }
}
