<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
   .test{
      border: 1px solid black;
   }
   .first{
      display: flex;
      border: 3px solid gold;
      margin-left : 20%;
      margin-right: 20%;
      padding : 0px;
      widht: 1200px;
      heihg:600px;
   }
   .box{
      justify-content:center;
   }
   .button_brand{
      background-color:white;
      font-size:20px;
      padding : 2px;
      border-radius: 5px;
      border: 1px solid black;
      font-family: Georgia, "Malgun Gothic", serif;
   }
   .table_first{
      margin : 10px;
      width : 380px;
   }
   .btn_pay{
      background-color: #DAO641;
      color:white;
         font-size: 18px;
   }
   .btn_bucket{
      background-color: #DAO641;
      color:white;
         font-size: 18px;
   }
</style>
<!--  -->
<body>
<script>

function numcheck(val,jaego){
                      if (val>jaego-1){
                              alert("����� �����ϴ�")
                              document.frm.ea.value=jaego}
                      else if (val<2){
                              document.frm.ea.value=1        }
      }
function up(val,jaego){
                      if (val>jaego-1){
                              alert("����� �����ϴ�")
                              document.frm.ea.value=jaego}
                      else{
                              document.frm.ea.value=(val/1)+1}
}
                                                       
function down(val){
                      if (val<2){
                              document.frm.ea.value=1}
                      else{
                              document.frm.ea.value=val-1}
}

</script>
   <div>
      <div class=test>
      <!-- ��� ��ǰ���� -->
         <div class=first>
            <img class=box src="http://via.placeholder.com/" width=400 height=500 style="padding-top:10px; padding-left : 10px;">
            
            <div>
               <div class=box>
                  <table class="table_first" border="1">
                     <tr>
                        <th align="left" colspan="2">
                           <input type="button" value="�귣�� �ѷ����� " class="button_brand" onclick="location.href='�귣���.jpg'">
                        </th>
                     </tr>
                     
                     <tr>
                        <th align="left" style="font-size : 3rem" colspan="2"> ��ǰ��<!-- ${product.product_name} --></th>                     
                     </tr>
                     
                     <tr>
                        <td>��ǰ ����</td>
                        <td>1000<td>
                     </tr>
                     
                     <tr>
                        <th align="left" colspan="2">�������</th>
                     </tr>
                     
                     <tr>
                        <td>�Ϲݹ��</td>
                        <td style="font-size : 15px">|2500��(20,000�� �̻� ������)</td>
                     </tr>
                     
                     <tr>
                        <th></th>
                        <td align="left">���3~5�� �̳� ���</td>
                     </tr>                     
                  </table>
                  
                  <hr>
                  
                  <!-- ���ż��� �հ�ݾ� -->
                  <table class="table_first" >
                     <tr>
                        <th align="left" width="100px;">���� ����</th>
                        
                        <td>
                        <input type="text" name="ea" class="form" size="2" value="1" 
                        maxlength="2" onblur="numcheck(this.form.ea.value,10)" 
                        onkeyup="if(isNaN(this.value)) {alert('���ڸ� �Է��� �ּ���.');this.value=''};">
                        </td>      
                        <td valign="middle"height="25">
                           <input type="button" value="��" onclick="up(this.form.ea.value,10)" 
                           style="background-color:white;border:0; height:10px;;font-size:12px" name="plus">
                           <br>
                           <input type="button" value="��" onclick="down(this.form.ea.value)" 
                           style="background-color:white;border:0; height:10px;font-size:12px" name="minus">                  
                        </td>                  
                     </tr>
                     
                     <tr>
                        <th align="left" width="100px;">�հ� �ݾ�</th>
                        <td align="center">1</td>
                     </tr>
                                          
                  </table>
                  
                  <hr>
                  
                  <table class="table_first">
                     <tr>
                        <td align="right">
                           <input type="button" class="btn_pay" value="�ٷα���" onclick="location.href='����������.jpg'">
                        </td>      
                        <td>
                           <input type="button" class="btn_bucket" value="��ٱ���"  onclick="location.href='��ٱ���������.jpg'">      
                        </td>               
                     </tr>                  
                  </table>
               </div>
            </div>
         </div>
      </div>
      
      <div>
         <h1>��õ��ǰ</h1>
      <!-- �ߴ� ��õ��ǰ��� -->
      </div>
      
      <div>
         <h1>��ǰ����</h1>
      <!-- ��ǰ����/����/���/qna �޴� -->
      </div>
   </div>
</body>
</html>