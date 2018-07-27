package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;


public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberno = request.getParameter("memberno");
		String pass = request.getParameter("pass");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		if(memberno==null || memberno.equals("")) {
			request.setAttribute("msg", "���̵� �Է����ּ���.");
			request.setAttribute("url", "loginForm.me?year="+year+"&month="+month);
			return new ActionForward(false, "../alert.jsp");
		}else if(pass==null || pass.equals("")) {
			request.setAttribute("msg", "��й�ȣ�� �Է����ּ���.");
			request.setAttribute("url", "loginForm.me?year="+year+"&month="+month);
			return new ActionForward(false, "../alert.jsp");
		}
		
		Member mem = new MemberDao().selectOne(memberno);
		String msg = "���̵� �����ϴ�";
		String url = "loginForm.me?year="+year+"&month="+month;
		
		if(mem != null) {
	         //3.pass �����ϱ�
	         if(pass.equals(mem.getPass())) {
	            msg = mem.getName() + "�α��� �ϼ̽��ϴ�.";
	            url = "../main.me?year="+year+"&month="+month;
	            //4.session login���� ����ϱ�
	            request.getSession().setAttribute("login", memberno);
	         } else {
	            msg = "��й�ȣ�� Ʋ���ϴ�.";
	            url="loginForm.me?year="+year+"&month="+month;
	         }
	      }
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
