<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no"/>
        <title>�����ϱ�</title>
        <link href="./styles/pDesign.css" rel="stylesheet" type="text/css" />
        <link href="./styles/Calendar.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
        <link href="./styles/pricing.css" rel="stylesheet">
        <link href="./bootstrap-4.5.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <meta property="og:url" content="http://www.pigno.se/barn/PIGNOSE-Calendar">
        <meta property="og:type" content="product"/>
        <meta property="og:title" content="PIGNOSE Calendar"/>
        <meta property="og:description" content="PIGNOSE Calendar is beautiful and eidetic jQuery date picker plugin"/>
        <meta property="og:image" content="http://www.pigno.se/barn/PIGNOSE-Calendar/demo/img/cover@250.png"/>
        <meta property="og:site_name" content="PIGNOSE"/>
        <title>PIGNOSE Calendar</title>
        <meta name="description" content="PIGNOSE Calendar is beautiful and eidetic jQuery date picker plugin"/>
        <link rel="shortcut icon" type="image/x-icon" href="demo/img/pignose-ico.ico"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.13.0/themes/prism.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/components/icon.min.css">
        <link rel="stylesheet" type="text/css" href="./pg-calendar/demo/css/style.css"/>
        <link rel="stylesheet" type="text/css" href="./pg-calendar/demo/css/ui.css"/>
        <link rel="stylesheet" type="text/css" href="./pg-calendar/dist/css/pignose.calendar.min.css"/>
        
        <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
