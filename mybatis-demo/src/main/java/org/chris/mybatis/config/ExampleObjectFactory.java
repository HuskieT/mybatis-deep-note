package org.chris.mybatis.config;


import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.chris.mybatis.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Iterator;
import java.util.Properties;
/**
 * @Author renlf
 * @Date 2018-08-23 14:02
 * @Description 继承DefaultObjectFactory
 * DefaultObjectFactory默认对象工厂类
 **/
public class ExampleObjectFactory extends DefaultObjectFactory {
    private static  final Logger log = LoggerFactory.getLogger(ExampleObjectFactory.class);
    @Override
    public Object create(Class type) {
        if (type.equals(User.class)){
            User p = (User)super.create(type);
            p.setPassword("123456");
            p.setUserName("tom");
            return p;
        }
        return super.create(type);
    }

    @Override
    public void setProperties(Properties properties) {
        Iterator iterator = properties.keySet().iterator();
        while (iterator.hasNext()){
            String keyValue = String.valueOf(iterator.next());
            System.out.println(properties.getProperty(keyValue));
        }
        super.setProperties(properties);
    }

    @Override
    public <T> boolean isCollection(Class<T> type) {
        return super.isCollection(type);
    }

    public static void main(String[] args) throws Exception{
        ExampleObjectFactory e = new ExampleObjectFactory();
        User p = (User) e.create(User.class);
        log.debug(p.getCnName());
    }
}
