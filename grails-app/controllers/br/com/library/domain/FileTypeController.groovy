package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FileTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FileType.list(params), model:[fileTypeInstanceCount: FileType.count()]
    }

    def show(FileType fileTypeInstance) {
        respond fileTypeInstance
    }

    def create() {
        respond new FileType(params)
    }

    @Transactional
    def save(FileType fileTypeInstance) {
        if (fileTypeInstance == null) {
            notFound()
            return
        }

        if (fileTypeInstance.hasErrors()) {
            respond fileTypeInstance.errors, view:'create'
            return
        }

        fileTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'fileType.created.message')
                redirect fileTypeInstance
            }
            '*' { respond fileTypeInstance, [status: CREATED] }
        }
    }

    def edit(FileType fileTypeInstance) {
        respond fileTypeInstance
    }

    @Transactional
    def update(FileType fileTypeInstance) {
        if (fileTypeInstance == null) {
            notFound()
            return
        }

        if (fileTypeInstance.hasErrors()) {
            respond fileTypeInstance.errors, view:'edit'
            return
        }

        fileTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'fileType.updated.message')
                redirect fileTypeInstance
            }
            '*'{ respond fileTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FileType fileTypeInstance) {

        if (fileTypeInstance == null) {
            notFound()
            return
        }

        fileTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'fileType.deleted.message')
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'fileType.notFound.message')
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
