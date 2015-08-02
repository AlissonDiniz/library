package br.com.library.domain

class Collection {

    String code
    String name
    static belongsTo = [library: Library];
    static hasMany = [fileList: File]
    String note;
    String owner;
    Date dateCreated;
    Date lastUpdated;
    
    static constraints = {
        code blank: false, unique: true
        name blank: false
        note nullable: true
        owner blank: false
    }
    
    static mapping = {
        note type: "text"
    }
    
    public String toString(){
        return this.code + " - " + this.name;
    }
}
