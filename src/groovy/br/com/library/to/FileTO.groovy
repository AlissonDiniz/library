/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.library.to

import br.com.library.domain.File;
import br.com.library.helper.TreeNode;

/**
 *
 * @author Alisson Diniz
 */
class FileTO extends TreeNode{
    
    String type;
    Long typeId;
    String subject;
    Long storageId;
    String periodInit;
    String periodEnd;
    String tagList;
    String note;
    Date dateCreated;

    public FileTO(File fileInstance){
        this.id = fileInstance.id;
        this.code = fileInstance.code;
        this.name = fileInstance.name;
        this.owner = fileInstance.owner;
        this.subject = fileInstance.subject;
        this.type = fileInstance.type.name;
        this.typeId = fileInstance.type.id;
        this.storageId = fileInstance.storage.id;
        this.periodInit = fileInstance.periodInit?.toString();
        this.periodEnd = fileInstance.periodEnd?.toString();
        this.tagList = fileInstance.tagList;
        this.note = fileInstance.note;
        this.dateCreated = fileInstance.dateCreated;
    }
}

