package org.chris.mybatissqlsessionfactory.reflect;

/**
 * 6-1-2 JDK动态代理
 */
public class HelloServiceMain {
    public static void main(String[] args) {
        HelloServiceProxy helloServiceProxy = new HelloServiceProxy();
        HelloService proxy = (HelloService) helloServiceProxy.bind(new HelloServiceImpl());
        proxy.sayHello("张三!");

        HelloServiceCgLib helloServiceCgLib = new HelloServiceCgLib();
        HelloService proxy1 = (HelloService) helloServiceCgLib.getInstance( new HelloServiceImpl() );
        proxy1.sayHello( "小柒" );
    }
}