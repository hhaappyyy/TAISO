<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<!-- ������°� -->
  <head>
  <link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
    <title>TAISO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

   
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="./css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="./css/animate.css">
    
    <link rel="stylesheet" href="./css/owl.carousel.min.css">
    <link rel="stylesheet" href="./css/owl.theme.default.min.css">
    <link rel="stylesheet" href="./css/magnific-popup.css">

    <link rel="stylesheet" href="./css/aos.css">

    <link rel="stylesheet" href="./css/ionicons.min.css">

    <link rel="stylesheet" href="./css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="./css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="./css/flaticon.css">
    <link rel="stylesheet" href="./css/icomoon.css">
    <link rel="stylesheet" href="./css/style.css">
   

    
 <script type="text/javascript">
    
   // ���� �󼼺��� 
   function Detail1(){
      Swal.fire({
         title : '�Ϲ����� ���� ��',
          icon: 'info',
         html: '<p>Ÿ�̼Ҵ� ��� �߻� �� û���� ������<br/>�ּ�ȭ�ϰ��� �������� ������ ����帮�� �ֽ��ϴ�.</p><p><b>û����� :</b> 10,000 �� <br/> <b>�����ѵ� :</b> 200 ���� <br/> <b>�ڱ�δ�� :</b> 50 ���� <br/> <b>��������� :</b> 1�� �̻�</p>',
         confirmButtonText: 'Ȯ��'
         
      })
   }
    
    
   function Detail2(){   
      Swal.fire({         
         title : '�������� ���� ��',
          icon: 'info',
         html: '<p>Ÿ�̼Ҵ� ��� �߻� �� û���� ������<br/>�ּ�ȭ�ϰ��� �������� ������ ����帮�� �ֽ��ϴ�.</p><p><b>û����� :</b> 20,000 �� <br/> <b>�����ѵ� :</b> 200 ���� <br/> <b>�ڱ�δ�� :</b> 0 �� <br/> <b>��������� :</b> 1�� �̻�</p>',
         confirmButtonText: 'Ȯ��'
      })
   }         
   
   
   // ���� ��� ���
   function insr1(){ // �Ϲ����� onclick �� 
      var insr = document.fr.insuranceCharge.value="10000";
      var insfee = parseInt(insr);
      var rfee = parseInt(document.fr.car_price.value);
      document.fr.pay_total.value=insfee+rfee;
      
    
   }
   
   function insr2(){ // �������� onclick �� 
      var insr = document.fr.insuranceCharge.value="20000";
      var insfee = parseInt(insr);
      var rfee = parseInt(document.fr.car_price.value);
      document.fr.pay_total.value=insfee+rfee;
   }
   
   </script>
   
   
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>  

   <script type="text/javascript">
   function requestPay() {

       var IMP = window.IMP; // ���� ����
       IMP.init("imp46187616");
//        alert(IMP);
       IMP.request_pay({ 
          pg: "html5_inicis",
//           pay_method: "card",
          merchant_uid: "${mDTO.mem_num}"+new Date().getTime(),   // �����ȣ+�ð���¥����
         name: "${mDTO.mem_num}"+"_"+"${carDTO.car_name}"+" "+"${sessionScope.rez_totalDate }"+"��",
          buyer_email: "${mDTO.mem_email }",
          buyer_name: "${mDTO.mem_name }",
          buyer_tel: "${mDTO.mem_phone }",
            amount: 100                  // ����Ÿ��
       }, function(rsp) {
           if (rsp.success) {

              $.ajax({
                 url: "./ReservationProAction.rez",
                 type: 'POST',
                 dataType: 'json',
                 data:{
                  rez_rentalDate:document.fr.rez_rentalDate.value,
                   rez_returnDate:document.fr.rez_returnDate.value,
                     rez_totalDate:document.fr.rez_totalDate.value,
                     rez_site:document.fr.rez_site.value,
                     car_code:${carDTO.car_code},
                     car_insurance:document.fr.car_insurance.value,
                     mem_id:document.fr.mem_id.value,
                     license_num:document.fr.license_num.value,
                     license_issueDate:document.fr.license_issueDate.value,
                  license_type:document.fr.license_type.value,
                    merchant_uid : rsp.merchant_uid,   // ȸ����ȣ+�ð���¥����
                    pay_uqNum : rsp.imp_uid,         // �ŷ�������ȣ(�ֹ���ȣ)
                    pay_total : rsp.paid_amount,      // �� �����ݾ�
                    pay_method : rsp.pay_method,      // �������
                    pay_status : rsp.status         // ������Ȳ
                 }
              });
                   location.href="./PaymentTest.pay";
           } else {
               var msg = '������ �����Ͽ����ϴ�.';
               msg += '\nerror : ' + rsp.error_msg;
               alert(msg);
               location.href="./ReservationMain.rez";   // �����ʱ�ȭ�� �ϰ�;�
          }
       });
    }
    </script>   
    

