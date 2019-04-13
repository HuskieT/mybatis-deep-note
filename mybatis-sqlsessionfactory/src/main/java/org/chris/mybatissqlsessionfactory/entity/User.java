package org.chris.mybatissqlsessionfactory.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Set;

/**
 * @Author renlf
 * @Date 2018-08-17 17:32
 * @Description
 **/
@Data
public class User implements Serializable {
    private static final long serialVersionUID = 8655851615465363473L;

    private Integer id;
    /**
     *用户名称
     */
    private String userName;
    /**
     *姓名
     */
    private String cnName;
    private Set sex;
    private String mobile;
    private String email;
    /**
     *备注
     */
    private String note;
    private String password;

    @Override
    public String toString() {
        return "--->" + id + "--->" + userName + "--->" + cnName + "--->" + sex +
                "--->" + mobile + "--->" + email + "--->" + note+ "--->" + password;
    }
}
