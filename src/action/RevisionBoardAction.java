package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Board;
import model.BoardDao;

public class RevisionBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String kindno = request.getParameter("kindno");
		String memberno = (String) request.getSession().getAttribute("login");
		Board board = new BoardDao().selectOne(no);
		
		if(!board.getMemberno().equals(memberno)) {
			request.setAttribute("msg", "수정권한이 없습니다.");
	 		request.setAttribute("url", "boardlist.me?pageNum="+pageNum+"&kindno="+kindno);
	 		return new ActionForward(false, "../alert.jsp");
		}
		
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("kindno", kindno);
		return new ActionForward(false, "updateboard.jsp?kindno="+kindno);
	}

}
