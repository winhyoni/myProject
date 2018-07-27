package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class PassChangeRegAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberno = request.getParameter("memberno");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String msg = "��й�ȣ�� ��й�ȣȮ���� ��ġ���� �ʽ��ϴ�.";
		String url = "passChangeReg.jsp?year="+year+"&month="+month+"&memberno="+memberno;
		Member mem = new MemberDao().selectOne(memberno);
		mem.setPass(request.getParameter("pass1"));
		if(pass1==null || pass1.equals("")) {
			request.setAttribute("msg", "���� �� ��й�ȣ�� �Է����ּ���.");
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else if(pass2==null || pass2.equals("")) {
			request.setAttribute("msg", "��й�ȣ Ȯ�ζ��� �Է����ּ���");
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		if(pass1.equals(pass2)) {
			int result = new MemberDao().update(mem);
			if(result > 0) {
				msg="��й�ȣ ���� �Ϸ�";
				url="../login/loginForm.me?year="+year+"&month="+month;
			}else {
				msg="��й�ȣ ���� ����";
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
