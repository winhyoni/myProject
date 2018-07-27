package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class TreamEmpListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageNum=1;
		int limit = 10;
		if(request.getParameter("pageNum") != null) {
			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}catch (NumberFormatException e) {
				request.setAttribute("msg", "숫자만 입력가능합니다.");
				request.setAttribute("url", "emplist.bo");
				return new ActionForward(false, "../alert.jsp");
			}
			
		}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column == null || column.equals("")) {
			column = null;
		}
		if(find == null || find.equals("")) {
			find = null;
		}
		request.setAttribute("find", find);
		
		Member mem = new MemberDao().selectOne((String)request.getSession().getAttribute("login"));
		String dpt = mem.getDpt();
		
		int membercount = new MemberDao().teammemberCount(column,find,dpt);
		
		List<Member> list = new ArrayList<Member>();
		list = new MemberDao().teamlist(pageNum, limit, column, find, dpt);
		int maxpage = (int)((double)membercount/limit + 0.95);//필요한 페이지 수
		int startpage = (((int)(pageNum/10.0 + 0.9))-1) * 10 + 1;//화면에 보여진 시작페이지
		int endpage = startpage + 9;//화면에 보여질 끝페이지
		if(endpage>maxpage) endpage = maxpage;
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("membercount", membercount);
		return new ActionForward(false, "trememplist.jsp");
	}

}
