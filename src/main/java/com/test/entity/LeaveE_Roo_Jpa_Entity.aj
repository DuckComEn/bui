// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.test.entity;

import com.test.entity.LeaveE;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect LeaveE_Roo_Jpa_Entity {
    
    declare @type: LeaveE: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_")
    private Long LeaveE.id_;
    
    @Version
    @Column(name = "version")
    private Integer LeaveE.version;
    
    public Long LeaveE.getId_() {
        return this.id_;
    }
    
    public void LeaveE.setId_(Long id) {
        this.id_ = id;
    }
    
    public Integer LeaveE.getVersion() {
        return this.version;
    }
    
    public void LeaveE.setVersion(Integer version) {
        this.version = version;
    }
    
}
