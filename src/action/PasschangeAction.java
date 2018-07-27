

package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class PasschangeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberno = request.getParameter("memberno");
		String pass = request.getParameter("pass");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		Member mem = new MemberDao().selectOne(memberno);
		String msg = "아이디가 없습니다";
		String url = "passchange.jsp?year="+year+"&month="+month;
		if(mem != null) {
	         //3.pass 검증하기
	         if(pass.equals(mem.getPass())) {
	            return new ActionForward(false, "passChangeReg.jsp?year="+year+"&month="+month+"&memberno="+memberno);
	    
	         } else {
	            msg = "비밀번호가 틀렸습니다.";
	            url="passchange.jsp?year="+year+"&month="+month;
	         }
	    }
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		
	}

}
