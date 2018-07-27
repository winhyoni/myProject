package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class EmpInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		Member mem = new Member();
		mem.setMemberno(request.getParameter("memberno"));
		mem.setName(request.getParameter("name"));
		mem.setJumin(request.getParameter("jumin"));
		mem.setPass(request.getParameter("pass"));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setGender(request.getParameter("gender"));
		mem.setDpt(request.getParameter("dpt"));
		mem.setPosition(request.getParameter("position"));
		mem.setPicture(request.getParameter("picture"));
		
		String index=null;
		switch (mem.getPosition()) {
		case "������" :  index="0"; break;
		case "����" :  index="1"; break;
		case "�̻�" :  index="2"; break;
		case "����" :  index="3"; break;
		case "����" :  index="4"; break;
		case "�븮" :  index="5"; break;
		case "���" :  index="6"; break;
		}
		mem.setRank(index);
		
		String msg="���� ����";
		String url="empinfo.jsp?year="+year+"&month="+month;
		
		int result = new MemberDao().update(mem);
		if(result>0) {
			msg="���� ����";
			url="../main.me?year="+year+"&month="+month;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
