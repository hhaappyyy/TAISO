<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

  	<div class="m-col-md-4">
        	
     	<!-- ������ -->
			<div class="membercard">
			  <div align="right">			
				<button type="button" class="btn btn-secondary btn-sm" id="minibtn" onclick="location.href='./MemberUpdatePw.me' ">�� ����</button>
			  </div>
				<div class="text">
					<img src="./images/user.png">
					<h5>${mDTO.mem_nickName}</h5>
					<p>���ǻ��ס���|�������� ����</p>
					<div align="center">${myqnacnt }��������|�������� ${myreviewcnt }</div>	�� ����
						
				</div>
			</div>
     	<!-- ������ -->

  <!-- �޴��� -->
					
<ul class="accordion-menu" >
  <li>
    <div class="dropdownlink" ><i class="fa-solid fa-bolt fa-fw" aria-hidden="true"></i>������ ��Ʈ ����
      <i class="fa fa-chevron-down fa-pull-right" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">	
      <li ><a href="./ReservationList.rez">����/��� ��ȸ</a></li>
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa-solid fa-car fa-fw" aria-hidden="true"></i>�� ���� �Խñ� ����
      <i class="fa fa-chevron-down fa-pull-right"  aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="./MyQuestionList.bo">1:1 ���� ����</a></li>
      <li><a href="./ProposalList.bo">��������</a></li>
    </ul>
  </li>
  <li>
    <div class="dropdownlink"><i class="fa-solid fa-comments fa-fw" aria-hidden="true"></i>�� �������� ����
      <i class="fa fa-chevron-down fa-pull-right" aria-hidden="true"></i>
    </div>
    <ul class="submenuItems">
      <li><a href="./MemberUpdatePw.me">�������� ����</a></li>
      <li><a href="./MemberRemove.me">ȸ�� Ż��</a></li>
    </ul>
  </li>

</ul>

</div>


		<!-- �޴��� -->
