package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;



/*
 * urlPatterns = { "*.me" } : a.me, b.me, hello.me ...
 *                   ��û�� ������, ControllerServlet ������ ȣ���ϵ��� ����
 * @WebInitParam : ȯ�� ���� ���� ControllerServlet ���۽� ����.                   
 */
@WebServlet(
      urlPatterns = { "*.me" }, //Ȯ���ڰ� *.me�� ������ ���� �ҷ���
      initParams = { @WebInitParam
            (name = "properties", 
            value = "action.properties") 
      })
public class ControllerServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private Map<String, Action> commandMap = new HashMap<String, Action>();

   public ControllerServlet() {
      super();
   }

   // ControllerServlet ������ ó�� ȣ��� �� �ѹ� �����ϴ� �޼���
   // config ��ü�� WebInitParam ������ ���� ����.
   // properties=action.properties ���·� ���޵�.
   // action.properties�� ����ִ� ��ü�� ����
   @Override
   public void init(ServletConfig config) throws ServletException {
      // props : action.properties ���� ����
      String props = config.getInitParameter("properties");
      Properties pr = new Properties(); // Properties : Ű�� ����� ��� String�� Map ��ü
      FileInputStream f = null;
      try {
         // f : action.properties ������ ������.
         f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
         pr.load(f);
      } catch (IOException e) {
         throw new ServletException(e);
      } finally {
         try {
            if (f != null)
               f.close();
         } catch (IOException e) {
         }
      }
      Iterator keyiter = pr.keySet().iterator();
      while (keyiter.hasNext()) {
         // command : "/model2/hello.me" �� ����
         String command = (String) keyiter.next();
         // className : action.HelloAction" �� ����
         String className = pr.getProperty(command);
         try {
            // commandClass : action.HelloAction Ŭ����ȭ ��.
            Class commandClass = Class.forName(className);
            // commandInstance : action.HelloAction ��üȭ ������.
            Object commandInstance = commandClass.newInstance();
            commandMap.put(command, (Action) commandInstance);
         } catch (Exception e) {
            throw new ServletException(e);
         }
      }
   }

   // get��� ȣ��� ����Ǵ� �޼���
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("euc-kr");
      Action action = null;
      ActionForward forward = null;
      String command = null;
      try {
    	 //command = /model2/hello.me
         command = request.getRequestURI();
         if (command.indexOf(request.getContextPath()) == 0) {
            command = command.substring(request.getContextPath().length());
         }
         //action = action.HelloAction
         action = commandMap.get(command);
         // forward = new ActionForward(false, "hello.jsp")
         forward = action.execute(request, response);
      } catch (Exception e) {
         throw new ServletException(e);
      }
      if (forward != null) {
         if (forward.isRedirect()) {
            response.sendRedirect(forward.getView());
         } else {
            //request ��ü�� �̿��� forward ���
            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getView());
            dispatcher.forward(request, response); //hello.jsp�� ������ �̵�
         }
      } else {
         response.sendRedirect("nopage.jsp");
      }
   }

   // post��� ȣ��� ����Ǵ� �޼���
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doGet(request, response);
   }

}