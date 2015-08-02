package br.com.library.helper

class WebController {

    def index() { }
    
    def search() {
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
        render (view: 'search', model:[fileInstanceList: fileInstanceList])
    }
}
