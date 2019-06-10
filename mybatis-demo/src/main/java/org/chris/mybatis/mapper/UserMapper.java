package org.chris.mybatis.mapper;

import org.apache.ibatis.annotations.*;
import org.chris.mybatis.entity.User;

import java.util.List;

/**
*@Author renlf
*@Date 2018-08-17 17:34
*@Description 
*@Param 
*@Return 
*@Throws 
*/
@Mapper
public interface UserMapper {
    /**
     * 根据用户名查询用户结果集
     *
     * @param name 用户名
     * @return 查询结果
     */
    @Select("SELECT * FROM user where name = #{name}")
    List<User> findByUsername(@Param("name") String name);

    /**
     * 保存用户信息
     *
     * @param user 用户信息
     * @return 成功 1 失败 0
     */
    @Insert("insert into t_user(username,password) values(#{username},#{password})")
    void insert(User user);

     /**
     * 添加UUID主键
     */
    int insertUUID(User user);
    /**
     * 添加UUID主键 注解方式
     */
    @Insert("insert into t_user(id, user_name) values(#{id}, #{name})")
    @SelectKey(keyProperty = "id", resultType = String.class, before = true,
            statement = "select replace(uuid(), '-', '') as id from dual")
    int insertUUID2(User user);

    User  getByNameLike(String name);

    /**
     * 5.5 foreach
     *
     * @param list
     * @return
     */
    List<User> findUserBySex(@Param("sexList") List<Integer> list);



}
