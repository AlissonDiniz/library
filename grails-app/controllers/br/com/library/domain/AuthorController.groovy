package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;
import grails.converters.JSON;

@Transactional(readOnly = true)
class AuthorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Author.list(params), model:[authorInstanceCount: Author.count()]
    }

    def show(Author authorInstance) {
        respond authorInstance
    }

    def create() {
        respond new Author(params)
    }
    
    def search() {
    }
    
    def resultSearch() {
        def criteria = Author.createCriteria();
        def authorInstanceList = criteria.list {
            and {
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.address){
                    ilike("address", params.address+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
            }
            order("name", "asc")
        }
        render (view: 'resultSearch', model:[authorInstanceList: authorInstanceList])
    }
    
    def report() {
    }
    
    def resultReport() {
        def criteria = Author.createCriteria();
        def authorInstanceList = criteria.list {
            and {
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.address){
                    ilike("address", params.address+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
            }
            order("name", "asc")
        }
        render (view: 'resultReport', model:[authorInstanceList: authorInstanceList])
    }

    @Transactional
    def save(Author authorInstance) {
        if (authorInstance == null) {
            notFound()
            return
        }
        if (authorInstance.hasErrors()) {
            respond authorInstance.errors, view:'create'
            return
        }
        authorInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "author.created.message")
                redirect authorInstance
            }
            '*' { respond authorInstance, [status: CREATED] }
        }
    }

    def edit(Author authorInstance) {
        respond authorInstance
    }

    @Transactional
    def update(Author authorInstance) {
        if (authorInstance == null) {
            notFound()
            return
        }
        if (authorInstance.hasErrors()) {
            respond authorInstance.errors, view:'edit'
            return
        }
        authorInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "author.updated.message")
                redirect authorInstance
            }
            '*'{ respond authorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Author authorInstance) {
        if (authorInstance == null) {
            notFound()
            return
        }
        authorInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "author.deleted.message")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def find() {
        def criteria = Author.createCriteria();
        def authorList = criteria.list {
            or {
                if(params.term != null){
                    ilike("name", params.term+"%")
                    ilike("address", params.term+"%")
                    ilike("note", params.term+"%")
                }
            }
            order("name", "asc")
        }
        def response = authorList.collect { author->
            ["id": author.id,
                "name": author.name,
                "address": author.address,
                "note": author.note,
                "owner": author.owner,
                "dateCreated": author.dateCreated]
        }
        render response as JSON;
    }
    
    def findByName() {
        def criteria = Author.createCriteria();
        def authorList = criteria.list {
            or {
                if(params.term != null){
                    ilike("name", params.term+"%")
                }
            }
            order("name", "asc")
        }
        def response = authorList.collect { author->
            ["id": author.id,
             "name": author.name]
        }
        render response as JSON;
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "author.notFound.message")
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
