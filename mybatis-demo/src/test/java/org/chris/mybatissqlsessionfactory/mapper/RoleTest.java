package org.chris.mybatissqlsessionfactory.mapper;

import org.chris.mybatissqlsessionfactory.entity.Role;
import org.chris.mybatissqlsessionfactory.mapper.RoleMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RoleTest {
    @Autowired
    private RoleMapper roleMapper;

    @Test
    @Transactional
    public void testRoleMapper() throws Exception {

        Role role = new Role();
        role.setNote("435");
        role.setRoleName("sdf");
        role.setCreateDate(new Date());
        int a  =  roleMapper.insert(role);
    }
    /**
     * 功能描述:Map传参法
     * @param:
     * @return:
     * @auther: chris
     * @date: 2018/8/25 20:29
     */
    @Test
    @Transactional
    public void getEntity() throws Exception {
        Map map = new HashMap();
        map.put("0","test1");
        map.put("1","12345");
        map.put("2",new Date());
       List list  =  roleMapper.getEntity(map);
    }
    /**
     * 功能描述: Param注解传参法
     * @param:
     * @return:
     * @auther: chris
     * @date: 2018/8/25 20:29
     */
    @Test
    @Transactional
    public void getEntity1() throws Exception {
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2018-08-25");
        List list  =  roleMapper.getEntity1( "xiaoqi","63456463",date);
    }
    /**
     * 功能描述: Java Bean传参法
     * @param:
     * @return: 
     * @auther: chris
     * @date: 2018/8/25 20:29
     */
    @Test
    @Transactional
    public void getEntity2() throws Exception {
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2018-08-25");
        Role role = new Role();
        role.setRoleName("xiaoqi");
        role.setNote("63456463");
        role.setCreateDate(date);
        List list  =  roleMapper.getEntity2(role);
    }
    /**
     * 功能描述:List封装in查询的使用
     * @param:-
     * @return: 
     * @auther: chris
     * @date: 2018/8/25 21:10
     */
    @Test
    @Transactional
    public void getRoleList() throws Exception {
        List<Long> list = new ArrayList<>();
        list.add(new Long((long)3));
        list.add(new Long((long)5));
        list.add(new Long((long)6));
        List<Role> rolelist  =   roleMapper.getRoleList(list);
    }
    /**
     * 功能描述: map list 嵌套传递参数查询
     * @param:
     * @return:
     * @auther: chris
     * @date: 2018/8/25 21:13
     */
    @Test
    @Transactional
    public void getRoles() throws Exception {
        Map<String,Object> map = new HashMap<>();

        List<Long> list = new ArrayList<>();
        list.add(new Long((long)3));
        list.add(new Long((long)5));
        list.add(new Long((long)6));

        map.put("list",list);
        map.put("roleName","xiaoqi");
        List<Role> rolelist  =   roleMapper.getRoles(map);
    }

    @Test
    @Transactional
    public void getAll() throws Exception {
       List<Role> list =  roleMapper.getAll();
    }
    @Test
    @Transactional
    public void getRoleById() throws Exception {
        Long id = new Long((long)3);
        Role role =  roleMapper.getRoleById(id);
    }
    @Test
    @Transactional
    public void delete() throws Exception {
        Long id = new Long((long)3);
        roleMapper.delete(id);
    }



}
