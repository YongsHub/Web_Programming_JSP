package jspbook.ch10;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class InitialMember
 *
 */
@WebListener
public class InitialMember implements ServletContextListener { // 어플리케이션 객체가 생성되고 소멸되는 시점

    /**
     * Default constructor. 
     */
    public InitialMember() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { // 어플리케이션 객체가 소멸될 떄
        
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { // 어플리케이션 객체가 생성될 때
    	ServletContext context = sce.getServletContext(); // 애플리케이션 객체
        ArrayList<Member> datas = new ArrayList<Member>();
        
        for(int i=0; i<8; i++) {
        	Member data = new Member("강호동"+i,"test"+i+"@kpu.ac.kr");
        	datas.add(data);
        }
        
        datas.add(new Member("홍길동", null));
        datas.add(new Member("김길동",null));
        
        context.setAttribute("members", datas);
        context.setAttribute("member", new Member());
        
    }
	
}
