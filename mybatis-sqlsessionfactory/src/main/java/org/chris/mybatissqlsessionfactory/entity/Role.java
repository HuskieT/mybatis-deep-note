package org.chris.mybatissqlsessionfactory.entity;

import java.io.Serializable;
import java.util.Date;

public class Role implements Serializable {
    private static final long serialVersionUID = 8655851615465363873L;
    private Long id;

    private String roleName;

    private String remark;

    private Date createDate;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Role(String roleName, String remark, Date createDate) {
        this.roleName = roleName;
        this.remark = remark;
        this.createDate = createDate;
    }

    public Role(Long id, String roleName, String remark, Date createDate) {
        this.id = id;
        this.roleName = roleName;
        this.remark = remark;
        this.createDate = createDate;
    }

    public Role(String roleName, String remark) {
        this.roleName = roleName;
        this.remark = remark;
    }

    public Role() {
    }
}
