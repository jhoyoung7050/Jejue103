<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no"/>
        <title>예약하기</title>
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
            <a class  ="p-2 text-dark"href="pension.html" target="_self" ><h5 class="my-0 mr-md-auto font-weight-normal" style="font-size: 20px!important;">제주에팬션 103</h5></a>
          </div>
          <nav class="my-2 my-md-0 mr-md-3" >
          <div class = "nav-right-items">
            <div class = "navItem"> 
                <a class = "p-2 text-dark"  href="reservation.html" target="_self" style ="border-bottom: 1px solid!important;"> 예약 </a>
            </div>
            <div class = "navItem">
                <a id = "p-2 text-dark"  class  ="p-2 text-dark" href = "map.html" target="_self" >찾아오시는길</a>
            </div>
            <div class = "navItem">
                <a  id = "p-2 text-dark" class  ="p-2 text-dark" href = "tripPoint.html" target="_self" >주변볼거리</a>
            </div>
            <div class = "navItem">
                <a  id = "p-2 text-dark" class  ="p-2 text-dark"  href = "roomInfo.html" target="_self" >객실안내</a>
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
            	 out.println("DB 연동 오류입니다.:" + e.getMessage());
             }
        while(rs.next()){
        %>
         <!-- mySql table 값 가져오기. -->
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
                    var text = '선택하신날짜:  ';
                    var sDate = date[0];
                    var eDate = date[1];
                    document.getElementById("pw3").value =  sDate.format('YYYY-MM-DD');
                    document.getElementById("pw4").value =eDate.format('YYYY-MM-DD');
                    
                    
                    

                    if (date[0] !== null) {
                        text += date[0].format('YYYY-MM-DD');
                    }
        
                    if (date[0] !== null && date[1] !== null) {
                        text += ' ~ ';
                        // 몇일 묵는지 날짜 계산 마지막날 - 첫날 = 몇일 인지
                        precalculation =Math.ceil((eDate-sDate)/(1000*60*60*24));

                    }
                    else if (date[0] === null && date[1] == null) {
                        text += '선택한날 없음';
                    }
        
                    if (date[1] !== null) {
                        text += date[1].format('YYYY-MM-DD');
                    }
                    
                    
        
                    $box.text(text);
                    
                }
                
       
               
            
                
                //팬션 103 에 넣을 달력
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
                    
                    //DB에서 예약 확인 후 블럭처리 해버림
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

    <!-- 예약 드롭박스 관련 . -->

   <div class = container>
     <h2 style="text-align:center;">요금표</h2>
  <div class="card-deck mb-3 text-center">
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Type A</h4>
      </div>
      <div class="card-body" style = "padding-top:15%">
        <h1 class="card-title pricing-card-title">400,000￦</h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li>성인 0~4인 기준입니다</li>
        </ul>
        
      </div>
    </div>
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Type B</h4>
      </div>
      <div class="card-body" style = "padding-top:15%">
        <h1 class="card-title pricing-card-title">500,000￦ </h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li>성인 8인 기준입니다</li>
        </ul>
      </div>
    </div>
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Type C</h4>
      </div>
      <div class="card-body" style = "padding-top:15%">
        <h1 class="card-title pricing-card-title">600,000￦</h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li>성인 12인 기준입니다</li>
        </ul>
      </div>
    </div>
  </div>


        <h3>유의사항: 4인 이상 초과시 성인 인당 25,000원 추가 입니다. 유아 3세~초등학생 10,000원 추가, 아기는 공짜입니다!</h3>
        
   <div class = "calSide" style =" height:575px; ">
   <div class = boxAndCal style = "width:50%;height:auto; float:left!important;">
   <div id="disabled-range" class="article" style = "border-top-width: 0px; margin-top: 0px; padding-top: 0px; ">
            <div class="disabled-range-calendar" style = " width:500px; "></div>
            <br>
             <div class="box" style="margin-top:0!important;"></div>
             
            </div>
            
        </div>
       <div class = nextCal style ="float: right!important; width:50%!important; padding-top:3%;">
      <h3 style ="text-align:center;"><b>인원수를 입력해주세요</b></h3>
      <br>
     
        <div class = "card-deck mb-3 text-center" style="display: inline-block; text-align: center; padding-left:26%;">
          <div class = "adultGroup"style ="text-align: center; ">
            <div class = "reservationNav"style="text-align:center; width:30%;"><b>성인</b></div>
            <div class = "People"> 
              <button onclick="form_btn(-1,'text')" class = "plusMinusBtn" >-</button>
              <input type="text"  id="text" value="1" readonly style="border:0px; width: 20%; text-align: center; font-size:23px;"/>
              <button onclick="form_btn(1,'text')" class = "plusMinusBtn">+</button>
            </div>
         </div>
         <br>
         <br>
         <div class = "kidGroup" style=" text-align: center;">
         <div class="reservationNav"style="text-align:center; width:30%;"><b>유아</b></div>
         <div class = "people"> 
          <button onclick="form_btn(-1,'text1')" class = "plusMinusBtn">-</button>
          <input type="text"  id="text1" value="0" readonly style="border:0px; width: 20%; text-align: center;font-size:23px;" />
          <button onclick="form_btn(1,'text1')" class = "plusMinusBtn">+</button>
         </div>
        </div>
        </div>
     
        </div>
          
        <!-- 미리계산된 결과값 보여주기 . -->
        <div class ="forShadow">
        <div id ="paymentTag" style = "width:328px; margin-left:auto; margin-right:auto; text-color:black; box-shadow: 0 -3px 8px gray;float:right; margin-right:115px;" >내실금액은 0 <small><br>
        내용을 수정한 경우 미리계산 버튼을 한번더 눌러주세요</small> </div> 
        
         <!-- 미리 계산 해보기 버튼 . -->
        <input id = "payment" type = "button" onclick = " finalCalculation(precalculation,'text','text1')" value = "미리계산하기" style = "width:328px; float:right; margin-right:115px;" /><br>
        </div>
        
        </div>
        

        <script>
          // 폼값 증가&감소
        
            function form_btn(n,a){
            
	            var text = document.getElementById(a); // 폼 선택
	            
	            text_val = parseInt(text.value); // 폼 값을 숫자열로 변환
	            
	            text_val += n; // 계산
	            
	            text.value = text_val; // 계산된 값을 바꾼다
	            
	            if(text_val <= 0){
	              text.value = 0;   // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
	            }

            }
          
          
          
           function finalCalculation(a,b,c){
                // a = 숙박일수 b = 어른인원 c = 아이 인원  
                  var daypayment = 400000;//하루 숙박비
                  var caldatepayment =  a; // 숙박일수 결정 해줄꺼임
                  var adult = parseInt((document.getElementById(b)).value);// 어른 인원수
                  var kid = parseInt(document.getElementById(c).value); //아이 인원수
                  var text = document.getElementById("paymentTag");
                 
                  
                  if(adult > 4){
                     daypayment += (adult-4)*25000; // 5명 부터는 인당 성인 2만5천
                  }
                  
                  daypayment += kid * 10000
                  daypayment*= caldatepayment;
              	  text.innerHTML = "내실 금액은 " + daypayment;
              	  
                  if (text.style.display === "none") {
                	 
              	    text.style.display = "none";
              	    
              	  } 
                  
              	}
           
         
        </script>
        
       
        
     
        
        <div class = "allup-line" style ="text-align:center;">
     
        
         <!-- 결제하기 버튼을 누르게 되면 성함과 전화번호 적는칸으로 넘어감. --> 
         
       
        <form action="rpayit.jsp" method="get" onsubmit = "return onlyYes(precalculation,'text','text1')">
        
        <!-- 결과값 받아와서 유저들은 못보게끔처리 하는 과정 --> 
            <p><input type ="hidden" name = "tPayment" id = "pw2" value = "" ></p>
            <p><input type ="hidden" name = "dStart" id = "pw3" value = "" ></p>
            <p><input type ="hidden" name = "dEnd" id = "pw4" value = "" ></p>
            <button id = "payment" type='submit' style = "width:80%!important; height:50px!important;">결제하기</button>
            </form>
        
         </div>
         
         <br>

         <script>
        
         
         // 돈계산 된거 넘겨주는 함수이다
         
         function onlyYes(a,b,c)
         {
        	// a = 숙박일수 b = 어른인원 c = 아쉐리들 인원  
             var daypayment = 400000;//하루 숙박비
             var caldatepayment =  a; // 숙박일수 결정 해줄꺼임
             var adult = parseInt((document.getElementById(b)).value);// 어른 인원수
             var kid = parseInt(document.getElementById(c).value); //아이 인원수
            
             caldatepayment;
             
             if(adult > 4){
                daypayment += (adult-4)*25000; // 5명 부터는 인당 성인 2만5천
             }
             
             daypayment += kid * 10000
             daypayment*= caldatepayment;
             if(daypayment !== 0){
             
        		 document.getElementById("pw2").value = daypayment;
        		 
             }
             else if(daypayment === 0){
            		//결제 페이지에서 재대로 날짜나 인원수 않넣은 경우
            		alert("날짜와 인원수를 다시한번 체크해주세요.")
             	 return false;
             	  
             	  
             	  
            	 }
            	  
            	 
             }
         </script>
         
         
 </div> 
        
          
         
         
         
        <div class = "footer" >
          <ul class= "list-info">
            <li>제주에 펜션</li>
            <li>계좌 번호</li>
            <li>사업자등록번호 : 670-28-00536</li>
            <a href = "https://www.instagram.com/jejuepension103/" target="_blank"><i class="fab fa-instagram" ></i></a>
          </ul>
    
            
        </div>
    
      </body>
</html>