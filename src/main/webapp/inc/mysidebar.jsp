<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

    	<div class="col-md-4">
<!--      	������ -->
     	<div class="row mb-5">
<!-- 			<div class="membercard"> -->
<!-- 			  <div align="right">			 -->
<!-- 				<button type="button" class="btn btn-secondary btn-sm" id="minibtn" onclick="location.href='./MemberUpdatePw.me' ">�� ����</button> -->
<!-- 			  </div> -->
<!-- 				<div class="text"> -->
<!-- 					<img src="./images/user.png"> -->
<%-- 					<h5>${mDTO.mem_nickName}</h5> --%>
<!-- 					<p>���ǻ��ס���|�������� ����</p> -->
<%-- 					<div align="center">${myqnacnt }��������|�������� ${myreviewcnt }</div>	������ --%>
						
<!-- 				</div> -->
<!-- 			</div> -->
<!--      	������ -->
		
		<!-- �޴��� -->

    <div class="middle-md-12">
        <div class="menu">
            <ul id="noul">
                <li class="buttonitem" id="profile" >
                    <a href="#profile" class="menubtn" ><i class="fa fa-cog"></i> ��Ʈ ����</a>
                    <div class="smenu" >
                        <a href="./ReservationListAction.rez">����/��� ��ȸ</a>
                        <a href="">2</a>
                    </div>
                </li>

                <li class="buttonitem" id="messages">
                    <a href="#messages" class="menubtn"><i class="fa fa-user"></i> ���� �Խñ� ���� </a>
                    <div class="smenu" style="display:block;">
                        <a href="./MyQuestionList.bo" id="smenu">1:1 ���� ����</a>
                        <a href="./ProposalList.bo">��������</a>
                    </div>
                </li>

                <li class="buttonitem" id="settings">
                    <a href="#settings" class="menubtn"><i class="fa fa-cog"></i> �������� ����</a>
                    <div class="smenu">
                        <a href="./MemberUpdate.me">�������� ����</a>
                        <a href="./MemberRemove.me">ȸ��Ż��</a>
<!--                         <a href="">��й�ȣ ����</a> -->
                    </div>
                </li>
                
               </ul>
             </div>
            </div>
		<!-- �޴��� -->
  		</div> 
		</div>