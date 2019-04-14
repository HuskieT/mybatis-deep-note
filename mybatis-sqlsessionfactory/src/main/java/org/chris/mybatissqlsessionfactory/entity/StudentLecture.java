package org.chris.mybatissqlsessionfactory.entity;

import lombok.Data;

import java.math.BigDecimal;
/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 课程成绩表
 */
@Data
public class StudentLecture {
    private Integer id;
    private Integer studentId;
    /**
     * 课程编号
     */
    private Lecture lecture;
    /**
     * 评分
     */
    private BigDecimal grade;
    private String note;
}