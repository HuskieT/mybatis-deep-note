package org.chris.mybatissqlsessionfactory.mapper;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.chris.mybatissqlsessionfactory.entity.Role;
import org.chris.mybatissqlsessionfactory.entity.User;
import org.chris.mybatissqlsessionfactory.mapper.RoleMapper;
import org.chris.mybatissqlsessionfactory.mapper.UserMapper;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Arrays;
import java.util.List;

/**
 * @Auther: chris
 * @Date: 2019/4/14 13:54
 * @Description:
 */

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class Test {
    @Autowired
    private RoleMapper roleDao;
    @Autowired
    private UserMapper userDao;

    public void main(String[] args) {

        execute52( roleDao );

        execute53( roleDao );

        execute54();// 会发生更新,请关注代码.

        execute55();// 代码文件在UserDao.xml

        execute56( roleDao );

        execute57( roleDao );

        log.info( "执行成功!" );
    }


    private static void execute52(RoleMapper roleDao) {
        System.out.println( "---------5.2----------->" );
        roleDao.findRolesIf( "test" ).forEach( x -> System.out.println( x.toString() ) );
        System.out.println( "---------5.2end----------->" );
    }

    private static void execute53(RoleMapper roleDao) {
        System.out.println( "---------5.3----------->" );
        roleDao.findChooseWhenOtherWise( "4", "test" ).forEach( x -> System.out.println( x.toString() ) );
        roleDao.findChooseWhenOtherWise( "", "test" ).forEach( x -> System.out.println( x.toString() ) );
        System.out.println( "---------5.3end----------->" );
    }

    private void execute54() {
        System.out.println( roleDao.findWhere( "test" ) );
        System.out.println( roleDao.findRoleTrim( "更新" ) );

        Role role = new Role();
        role.setId( 4 );
        role.setRoleName( "更新之后" );
        role.setNote( "更新备注" );

        System.out.println( roleDao.updateRole( role ) );
    }

    private void execute55() {
        List<User> userList = userDao.findUserBySex( Arrays.asList( 0, 1, 2 ) );
        userList.forEach( x -> System.out.println( x.toString() ) );
    }

    private static void execute56(RoleMapper roleDao) {
        System.out.println( roleDao.getRoleTest( "y" ) );
    }

    private static void execute57(RoleMapper roleDao) {
        System.out.println( roleDao.findRoleMulBind( "更新", "更新" ) );
    }
}
