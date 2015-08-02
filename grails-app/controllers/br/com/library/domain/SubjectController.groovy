package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional;
import grails.converters.JSON;

@Transactional(readOnly = true)
class SubjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subject.list(params), model:[subjectInstanceCount: Subject.count()]
    }

    def show(Subject subjectInstance) {
        respond subjectInstance
    }

    def create() {
        respond new Subject(params)
    }
    
    def search() {
    }
    
    def resultSearch() {
        def criteria = Subject.createCriteria();
        def subjectInstanceList = criteria.list {
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
        render (view: 'resultSearch', model:[params: params, subjectInstanceList: subjectInstanceList])
    }
    
    def report() {
    }
    
    def resultReport() {
        def criteria = Subject.createCriteria();
        def subjectInstanceList = criteria.list {
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
        render (view: 'resultReport', model:[subjectInstanceList: subjectInstanceList])
    }

    @Transactional
    def save(Subject subjectInstance) {
        if (subjectInstance == null) {
            notFound()
            return
        }
        if (subjectInstance.hasErrors()) {
            respond subjectInstance.errors, view:'create'
            return
        }
        subjectInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "subject.created.message")
                redirect subjectInstance
            }
            '*' { respond subjectInstance, [status: CREATED] }
        }
    }

    def edit(Subject subjectInstance) {
        respond subjectInstance
    }

    @Transactional
    def update(Subject subjectInstance) {
        if (subjectInstance == null) {
            notFound()
            return
        }
        if (subjectInstance.hasErrors()) {
            respond subjectInstance.errors, view:'edit'
            return
        }
        subjectInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "subject.updated.message")
                redirect subjectInstance
            }
            '*'{ respond subjectInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Subject subjectInstance) {
        if (subjectInstance == null) {
            notFound()
            return
        }
        subjectInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "subject.deleted.message")
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def find() {
        def criteria = Subject.createCriteria();
        def subjectList = criteria.list {
            or {
                if(params.term != null){
                    ilike("code", params.term+"%")
                    ilike("name", params.term+"%")
                    ilike("note", params.term+"%")
                }
            }
            order("name", "asc")
        }
        def response = subjectList.collect { subject->
            ["id": subject.id,
                "code": subject.code,
                "name": subject.name,
                "note": subject.note,
                "owner": subject.owner,
                "dateCreated": subject.dateCreated]
        }
        render response as JSON;
    }
    
    def getFileCode() {
        def subjectInstance = Subject.findById(params.subjectId);
        def rows = File.countBySubject(subjectInstance);
        def criteria = File.createCriteria();
        def max = criteria.list {
            ilike("name", params.term+"%")
            order("name", "asc")
        }
        def response = ["code": subjectInstance.code + "-" + (rows + 1)]
        render response as JSON;
    }
    
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: "subject.notFound.message")
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
