package org.chris.mybatissqlsessionfactory.controller;

import org.chris.mybatissqlsessionfactory.entity.Role;
import org.chris.mybatissqlsessionfactory.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @Auther: chris
 * @Date: 2018/8/25 09:47
 * @Description:
 */
@RestController
public class RoleController {
    @Autowired
    private IRoleService roleService;
 /**
  * 功能描述:
  * @param:
  * @return:
  * @auther: chris
  * @date: 2018/8/25 9:50
  */
    @RequestMapping("roleTest")
    public String roleTest(){

        Role role = new Role();
        role.setRoleName("chris");
        role.setNote("63456463");
        role.setCreateDate(new Date());
        roleService.insert(role);
        return "Success" ;
    }

    @RequestMapping("cors")
    public String test(){
        return "cors-test" ;
    }
}
