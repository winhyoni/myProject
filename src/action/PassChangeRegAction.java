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
		String msg = "비밀번호와 비밀번호확인이 일치하지 않습니다.";
		String url = "passChangeReg.jsp?year="+year+"&month="+month+"&memberno="+memberno;
		Member mem = new MemberDao().selectOne(memberno);
		mem.setPass(request.getParameter("pass1"));
		if(pass1==null || pass1.equals("")) {
			request.setAttribute("msg", "변경 할 비밀번호를 입력해주세요.");
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else if(pass2==null || pass2.equals("")) {
			request.setAttribute("msg", "비밀번호 확인란을 입력해주세요");
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		if(pass1.equals(pass2)) {
			int result = new MemberDao().update(mem);
			if(result > 0) {
				msg="비밀번호 변경 완료";
				url="../login/loginForm.me?year="+year+"&month="+month;
			}else {
				msg="비밀번호 변경 오류";
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
