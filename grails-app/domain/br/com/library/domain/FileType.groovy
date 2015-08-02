package br.com.library.domain

class FileType {
    
    String name;
    String description;
    String owner;
    Date dateCreated;
    Date lastUpdated;
    
    static constraints = {
        name blank: false, unique: true
        description nullable: true
        owner blank: false
    }
    
    public String toString(){
        return this.name;
    }
}
