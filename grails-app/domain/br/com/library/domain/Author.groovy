package br.com.library.domain

class Author {

    String name
    static belongsTo = File
    static hasMany = [fileList: File]
    String address;
    String note;
    String owner;
    Date dateCreated;
    Date lastUpdated;
    
    static constraints = {
        name blank: false, unique: true
        address blank: false
        note nullable: true
        owner blank: false
    }
    
    static mapping = {
        note type: "text"
    }
    
    public String toString(){
        return this.name;
    }
}