<!-- �������Ȯ���ϱ� -->
    <script type="text/javascript">
    
       function checkRez(){ 
       
          
       if(document.fr.license_issueDate.value == ""){
          alert("������ �߱����ڸ� �Է��ϼ���!");
          document.fr.license_issueDate.focus();
          return;
       }   
          
       if(document.fr.license_type.selectedIndex==0){
         alert("���� ������ �Է��ϼ���!");
         document.fr.license_type.focus();
         return;
       }
       
       if(document.fr.license_num.value == ""){
          alert("�ڰ��� ��ȣ�� �Է��ϼ���!");
          document.fr.license_num.focus();
          return;
       }   
         
       if(document.fr.car_insurance[0].checked==false && document.fr.car_insurance[1].checked==false){
         alert("�ڵ��� ������ �������ּ���!");
         return;
      }
       
       if(document.fr.agreement.checked==false){
         alert("��� �����ϼ���");
         return;
      }
       
        var totalCharge = parseInt(document.fr.pay_total.value); // ���������ݾ� 
        var cName = document.fr.car_name.value; // �����̸� 
        var rezDate = document.fr.rez_totalDate.value; // �ѿ����Ͻ� 
        var mName = document.fr.mem_name.value; // ȸ���̸� 
        var rezSite = document.fr.rez_site.value; // �̿�����
       
       Swal.fire({ 
         title: '���� Ȯ�� â', 
         icon: 'success', 
         html: "<h4><b>"+mName+"</b>���� ��Ʈ �Ⱓ�� <b>"+rezDate+"</b>���Դϴ�. </h4></br>"+'<p><b>�����̸� : </b>'+cName+'</p><p><b>�̿����� : </b>'+rezSite+'</p><p><b>���������ݾ� : </b>'+totalCharge+'<b> ��</b></p>',
         showCancelButton: true,         
         confirmButtonColor: '#3085d6', 
         cancelButtonColor: 'grey', 
         confirmButtonText: '����', 
         cancelButtonText: '���' 
       }).then((result) => { 
         if (result.isConfirmed) {           
              //"����" ��ư�� ������ �� ȣ���� �Լ�
            requestPay();
         } 
       }) 
    } 
    
   </script>

  </head>

<!-- ------------------------------------------------------------------------------------------------------- -->

  <body>
  
 <!-- jsp:include -->
 <jsp:include page="../inc/top.jsp"/>
 <!-- jsp:include -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>RESERVATION <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">�����ϱ�</h1>
          </div>
        </div>
      </div>
    </section>
<!-- ������°� -->




 <!-- Left Side �и�(section/div) -->
    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
        
        
        
        
        
<!-- contact �ۼ�Form -->
   <div class="col-md-8 block-9 mb-md-5">
         <form class="bg-light p-5 contact-form" method="post" id="rez" name="fr" >
                
 <!-- Left Side �и�(section/div)-->
