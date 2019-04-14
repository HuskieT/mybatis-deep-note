package org.chris.mybatissqlsessionfactory.entity;

import lombok.Data;
/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 女性学生健康表
 */
@Data
public class StudentHealthFemale {

    private Integer id;
    private String student_id;
    /**
     *检查日期
     */
    private String check_date;
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
     *子宫
     */
    private String uterus;
    /**
     *备注
     */
    private String note;
}
