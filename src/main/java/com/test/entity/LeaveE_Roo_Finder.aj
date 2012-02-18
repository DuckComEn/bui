// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.test.entity;

import com.test.entity.LeaveE;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect LeaveE_Roo_Finder {
    
    public static TypedQuery<LeaveE> LeaveE.findLeaveEsByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = LeaveE.entityManager();
        TypedQuery<LeaveE> q = em.createQuery("SELECT o FROM LeaveE AS o WHERE LOWER(o.name) LIKE LOWER(:name)", LeaveE.class);
        q.setParameter("name", name);
        return q;
    }
    
}