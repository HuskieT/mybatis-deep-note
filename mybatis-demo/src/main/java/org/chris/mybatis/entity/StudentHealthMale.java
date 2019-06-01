package org.chris.mybatis.entity;

import lombok.Data;
/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 男性学生健康表
 */
@Data
public class StudentHealthMale {

    private Integer id;
    private String student_id;
    /**
     *检查日期
     */
    private String checkDate;
    /**
     *心
     */
    private String heart;
    /**
     *肝
     */
    private String liver;
    /**
     *脾
     */
    private String spleen;
    /**
     *肺
     */
    private String lung;
    /**
     *肾
     */
    private String kidney;
    /**
     *前列腺
     */
    private String prostate;
    private String note;
}