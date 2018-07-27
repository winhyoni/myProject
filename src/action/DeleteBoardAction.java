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
			request.setAttribute("msg", "삭제 권한이 없습니다.");
	 		request.setAttribute("url", "boardlist.me?pageNum="+pageNum+"&kindno="+kindno);
	 		return new ActionForward(false, "../alert.jsp");
		}
		
		
		
		int result = new BoardDao().delete(no);
		ReplyDao dao = new ReplyDao();
		dao.boredelete(no);
		String msg="삭제 실패";
		String url="boardinfo.me?no="+no+"&pageNum="+pageNum+"&kindno="+kindno;
		if(result>0) {
			msg="삭제되었습니다.";
			url="boardlist.me?pageNum="+pageNum+"&kindno="+kindno;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
