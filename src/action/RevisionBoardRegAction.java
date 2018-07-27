package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.Board;
import model.BoardDao;
import model.Member;
import model.MemberDao;

public class RevisionBoardRegAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/board/file/";
		MultipartRequest multi;
		
		try {
	 		Board board = new Board();
	 		multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	 		board.setNo(Integer.parseInt(multi.getParameter("no")));
	 		board.setSubject(multi.getParameter("subject"));
	 		board.setContent(multi.getParameter("content"));
	 		if(multi.getParameter("file2").equals("")) {
	 			board.setFile1(multi.getFilesystemName("file1"));
	 		}else {
	 			board.setFile1(multi.getParameter("file2"));
	 		}
	 		
	 		int result = new BoardDao().update(board);
	 		String msg = null;
	 		String url = "boardlist.me?pageNum="+multi.getParameter("pageNum")+"&kindno="+multi.getParameter("kindno");
	 		if(result>0) {
	 			msg = "수정 완료";
	 		}else {
	 			msg = "수정 실패";
	 		}
	 		request.setAttribute("msg", msg);
	 		request.setAttribute("url", url);
	 		
	 	}catch (IOException e) {
			e.printStackTrace();
		}
	 	return new ActionForward(false, "../alert.jsp");
	}

}
