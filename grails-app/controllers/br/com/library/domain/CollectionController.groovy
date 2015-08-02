package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;
import grails.converters.JSON;

@Transactional(readOnly = true)
class CollectionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Collection.list(params), model:[collectionInstanceCount: Collection.count()]
    }

    def show(Collection collectionInstance) {
        respond collectionInstance
    }

    def create() {
        respond new Collection(params)
    }
    
    def search() {
    }
    
    def resultSearch() {
        def criteria = Collection.createCriteria();
        def collectionInstanceList = criteria.list {
            and {
                if(params.code){
                    ilike("code", params.code+'%')
                }
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
            }
            order("name", "asc")
        }
        render (view: 'resultSearch', model:[collectionInstanceList: collectionInstanceList])
    }
    
    def report() {
    }
    
    def resultReport() {
        def criteria = Collection.createCriteria();
        def collectionInstanceList = criteria.list {
            and {
                if(params.code){
                    ilike("code", params.code+'%')
                }
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
            }
            order("name", "asc")
        }
        render (view: 'resultReport', model:[collectionInstanceList: collectionInstanceList])
    }

    @Transactional
    def save(Collection collectionInstance) {
        if (collectionInstance == null) {
            notFound()
            return
        }
        if (collectionInstance.hasErrors()) {
            respond collectionInstance.errors, view:'create'
            return
        }
        collectionInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "collection.created.message")
                redirect collectionInstance
            }
            '*' { respond collectionInstance, [status: CREATED] }
        }
    }

    def edit(Collection collectionInstance) {
        respond collectionInstance
    }

    @Transactional
    def update(Collection collectionInstance) {
        if (collectionInstance == null) {
            notFound()
            return
        }
        if (collectionInstance.hasErrors()) {
            respond collectionInstance.errors, view:'edit'
            return
        }
        collectionInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "collection.updated.message")
                redirect collectionInstance
            }
            '*'{ respond collectionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Collection collectionInstance) {
        if (collectionInstance == null) {
            notFound()
            return
        }
        collectionInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "collection.deleted.message")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def find() {
        def criteria = Collection.createCriteria();
        def collectionList = criteria.list {
            or {
                if(params.term != null){
                    ilike("code", params.term+"%")
                    ilike("name", params.term+"%")
                    ilike("note", params.term+"%")
                    library{
                        ilike("name", params.term+"%")
                    }
                }
            }
            order("name", "asc")
        }
        def response = collectionList.collect { collection->
            ["id": collection.id,
                "code": collection.code,
                "name": collection.name,
                "note": collection.note,
                "owner": collection.owner,
                "dateCreated": collection.dateCreated]
        }
        render response as JSON;
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "collection.notFound.message")
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
