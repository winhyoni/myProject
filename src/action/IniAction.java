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
		String msg = "아이디가 없습니다";
		String url = "ini.jsp?year="+year+"&month="+month;
		if(mem != null) {
	         //3.pass 검증하기
	         if(jumin.equals(mem.getJumin().substring(7,14))) {
	        	 mem.setPass(request.getParameter("memberno"));
	        	 int result = new MemberDao().update(mem);
	 			 if(result > 0) {
	 			 	msg="사원번호로 비밀번호 초기화 완료";
	 			  	url="../login/loginForm.me?year="+year+"&month="+month;
	 			 }else {
	 			 	msg="초기화 오류";
	 			 }
	    
	         } else {
	            msg = "주민번호가 틀렸습니다.";
	            url="ini.jsp?year="+year+"&month="+month;
	         }
	    }
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
