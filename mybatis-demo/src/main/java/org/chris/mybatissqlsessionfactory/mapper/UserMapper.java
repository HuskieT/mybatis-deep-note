package org.chris.mybatissqlsessionfactory.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.chris.mybatissqlsessionfactory.entity.User;

import java.util.List;

/**
*@Author renlf
*@Date 2018-08-17 17:34
*@Description 
*@Param 
*@Return 
*@Throws 
*/
//操作：演示两种方式
//<p>第一种是基于mybatis3.x版本后提供的注解方式<p/>
//<p>第二种是早期写法，将SQL写在 XML 中<p/>
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


    public int insert1(User user);


    User  getByNameLike(String name);

    /**
     * 5.5 foreach
     *
     * @param list
     * @return
     */
    List<User> findUserBySex(@Param("sexList") List<Integer> list);

}
