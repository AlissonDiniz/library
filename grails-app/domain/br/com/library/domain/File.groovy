package br.com.library.domain

class File {

    String code;
    String name;
    String title;
    static belongsTo = [collection: Collection, publisher: Publisher, subject: Subject, storage: Storage];
    static hasMany = [authorList: Author]
    String edition;
    String location;
    FileType type;
    String tagList;
    Date periodInit;
    Date periodEnd;
    String description;
    String note;
    String owner;
    Date dateCreated;
    Date lastUpdated;
    
    static constraints = {
        code blank: false, unique: true
        name blank: false
        title blank: false
        type blank: false
        edition nullable: true
        location nullable: true
        tagList nullable: true
        periodInit nullable: true
        periodEnd nullable: true
        description nullable: true
        note nullable: true
        owner blank: false
    }
    static mapping = {
        description type: "text"
        note type: "text"
    }
}
