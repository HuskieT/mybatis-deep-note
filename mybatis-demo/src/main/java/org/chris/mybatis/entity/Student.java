package org.chris.mybatis.entity;

import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 学生表
 */
@Data
@ToString
public class Student {
    private Integer id;
    private String cnName;
    private SexEnum sex;
    /**
     * 学生证号
     */
    private String selfCardNo;
    private String note;
    /**
     * 课程编号
     */
    private StudentSelfCard studentSelfcard;
    /**
     * 学生课程集合
     */
    private List<StudentLecture> studentLectureList;
}