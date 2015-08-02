package br.com.library.domain

class Subject {

    String code;
    String name;
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
