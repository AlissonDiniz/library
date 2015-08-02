package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;
import grails.converters.JSON;

@Transactional(readOnly = true)
class PublisherController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Publisher.list(params), model:[publisherInstanceCount: Publisher.count()]
    }

    def show(Publisher publisherInstance) {
        respond publisherInstance
    }

    def create() {
        respond new Publisher(params)
    }
    
    def search() {
    }
    
    def resultSearch() {
        def criteria = Publisher.createCriteria();
        def publisherInstanceList = criteria.list {
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
        render (view: 'resultSearch', model:[publisherInstanceList: publisherInstanceList])
    }
    
    def report() {
    }
    
    def resultReport() {
        def criteria = Publisher.createCriteria();
        def publisherInstanceList = criteria.list {
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
        render (view: 'resultReport', model:[publisherInstanceList: publisherInstanceList])
    }

    @Transactional
    def save(Publisher publisherInstance) {
        if (publisherInstance == null) {
            notFound()
            return
        }
        if (publisherInstance.hasErrors()) {
            respond publisherInstance.errors, view:'create'
            return
        }
        publisherInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "publisher.created.message")
                redirect publisherInstance
            }
            '*' { respond publisherInstance, [status: CREATED] }
        }
    }

    def edit(Publisher publisherInstance) {
        respond publisherInstance
    }

    @Transactional
    def update(Publisher publisherInstance) {
        if (publisherInstance == null) {
            notFound()
            return
        }
        if (publisherInstance.hasErrors()) {
            respond publisherInstance.errors, view:'edit'
            return
        }
        publisherInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "publisher.updated.message")
                redirect publisherInstance
            }
            '*'{ respond publisherInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Publisher publisherInstance) {
        if (publisherInstance == null) {
            notFound()
            return
        }
        publisherInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "publisher.deleted.message")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def find() {
        def criteria = Publisher.createCriteria();
        def publisherList = criteria.list {
            or {
                if(params.term != null){
                    ilike("name", params.term+"%")
                    ilike("address", params.term+"%")
                    ilike("note", params.term+"%")
                }
            }
            order("name", "asc")
        }
        def response = publisherList.collect { publisher->
            ["id": publisher.id,
                "name": publisher.name,
                "address": publisher.address,
                "note": publisher.note,
                "owner": publisher.owner,
                "dateCreated": publisher.dateCreated]
        }
        render response as JSON;
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "publisher.notFound.message")
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
