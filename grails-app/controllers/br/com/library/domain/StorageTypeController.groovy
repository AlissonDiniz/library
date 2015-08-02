package br.com.library.domain

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StorageTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StorageType.list(params), model:[storageTypeInstanceCount: StorageType.count()]
    }

    def show(StorageType storageTypeInstance) {
        respond storageTypeInstance
    }

    def create() {
        respond new StorageType(params)
    }

    @Transactional
    def save(StorageType storageTypeInstance) {
        if (storageTypeInstance == null) {
            notFound()
            return
        }

        if (storageTypeInstance.hasErrors()) {
            respond storageTypeInstance.errors, view:'create'
            return
        }

        storageTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'storageType.created.message')
                redirect storageTypeInstance
            }
            '*' { respond storageTypeInstance, [status: CREATED] }
        }
    }

    def edit(StorageType storageTypeInstance) {
        respond storageTypeInstance
    }

    @Transactional
    def update(StorageType storageTypeInstance) {
        if (storageTypeInstance == null) {
            notFound()
            return
        }

        if (storageTypeInstance.hasErrors()) {
            respond storageTypeInstance.errors, view:'edit'
            return
        }

        storageTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'storageType.updated.message')
                redirect storageTypeInstance
            }
            '*'{ respond storageTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StorageType storageTypeInstance) {

        if (storageTypeInstance == null) {
            notFound()
            return
        }

        storageTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'storageType.deleted.message')
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'storageType.notFound.message')
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
