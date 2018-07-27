package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class IniAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberno = request.getParameter("memberno");
		String jumin = request.getParameter("jumin");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		System.out.println(year+"///"+month);
		Member mem = new MemberDao().selectOne(memberno);
		String msg = "���̵� �����ϴ�";
		String url = "ini.jsp?year="+year+"&month="+month;
		if(mem != null) {
	         //3.pass �����ϱ�
	         if(jumin.equals(mem.getJumin().substring(7,14))) {
	        	 mem.setPass(request.getParameter("memberno"));
	        	 int result = new MemberDao().update(mem);
	 			 if(result > 0) {
	 			 	msg="�����ȣ�� ��й�ȣ �ʱ�ȭ �Ϸ�";
	 			  	url="../login/loginForm.me?year="+year+"&month="+month;
	 			 }else {
	 			 	msg="�ʱ�ȭ ����";
	 			 }
	    
	         } else {
	            msg = "�ֹι�ȣ�� Ʋ�Ƚ��ϴ�.";
	            url="ini.jsp?year="+year+"&month="+month;
	         }
	    }
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
