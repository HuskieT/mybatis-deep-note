package org.chris.mybatissqlsessionfactory.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.chris.mybatissqlsessionfactory.entity.Role;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface RoleMapper {

    public List<Role> getAll();

    public Role getRoleById(Long id);

    int insert(Role role);

    int insert1(String roleName, String remark, Date createDate);

    List<Role> getEntity(Map hashmap);

    public void delete(Long id);

    List<Role> getEntity1(@Param("roleName") String roleName,@Param("remark") String remark, @Param("createDate") Date createDate);

    List<Role> getEntity2(Role role);

    List<Role>  getRoleList(List<Long> list);

    List<Role> getRoles(Map<String,Object> map);
    /**
     * 功能描述:
     * @param: Role  role  Role对象
     * @return: 
     * @auther: chris
     * @date: 2019/4/13 15:54
     */
    void  update(Role role);

    void  insert2(List<Role> list);

    Map selectUsers();

    Map  getRoleMap(Integer in);

    List<Role> getRole1(Role role);

    Role getRole3(Role role);

    Role getRole2(Role role);
}
