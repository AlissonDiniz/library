package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;
import grails.converters.JSON;

@Transactional(readOnly = true)
class LibraryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Library.list(params), model:[libraryInstanceCount: Library.count()]
    }

    def show(Library libraryInstance) {
        respond libraryInstance
    }

    def create() {
        respond new Library(params)
    }
    
    def search() {
    }
    
    def resultSearch() {
        def criteria = Library.createCriteria();
        def libraryInstanceList = criteria.list {
            and {
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
            }
            order("name", "asc")
        }
        render (view: 'resultSearch', model:[libraryInstanceList: libraryInstanceList])
    }
    
    def report() {
    }
    
    def resultReport() {
        def criteria = Library.createCriteria();
        def libraryInstanceList = criteria.list {
            and {
                if(params.name){
                    ilike("name", params.name+'%')
                }
                if(params.note){
                    ilike("note", '%'+params.note+'%')
                }
            }
            order("name", "asc")
        }
        render (view: 'resultReport', model:[libraryInstanceList: libraryInstanceList])
    }

    @Transactional
    def save(Library libraryInstance) {
        if (libraryInstance == null) {
            notFound()
            return
        }
        if (libraryInstance.hasErrors()) {
            respond libraryInstance.errors, view:'create'
            return
        }
        libraryInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "library.created.message")
                redirect libraryInstance
            }
            '*' { respond libraryInstance, [status: CREATED] }
        }
    }

    def edit(Library libraryInstance) {
        respond libraryInstance
    }

    @Transactional
    def update(Library libraryInstance) {
        if (libraryInstance == null) {
            notFound()
            return
        }
        if (libraryInstance.hasErrors()) {
            respond libraryInstance.errors, view:'edit'
            return
        }
        libraryInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "library.updated.message")
                redirect libraryInstance
            }
            '*'{ respond libraryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Library libraryInstance) {
        if (libraryInstance == null) {
            notFound()
            return
        }
        libraryInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "library.deleted.message")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def find() {
        def criteria = Library.createCriteria();
        def libraryList = criteria.list {
            or {
                if(params.term != null){
                    ilike("name", params.term+"%")
                    ilike("note", params.term+"%")
                }
            }
            order("name", "asc")
        }
        def response = libraryList.collect { library->
            ["id": library.id,
                "name": library.name,
                "note": library.note,
                "owner": library.owner,
                "dateCreated": library.dateCreated]
        }
        render response as JSON;
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "library.notFound.message")
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
