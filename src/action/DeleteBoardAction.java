package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Board;
import model.BoardDao;
import model.ReplyDao;

public class DeleteBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String pageNum = request.getParameter("pageNum");
		String kindno = request.getParameter("kindno");
		Board board = new BoardDao().selectOne(request.getParameter("no"));
		String memberno = (String) request.getSession().getAttribute("login");
		if(!board.getMemberno().equals(memberno)) {
			request.setAttribute("msg", "���� ������ �����ϴ�.");
	 		request.setAttribute("url", "boardlist.me?pageNum="+pageNum+"&kindno="+kindno);
	 		return new ActionForward(false, "../alert.jsp");
		}
		
		
		
		int result = new BoardDao().delete(no);
		ReplyDao dao = new ReplyDao();
		dao.boredelete(no);
		String msg="���� ����";
		String url="boardinfo.me?no="+no+"&pageNum="+pageNum+"&kindno="+kindno;
		if(result>0) {
			msg="�����Ǿ����ϴ�.";
			url="boardlist.me?pageNum="+pageNum+"&kindno="+kindno;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
