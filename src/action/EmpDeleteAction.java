package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class EmpDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		String memberno = request.getParameter("memberno");
		String name = request.getParameter("name");
		String msg="���� ��� ��ȣ �Դϴ�.";
		String url="empdelete.jsp";
		if(memberno==null || memberno.equals("")) {
			request.setAttribute("msg", "���̵� �Է����ּ���.");
			request.setAttribute("url", "empdelete.jsp");
			return new ActionForward(false, "../alert.jsp");
		}else if(name==null || name.equals("")) {
			request.setAttribute("msg", "�̸��� �Է����ּ���.");
			request.setAttribute("url", "empdelete.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		Member mem = new MemberDao().selectOne(memberno);
		
		if(mem != null) {
	         //3.pass �����ϱ�
	         if(name.equals(mem.getName())) {
	        	 int result = new MemberDao().delete(mem);
	        	 if(result > 0) {
	        		 msg = "��������";
		             url = "../main.me?year="+year+"&month="+month;
	        	 }else {
	        		 msg="���� ����";
	        	 }
	        	 
	         } else {
	            msg = "�����ȣ�� �̸��� ��ġ���� �ʽ��ϴ�.";
	            url="empdelete.jsp?year="+year+"&month="+month;
	         }
	      }
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