<!--            <div class="col-md-4"> -->
              <div class="row mb-5">
                <div class="col-md-12">
                  <!-- <div class="border w-100 p-4 rounded mb-2 d-flex"> -->
                    <div class="form-group">  
                    <p style="text-align:center;">[��������]</p> <br>
                        <label>�뿩�Ͻ� : <input type="text" name="rez_rentalDate" class="form-control2" value="${sessionScope.rez_pick_date }" readonly="readonly"></label><br> <!-- rezDTO -->
                        <label>�ݳ��Ͻ� : <input type="text" name="rez_returnDate" value="${sessionScope.rez_off_date }" class="form-control2" readonly="readonly"></label><br>
                        <label>�뿩�ð� : <input type="text" name="rez_pick_time" value="${sessionScope.rez_pick_time }" class="form-control2" readonly="readonly"></label><br> <!-- rezDTO -->
                        <label>�ݳ��ð� : <input type="text" name="rez_off_time" value="${sessionScope.rez_off_time }" class="form-control2" readonly="readonly"> </label><br>
                        <label>�ѿ����� : <input type="text" name="rez_totalDate" value="${sessionScope.rez_totalDate }" class="form-control2" readonly="readonly"></label><br>
                        <label>�뿩/�ݳ���� : <input type="text" name="rez_site" value="${sessionScope.rez_site }" class="form-control2" readonly="readonly"></label>         
                     </div>
                  <!-- </div> -->
<hr>
<br>
                </div>
                <div class="col-md-12">
<!--                    <div class="border w-100 p-4 rounded mb-2 d-flex"> -->
               <div class="form-group">  
                     <p style="text-align:center;">[������������]</p> <br>
                     <input type="hidden" name="car_code" value="${carDTO.car_code}">
                     <label>���� ī�װ� : <input type="text" name="car_category" value="${carDTO.car_category}" class="form-control2" readonly="readonly"></label> <br>
                      <label>���� �귣�� : <input type="text" name="car_brand" value="${carDTO.car_brand}" class="form-control2" readonly="readonly"></label><br><!-- �ּ��ٿ����޾ƿ��� -->
                     <label>���� �̸� : <input type="text" name="car_name" value="${carDTO.car_name}" class="form-control2" readonly="readonly"></label><br>
                     <label>���� �ɼ� : <input type="text" name="car_op" value="${carDTO.car_op}" class="form-control2" readonly="readonly"></label><br>
                     <label>���� ���� : <input type="text" name="car_year" value="${carDTO.car_year}" class="form-control2" readonly="readonly"></label><br>
                     <label>���� ���� : <input type="text" name="car_fuel" value="${carDTO.car_fuel}" class="form-control2" readonly="readonly"></label><br>
                     </div>
                   </div>
<!--                 </div> -->
                
              </div>
