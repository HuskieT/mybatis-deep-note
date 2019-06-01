package org.chris.mybatis.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Role implements Serializable {
    private static final long serialVersionUID = 8655851615465863873L;

    private Integer id;
    private String roleName;
    /**
     *备注
     */
    private String note;
    private Date createDate;

    @Override
    public String toString() {
        return "-->" + id + "-->" + roleName + "-->" + note;
    }


}
