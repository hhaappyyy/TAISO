package com.taiso.admin.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.taiso.admin.member.db.AdminMemberDAO;
import com.taiso.admin.member.db.MemberDTO;

public class AdminMemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminMemberInfoAction_execute 호출");
		
		// 전달정보 저장
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		String pageNum =  request.getParameter("pageNum");
		
		// DAO
		AdminMemberDAO dao = new AdminMemberDAO();
		
		// DTO 정보 가져오기
		MemberDTO mDTO = dao.getMemberInfo(mem_num);
		
		// 정보를 request 영역에 저장(view 전달)
		request.setAttribute("mDTO", mDTO);
		request.setAttribute("pageNum", pageNum);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./adminMember/adminMemberInfo.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}

