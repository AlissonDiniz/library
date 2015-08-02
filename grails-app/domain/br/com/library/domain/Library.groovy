package br.com.library.domain

class Library {

    String name;
    String note;
    String owner;
    Date dateCreated;
    Date lastUpdated;
    
    static hasMany = [collectionList: Collection, storageList: Storage]
    
    static constraints = {
        name blank: false, unique: true
        note nullable: true
        owner blank: false
    }
    
    public String toString(){
        return this.name;
    }
}
