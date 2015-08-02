package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON;

@Transactional(readOnly = true)
class FileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond File.list(params), model:[fileInstanceCount: File.count()]
    }

    def show(File fileInstance) {
        respond fileInstance
    }

    def create() {
        respond new File(params)
    }
    
    def search() {
    }
    
    def resultSearch() {
        def criteria = File.createCriteria();
        def fileInstanceList = criteria.list {
            and {
                if(params.code){
                    ilike("code", params.code+'%')
                }
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.title){
                    ilike("title", params.title+'%')
                }
                if(params.edition){
                    ilike("edition", params.edition+'%')
                }
                if(params.location){
                    ilike("location", params.location+'%')
                }
                if(params.tags){
                    params.tags.split(",").each{tag->
                        ilike("tagList", '%'+tag+'%')
                    }
                }
                if(params.subject){
                    subject{
                        ilike("code", params.subject+'%')
                        ilike("name", params.subject+'%')
                    }
                }
                if(params.collection){
                    collection{
                        ilike("code", params.collection+'%')
                        ilike("name", params.collection+'%')
                    }
                }
                if(params.authorList){
                    authorList{
                        ilike("name", params.author+'%')
                    }
                }
                if(params.storage){
                    storage{
                        ilike("code", params.storage+'%')
                        ilike("name", params.storage+'%')
                    }
                }
                if(params.subject){
                    subject{
                        ilike("code", params.subject+'%')
                        ilike("name", params.subject+'%')
                    }
                }
                if(params.description){
                    ilike("description", '%'+params.description+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
                if(params.periodInit){
                    gt("periodInit", new Date().parse(message(code: 'default.date.format'), params.periodInit))
                }
                if(params.periodEnd){
                    lt("periodEnd", new Date().parse(message(code: 'default.date.format'), params.periodEnd))
                }
                if(params.type){
                    type{
                        idEq(params.type.toLong())
                    }
                }
            }
            order("code", "asc")
        }
        render (view: 'resultSearch', model:[fileInstanceList: fileInstanceList])
    }
    
    def report() {
    }
    
    def resultReport() {
        def criteria = File.createCriteria();
        def fileInstanceList = criteria.list {
            and {
                if(params.code){
                    ilike("code", params.code+'%')
                }
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.title){
                    ilike("title", params.title+'%')
                }
                if(params.edition){
                    ilike("edition", params.edition+'%')
                }
                if(params.location){
                    ilike("location", params.location+'%')
                }
                if(params.tags){
                    params.tags.split(",").each{tag->
                        ilike("tagList", '%'+tag+'%')
                    }
                }
                if(params.subject){
                    subject{
                        ilike("code", params.subject+'%')
                        ilike("name", params.subject+'%')
                    }
                }
                if(params.collection){
                    collection{
                        ilike("code", params.collection+'%')
                        ilike("name", params.collection+'%')
                    }
                }
                if(params.authorList){
                    authorList{
                        ilike("name", params.author+'%')
                    }
                }
                if(params.storage){
                    storage{
                        ilike("code", params.storage+'%')
                        ilike("name", params.storage+'%')
                    }
                }
                if(params.subject){
                    subject{
                        ilike("code", params.subject+'%')
                        ilike("name", params.subject+'%')
                    }
                }
                if(params.description){
                    ilike("description", '%'+params.description+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
                if(params.periodInit){
                    gt("periodInit", new Date().parse(message(code: 'default.date.format'), params.periodInit))
                }
                if(params.periodEnd){
                    lt("periodEnd", new Date().parse(message(code: 'default.date.format'), params.periodEnd))
                }
                if(params.type){
                    type{
                        idEq(params.type.toLong())
                    }
                }
            }
            order("code", "asc")
        }
        render (view: 'resultReport', model:[fileInstanceList: fileInstanceList])
    }

    @Transactional
    def save(File fileInstance) {
        if (fileInstance == null) {
            notFound()
            return
        }
        if(params.periodInitDate){
            fileInstance.periodInit = new Date().parse(message(code: "default.date.format"), params.periodInitDate)
        }
        if(params.periodEndDate){
            fileInstance.periodEnd = new Date().parse(message(code: "default.date.format"), params.periodEndDate)
        }
        fileInstance.authorList = [];
        params.authorListTags.split(",").each{authorName ->
            def authorInstance = Author.findByName(authorName);
            if(authorInstance != null){
                fileInstance.authorList << authorInstance;
            }
        }
        if (fileInstance.hasErrors()) {
            respond fileInstance.errors, view:'create'
            return
        }
        fileInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "file.created.message")
                redirect fileInstance
            }
            '*' { respond fileInstance, [status: CREATED] }
        }
    }

    def edit(File fileInstance) {
        respond fileInstance
    }

    @Transactional
    def update(File fileInstance) {
        if (fileInstance == null) {
            notFound()
            return
        }
        if (fileInstance.hasErrors()) {
            respond fileInstance.errors, view:'edit'
            return
        }
        if(params.periodInitDate){
            fileInstance.periodInit = new Date().parse(message(code: "default.date.format"), params.periodInitDate)
        }
        if(params.periodEndDate){
            fileInstance.periodEnd = new Date().parse(message(code: "default.date.format"), params.periodEndDate)
        }
        fileInstance.authorList = [];
        println params.authorListTags
        params.authorListTags.split(",").each{authorName ->
            println authorName
            def authorInstance = Author.findByName(authorName);
            if(authorInstance != null){
                fileInstance.authorList << authorInstance;
            }
        }
        fileInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "file.updated.message")
                redirect fileInstance
            }
            '*'{ respond fileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(File fileInstance) {
        if (fileInstance == null) {
            notFound()
            return
        }
        fileInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "file.deleted.message")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    def find() {
        def criteria = File.createCriteria();
        def fileList = criteria.list {
            or {
                if(params.term != null){
                    ilike("code", params.term+"%")
                    ilike("name", params.term+"%")
                    ilike("title", params.term+"%")
                    collection{
                        ilike("name", params.term+"%")
                    }
                    type{
                        ilike("name", params.term+"%")
                    }
                }
            }
            order("code", "asc")
        }
        def response = fileList.collect { file->
            ["id": file.id,
                "code": file.code,
                "name": file.name,
                "title": file.title,
                "collection": file.collection.toString(),
                "type": file.type.name,
                "owner": file.owner]
        }
        render response as JSON;
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "file.notFound.message")
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
