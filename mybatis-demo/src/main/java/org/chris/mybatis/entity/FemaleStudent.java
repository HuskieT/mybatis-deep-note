package org.chris.mybatis.entity;

import lombok.Data;

import java.util.List;
/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 所有女生健康信息
 */
@Data
public class FemaleStudent extends Student {
    private List<StudentHealthFemale> studentHealthFemaleList = null;
}