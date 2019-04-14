package org.chris.mybatissqlsessionfactory.entity;

import lombok.Data;
/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 课程表
 */
@Data
public class Lecture {
    /**
     * 课程编号
     */
    private Integer id;
    /**
     * 课程名称
     */
    private String lectureName;
    /**
     * 备注
     */
    private String note;
}