</style>




    
      </head>
    
      <body class = "containers">
     
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm"  >
          <div class = "Pension-name">
            <a class  ="p-2 text-dark"href="pension.html" target="_self" ><h5 class="my-0 mr-md-auto font-weight-normal" style="font-size: 20px!important;">���ֿ��Ҽ� 103</h5></a>
          </div>
          <nav class="my-2 my-md-0 mr-md-3" >
          <div class = "nav-right-items">
            <div class = "navItem"> 
                <a class = "p-2 text-dark"  href="reservation.html" target="_self" style ="border-bottom: 1px solid!important;"> ���� </a>
            </div>
            <div class = "navItem">
                <a id = "p-2 text-dark"  class  ="p-2 text-dark" href = "map.html" target="_self" >ã�ƿ��ô±�</a>
            </div>
            <div class = "navItem">
                <a  id = "p-2 text-dark" class  ="p-2 text-dark" href = "tripPoint.html" target="_self" >�ֺ����Ÿ�</a>
            </div>
            <div class = "navItem">
                <a  id = "p-2 text-dark" class  ="p-2 text-dark"  href = "roomInfo.html" target="_self" >���Ǿȳ�</a>
            </div>
          </div> 
          </nav>
        </div>
        
       
        <%   
	 
	   
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
      
        try{
              Class.forName("com.mysql.jdbc.Driver");
              String jdbcurl = "jdbc:mysql://localhost:3306/guest?serverTimezone=UTC";
              conn = DriverManager.getConnection(jdbcurl, "root", "Jung90500!");
              stmt = conn.createStatement();
              String sql = "select * from guest";
              
              
              rs = stmt.executeQuery(sql);
        }
             catch(Exception e){
            	 out.println("DB ���� �����Դϴ�.:" + e.getMessage());
             }
        while(rs.next()){
        %>
         <!-- mySql table �� ��������. -->
          <input type = "hidden" id="start" value = "<%= rs.getString("sDate")%>"  pattern="[0-9]{6}"/>
          <input type = "hidden" id = "end" value = "<%= rs.getString("eDate")%>"/>
        
              
         <%
        }
         %>     
       
     <% 
       stmt.close();
       conn.close();
   %>
 



       
       
        
        
        
          
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>
        <script type="text/javascript" src="./pg-calendar/dist/js/pignose.calendar.full.min.js"></script>
        <script type="text/javascript">
            //<![CDATA[
            	var precalculation=0;
            	 
         			
         			
         			
            	
            	
            $(function () {
            	
            	
            	 $('#wrapper .version strong').text('v' + $.fn.pignoseCalendar.version);
              
        
                function onSelectHandler(date, context) {
                    /**
                     * @date is an array which be included dates(clicked date at first index)
                     * @context is an object which stored calendar interal data.
                     * @context.calendar is a root element reference.
                     * @context.calendar is a calendar element reference.
                     * @context.storage.activeDates is all toggled data, If you use toggle type calendar.
                     * @context.storage.events is all events associated to this date
                     */
        
                    var $element = context.element;
                    var $calendar = context.calendar;
                    var $box = $element.siblings('.box').show();
                    var text = '�����Ͻų�¥:  ';
                    var sDate = date[0];
                    var eDate = date[1];
                    document.getElementById("pw3").value =  sDate.format('YYYY-MM-DD');
                    document.getElementById("pw4").value =eDate.format('YYYY-MM-DD');
                    
                    
                    

                    if (date[0] !== null) {
                        text += date[0].format('YYYY-MM-DD');
                    }
        
                    if (date[0] !== null && date[1] !== null) {
                        text += ' ~ ';
                        // ���� ������ ��¥ ��� �������� - ù�� = ���� ����
                        precalculation =Math.ceil((eDate-sDate)/(1000*60*60*24));

                    }
                    else if (date[0] === null && date[1] == null) {
                        text += '�����ѳ� ����';
                    }
        
                    if (date[1] !== null) {
                        text += date[1].format('YYYY-MM-DD');
                    }
                    
                    
        
                    $box.text(text);
                    
                }
                
       
               
            
                
                //�Ҽ� 103 �� ���� �޷�
                let tDay = new Date();
                let calDate = tDay.getDate(28);
              
                // Disabled Range Calendar.
                 var firstDate =  document.getElementById("start").value;
         
     			var secondDate = document.getElementById("end").value;
     		
     	
           
                var minDate = moment().set('dates', calDate ).format('YYYY-MM-DD');
                var maxDate = moment().set('dates', Math.max(moment().day(), 365)).format('YYYY-MM-DD');
                $('.disabled-range-calendar').pignoseCalendar({
                    select: onSelectHandler,
                    minDate: minDate,
                    maxDate: maxDate, 
                    
                    //DB���� ���� Ȯ�� �� ��ó�� �ع���
                	disabledRanges: [
            			[firstDate, secondDate],
            		
            		],
                  
            		
                    
               
                    
                    pickWeeks: false,
                    multiple: true,
                    
                
                    


                   
                });
                
               
                	
                });
                
                
          	 
          	  
          
           
         
			
           
           
           
            //]]>
        </script>
        
      
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.13.0/prism.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.13.0/components/prism-javascript.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.13.0/components/prism-typescript.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.13.0/components/prism-json.min.js"></script>
    <script type="text/javascript" src="https://twemoji.maxcdn.com/2/twemoji.min.js?2.5"></script>
    
    <br><br>

    <!-- ���� ��ӹڽ� ���� . -->

   <div class = container>
     <h2 style="text-align:center;">���ǥ</h2>
  <div class="card-deck mb-3 text-center">
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Type A</h4>
      </div>
      <div class="card-body" style = "padding-top:15%">
        <h1 class="card-title pricing-card-title">400,000��</h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li>���� 0~4�� �����Դϴ�</li>
        </ul>
        
      </div>
    </div>
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Type B</h4>
      </div>
      <div class="card-body" style = "padding-top:15%">
        <h1 class="card-title pricing-card-title">500,000�� </h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li>���� 8�� �����Դϴ�</li>
        </ul>
      </div>
    </div>
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Type C</h4>
      </div>
      <div class="card-body" style = "padding-top:15%">
        <h1 class="card-title pricing-card-title">600,000��</h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li>���� 12�� �����Դϴ�</li>
        </ul>
      </div>
    </div>
  </div>


        <h3>���ǻ���: 4�� �̻� �ʰ��� ���� �δ� 25,000�� �߰� �Դϴ�. ���� 3��~�ʵ��л� 10,000�� �߰�, �Ʊ�� ��¥�Դϴ�!</h3>
        
   <div class = "calSide" style =" height:575px; ">
   <div class = boxAndCal style = "width:50%;height:auto; float:left!important;">
   <div id="disabled-range" class="article" style = "border-top-width: 0px; margin-top: 0px; padding-top: 0px; ">
            <div class="disabled-range-calendar" style = " width:500px; "></div>
            <br>
             <div class="box" style="margin-top:0!important;"></div>
             
            </div>
            
        </div>
       <div class = nextCal style ="float: right!important; width:50%!important; padding-top:3%;">
      <h3 style ="text-align:center;"><b>�ο����� �Է����ּ���</b></h3>
      <br>
     
        <div class = "card-deck mb-3 text-center" style="display: inline-block; text-align: center; padding-left:26%;">
          <div class = "adultGroup"style ="text-align: center; ">
            <div class = "reservationNav"style="text-align:center; width:30%;"><b>����</b></div>
            <div class = "People"> 
              <button onclick="form_btn(-1,'text')" class = "plusMinusBtn" >-</button>
              <input type="text"  id="text" value="1" readonly style="border:0px; width: 20%; text-align: center; font-size:23px;"/>
              <button onclick="form_btn(1,'text')" class = "plusMinusBtn">+</button>
            </div>
         </div>
         <br>
         <br>
         <div class = "kidGroup" style=" text-align: center;">
         <div class="reservationNav"style="text-align:center; width:30%;"><b>����</b></div>
         <div class = "people"> 
          <button onclick="form_btn(-1,'text1')" class = "plusMinusBtn">-</button>
          <input type="text"  id="text1" value="0" readonly style="border:0px; width: 20%; text-align: center;font-size:23px;" />
          <button onclick="form_btn(1,'text1')" class = "plusMinusBtn">+</button>
         </div>
        </div>
        </div>
     
        </div>
          
        <!-- �̸����� ����� �����ֱ� . -->
        <div class ="forShadow">
        <div id ="paymentTag" style = "width:328px; margin-left:auto; margin-right:auto; text-color:black; box-shadow: 0 -3px 8px gray;float:right; margin-right:115px;" >���Ǳݾ��� 0 <small><br>
        ������ ������ ��� �̸���� ��ư�� �ѹ��� �����ּ���</small> </div> 
        
         <!-- �̸� ��� �غ��� ��ư . -->
        <input id = "payment" type = "button" onclick = " finalCalculation(precalculation,'text','text1')" value = "�̸�����ϱ�" style = "width:328px; float:right; margin-right:115px;" /><br>
        </div>
        
        </div>
        

        <script>
          // ���� ����&����
        
            function form_btn(n,a){
            
	            var text = document.getElementById(a); // �� ����
	            
	            text_val = parseInt(text.value); // �� ���� ���ڿ��� ��ȯ
	            
	            text_val += n; // ���
	            
	            text.value = text_val; // ���� ���� �ٲ۴�
	            
	            if(text_val <= 0){
	              text.value = 0;   // ���� ���� 0 ���ϸ� 1�� �ǵ����ش�, 1���� ���� ���� ��Ÿ���� �ʰ��ϱ� ����   
	            }

            }
          
          
          
           function finalCalculation(a,b,c){
                // a = �����ϼ� b = ��ο� c = ���� �ο�  
                  var daypayment = 400000;//�Ϸ� ���ں�
                  var caldatepayment =  a; // �����ϼ� ���� ���ٲ���
                  var adult = parseInt((document.getElementById(b)).value);// � �ο���
                  var kid = parseInt(document.getElementById(c).value); //���� �ο���
                  var text = document.getElementById("paymentTag");
                 
                  
                  if(adult > 4){
                     daypayment += (adult-4)*25000; // 5�� ���ʹ� �δ� ���� 2��5õ
                  }
                  
                  daypayment += kid * 10000
                  daypayment*= caldatepayment;
              	  text.innerHTML = "���� �ݾ��� " + daypayment;
              	  
                  if (text.style.display === "none") {
                	 
              	    text.style.display = "none";
              	    
              	  } 
                  
              	}
           
         
        </script>
        
       
        
     
        
        <div class = "allup-line" style ="text-align:center;">
     
        
         <!-- �����ϱ� ��ư�� ������ �Ǹ� ���԰� ��ȭ��ȣ ����ĭ���� �Ѿ. --> 
         
       
        <form action="rpayit.jsp" method="get" onsubmit = "return onlyYes(precalculation,'text','text1')">
        
        <!-- ����� �޾ƿͼ� �������� �����Բ�ó�� �ϴ� ���� --> 
            <p><input type ="hidden" name = "tPayment" id = "pw2" value = "" ></p>
            <p><input type ="hidden" name = "dStart" id = "pw3" value = "" ></p>
            <p><input type ="hidden" name = "dEnd" id = "pw4" value = "" ></p>
            <button id = "payment" type='submit' style = "width:80%!important; height:50px!important;">�����ϱ�</button>
            </form>
        
         </div>
         
         <br>

         <script>
        
         
         // ����� �Ȱ� �Ѱ��ִ� �Լ��̴�
         
         function onlyYes(a,b,c)
         {
        	// a = �����ϼ� b = ��ο� c = �ƽ����� �ο�  
             var daypayment = 400000;//�Ϸ� ���ں�
             var caldatepayment =  a; // �����ϼ� ���� ���ٲ���
             var adult = parseInt((document.getElementById(b)).value);// � �ο���
             var kid = parseInt(document.getElementById(c).value); //���� �ο���
            
             caldatepayment;
             
             if(adult > 4){
                daypayment += (adult-4)*25000; // 5�� ���ʹ� �δ� ���� 2��5õ
             }
             
             daypayment += kid * 10000
             daypayment*= caldatepayment;
             if(daypayment !== 0){
             
        		 document.getElementById("pw2").value = daypayment;
        		 
             }
             else if(daypayment === 0){
            		//���� ���������� ���� ��¥�� �ο��� �ʳ��� ���
            		alert("��¥�� �ο����� �ٽ��ѹ� üũ���ּ���.")
             	 return false;
             	  
             	  
             	  
            	 }
            	  
            	 
             }
         </script>
         
         
 </div> 
        
          
         
         
         
        <div class = "footer" >
          <ul class= "list-info">
            <li>���ֿ� ���</li>
            <li>���� ��ȣ</li>
            <li>����ڵ�Ϲ�ȣ : 670-28-00536</li>
            <a href = "https://www.instagram.com/jejuepension103/" target="_blank"><i class="fab fa-instagram" ></i></a>
          </ul>
    
            
        </div>
    
      </body>
</html>