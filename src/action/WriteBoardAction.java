package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.Board;
import model.BoardDao;
import model.Member;
import model.MemberDao;

public class WriteBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/board/file/";
		MultipartRequest multi;
		try {
			String memberno = (String)request.getSession().getAttribute("login");
			Member member = new MemberDao().selectOne(memberno);
	 		Board board = new Board();
	 		multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	 		board.setSubject(multi.getParameter("subject"));
	 		board.setContent(multi.getParameter("content"));
	 		board.setFile1(multi.getFilesystemName("file1"));
	 		board.setName(member.getName());
	 		board.setMemberno(memberno);
	 		board.setKindno(Integer.parseInt(multi.getParameter("kindno")));
	 		int num = new BoardDao().maxNum(board);
	 		board.setNo(++num);
	 		int result = new BoardDao().insert(board);
	 		String msg = null;
	 		String url = "boardlist.me?kindno="+multi.getParameter("kindno");
	 		if(result>0) {
	 			msg = "등록완료";
	 		}else {
	 			msg = "등록실패";
	 		}
	 		request.setAttribute("msg", msg);
	 		request.setAttribute("url", url);
	 		
	 	}catch (IOException e) {
			e.printStackTrace();
		}
	 	return new ActionForward(false, "../alert.jsp");
	}

}
