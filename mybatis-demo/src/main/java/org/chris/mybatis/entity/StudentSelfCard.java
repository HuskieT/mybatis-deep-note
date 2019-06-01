package org.chris.mybatis.entity;

import lombok.Data;

import java.util.Date;
/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 学生身份信息表（学生证表）
 */
@Data
public class StudentSelfCard {
    private Integer id;
    private Integer studentId;
    /**
     * 籍贯
     */
    private String nativeStr;
    /**
     * 发证时间
     */
    private Date issueDate;
    /**
     * 结束时间
     */
    private Date endDate;
    private String note;
}