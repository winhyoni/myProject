package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Board;
import model.BoardDao;
import model.Reply;
import model.ReplyDao;

public class BoardInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String kindno = request.getParameter("kindno");
		BoardDao dao = new BoardDao();
		Board board = dao.selectOne(no);
		dao.addReadCnt(no);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("kindno", kindno);
		List<Reply> list = new ArrayList<Reply>();
		list = new ReplyDao().replylist(no);
		request.setAttribute("list", list);
		return new ActionForward(false, "boardinfo.jsp?kindno="+kindno);
	}

}
