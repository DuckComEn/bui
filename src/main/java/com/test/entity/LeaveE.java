package com.test.entity;

import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class LeaveE {

    private String id;

    private String name;

    private String season;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "SS")
    private Date dateAtleave;

    private String apoveBy;

    private Boolean apove;
}