<!--           </div> -->
<!-- Left Side -->               
              <hr>
              <br>
              <br>

          <div class="form-group">
              <h3>�����������Է�</h3>
              
              <input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
        
                �̸� : <input type="text" name="mem_name" class="form-control" class="form-control2" value="${mDTO.mem_name }" readonly="readonly">
          </div> 
          
          <div class="form-group">           
                ��ȭ��ȣ : <input type="text" name="mem_phone" class="form-control" class="form-control2" value="${mDTO.mem_phone }" readonly="readonly">
          </div>  
             
        <div class="form-group">           
                ������� : <input type="text" name="mem_birthday" class="form-control" class="form-control2" value="${mDTO.mem_birthday }" readonly="readonly">
         </div>  
         
         <div class="form-group">      
                �̸��� : <input type="email" name="mem_email" class="form-control" class="form-control2" value="${mDTO.mem_email }" readonly="readonly">
          </div>
              
           <br>
              <hr>
              <br>
              
          <div class="form-group">
              <h3>���������Է�</h3>    
                ����߱����� : <input type="date" class="form-control" name="license_issueDate" class="form-control2" placeholder="����߱����ڸ� ��Ȯ�ϰ� �Է����ּ���.">
          </div>
          
          <div class="form-group">
                  �������� : 
                    <select class="form-control" name="license_type" class="form-control">
                          <option value="0">���������� �����ϼ���</option>
                       <optgroup label="1��">
                           <option>1������</option>
                        <option>1������</option>
                        <option>1������</option>
                     </optgroup>
                     <optgroup label="2��">   
                        <option>2������</option>
                        <option>2������</option>
                   </optgroup>
                   <optgroup label="Ư��">   
                      <option>��������</option>
                      <option>��������</option>
                      <option>����</option>
                   </optgroup>
                    </select>   
          </div>
          
          <div class="form-group">
                 ��������ȣ : <input type="text" name="license_num" class="form-control" value="" maxlength='12' placeholder="int����������ȣ�� ��Ȯ�ϰ� �Է����ּ���.">
          </div>
          
   
           
           <br>
           <hr>
           <br>
           
        <div class="form-group">
         <h3>�ڵ�������</h3>   
            <label><input type="radio" name="car_insurance" onclick="insr1()" value="�Ϲ�����"> �Ϲ�����
               <a href="javascript:Detail1();">�󼼺���</a></label><br>
            <label><input type="radio" name="car_insurance" onclick="insr2()" value="��������"> ��������   
            <a href="javascript:Detail2();">�󼼺���</a></label><br>
        </div>
       
               
        <div class="form-group">   
         <h3>��������</h3>      
            <input type="hidden" name="car_code" value="${param.car_code}">    
            <label>�뿩��� : <input type="text" name="car_price" class="form-control2" value="${carDTO.car_price*sessionScope.rez_totalDate }" readonly="readonly"> ��</label><br>
            <label>������ : <input type="text" name="insuranceCharge" class="form-control2" value="" readonly="readonly">��</label><br>

<%--             <label>������ : <input type="text" name="insuranceCharge" class="form-control2" value="<fmt:formatNumber type="number" value="" />" readonly="readonly"> ��</label><br> --%>
            <label>���� �ݾ� : <input type="text" name="pay_total" class="form-control2" value="" readonly="readonly"> ��</label>
        </div>         

   
        <div class="form-group">     
         <h3>�������</h3>   
            <textarea name="" id="" cols="30" rows="7" class="form-control" readonly="readonly">
������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����
������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����
������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����
������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����
������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����
������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����������� �ܾ�� ����
            </textarea><br>
            <label> <input type="checkbox" name="agreement"> �� ����� ��ü �����մϴ�.</label>
        </div>   
   <br>
   <br>   
          <div class="form-group" id="buttons">
           <input type="button" value="�����ϱ�" onclick="checkRez();" class="btn btn-primary py-3 px-5">
            <input type="button" value="�������" class="btn btn-primary py-3 px-5" onclick="location.href='./views/reservationCancel.jsp';"> 
          </div>
           
        </form>  
      </div>
    </div>   
<!-- contact �ۼ�Form -->


<!-- ���� -->
        <div class="row justify-content-center">
           <div class="col-md-12">
              <div id="map" class="bg-white"></div>
           </div>
        </div>
      </div>
<!-- ���� -->
    </section>
   
   
<!-- Ǫ�͵��°� -->
    <jsp:include page="../inc/bottom.jsp"/>
<!-- Ǫ�͵��°� -->    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="./js/jquery.min.js"></script>
  <script src="./js/jquery-migrate-3.0.1.min.js"></script>
  <script src="./js/popper.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <script src="./js/jquery.easing.1.3.js"></script>
  <script src="./js/jquery.waypoints.min.js"></script>
  <script src="./js/jquery.stellar.min.js"></script>
  <script src="./js/owl.carousel.min.js"></script>
  <script src="./js/jquery.magnific-popup.min.js"></script>
  <script src="./js/aos.js"></script>
  <script src="./js/jquery.animateNumber.min.js"></script>
  <script src="./js/bootstrap-datepicker.js"></script>
  <script src="./js/jquery.timepicker.min.js"></script>
  <script src="./js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="./js/google-map.js"></script>
  <script src="./js/main.js"></script>
  
  </body>
</html>