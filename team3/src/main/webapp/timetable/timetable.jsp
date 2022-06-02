<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css">
	
	<link href="/team3/css/timetable/timetable.css" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	


</head>
<body>

	<div class="container-lecture">
	
		<section class="header">
			<h3 class="headline">시간표</h3>
		</section>
		
		<div class="row">
		
			<div class="col-md-6 selectbox">
			
				<div class="row" style="margin-right: -60px; margin-left: -2px;">
				
					<div id="collegebox_wrap" class="col-sm-4"> </div>
					
					<div id="departmentbox_wrap" class="col-sm-4"></div> 
				
				</div>
				
			</div>
			
		</div>
		
		<br><br>
		
		<section class="section-nav">
		
			<form id="search-form" class="form-search">
			
				<input type="text" placeholder="강의검색" class="form-control">
				
				<span><i class="material-icons ic-search">search</i></span>
				
			</form>
			
			<div id="lecturelist_wrap">
			
			</div>
		
		</section>
		
		<section class="section-list" style="float: right;">
		
        <div class="container-xl">
        
            <div class="table-schedule">
            
                <div class="timeline">
                
                    <ul>
                        <li><span>09:00</span></li>
                        <li><span>09:30</span></li>
                        <li><span>10:00</span></li>
                        <li><span>10:30</span></li>
                        <li><span>11:00</span></li>
                        <li><span>11:30</span></li>
                        <li><span>12:00</span></li>
                        <li><span>12:30</span></li>
                        <li><span>13:00</span></li>
                        <li><span>13:30</span></li>
                        <li><span>14:00</span></li>
                        <li><span>14:30</span></li>
                        <li><span>15:00</span></li>
                        <li><span>15:30</span></li>
                        <li><span>16:00</span></li>
                        <li><span>16:30</span></li>
                        <li><span>17:00</span></li>
                        <li><span>17:30</span></li>
                        <li><span>18:00</span></li>
                        <li><span>18:30</span></li>
                        <li><span>19:00</span></li>
                        <li><span>19:30</span></li>
                        <li><span>20:00</span></li>
                    </ul>
                    
                </div>

                <div class="table-schedule-subject">
                
                    <ul class="list-lecture-item">
                    
                        <li class="timeline-vertical">
                        
                            <div class="top-info today">
                                <h4 class="day_mon">Mon</h4>
                            </div>
                            
                            <ul>
                            	<li class="lecture_time_list" value="월&#47;1"></li>
                            	<li class="lecture_time_list" value="월&#47;2"></li>
                            	<li class="lecture_time_list" value="월&#47;3"></li>
                            	<li class="lecture_time_list" value="월&#47;4"></li>
                            	<li class="lecture_time_list" value="월&#47;5"></li>
                            	<li class="lecture_time_list" value="월&#47;6"></li>
                            	<li class="lecture_time_list" value="월&#47;7"></li>
                            	<li class="lecture_time_list" value="월&#47;8"></li>
                            	<li class="lecture_time_list" value="월&#47;9"></li>
                            	<li class="lecture_time_list" value="월&#47;10"></li>
                            	<li class="lecture_time_list" value="월&#47;11"></li>
                            </ul>
                            
                        </li>

                        <li class="timeline-vertical">
                        
                            <div class="top-info">
                                <h4 class="day">Tue</h4>
                            </div>
                            
                            <ul>
                            	<li class="lecture_time_list" value="화&#47;1"></li>
                            	<li class="lecture_time_list" value="화&#47;2"></li>
                            	<li class="lecture_time_list" value="화&#47;3"></li>
                            	<li class="lecture_time_list" value="화&#47;4"></li>
                            	<li class="lecture_time_list" value="화&#47;5"></li>
                            	<li class="lecture_time_list" value="화&#47;6"></li>
                            	<li class="lecture_time_list" value="화&#47;7"></li>
                            	<li class="lecture_time_list" value="화&#47;8"></li>
                            	<li class="lecture_time_list" value="화&#47;9"></li>
                            	<li class="lecture_time_list" value="화&#47;10"></li>
                            	<li class="lecture_time_list" value="화&#47;11"></li>
                                
                            </ul>
                            
                        </li>

                        <li class="timeline-vertical">
                        
                            <div class="top-info">
                                <h4 class="day">Wed</h4>
                            </div>

                            <ul>
                            	<li class="lecture_time_list" value="수&#47;1"></li>
                            	<li class="lecture_time_list" value="수&#47;2"></li>
                            	<li class="lecture_time_list" value="수&#47;3"></li>
                            	<li class="lecture_time_list" value="수&#47;4"></li>
                            	<li class="lecture_time_list" value="수&#47;5"></li>
                            	<li class="lecture_time_list" value="수&#47;6"></li>
                            	<li class="lecture_time_list" value="수&#47;7"></li>
                            	<li class="lecture_time_list" value="수&#47;8"></li>
                            	<li class="lecture_time_list" value="수&#47;9"></li>
                            	<li class="lecture_time_list" value="수&#47;10"></li>
                            	<li class="lecture_time_list" value="수&#47;11"></li>

                            </ul>
                            
                        </li>

                        <li class="timeline-vertical">
                        
                            <div class="top-info">
                                <h4 class="day">Thu</h4>
                            </div>

                            <ul>
                            	<li class="lecture_time_list" value="목&#47;1"></li>
                            	<li class="lecture_time_list" value="목&#47;2"></li>
                            	<li class="lecture_time_list" value="목&#47;3"></li>
                            	<li class="lecture_time_list" value="목&#47;4"></li>
                            	<li class="lecture_time_list" value="목&#47;5"></li>
                            	<li class="lecture_time_list" value="목&#47;6"></li>
                            	<li class="lecture_time_list" value="목&#47;7"></li>
                            	<li class="lecture_time_list" value="목&#47;8"></li>
                            	<li class="lecture_time_list" value="목&#47;9"></li>
                            	<li class="lecture_time_list" value="목&#47;10"></li>
                            	<li class="lecture_time_list" value="목&#47;11"></li>

                            </ul>
                            
                        </li>

                        <li class="timeline-vertical">
                        
                            <div class="top-info">
                                <h4 class="day">Fri</h4>
                            </div>

                            <ul>
                            	<li class="lecture_time_list" value="금&#47;1"></li>
                            	<li class="lecture_time_list" value="금&#47;2"></li>
                            	<li class="lecture_time_list" value="금&#47;3"></li>
                            	<li class="lecture_time_list" value="금&#47;4"></li>
                            	<li class="lecture_time_list" value="금&#47;5"></li>
                            	<li class="lecture_time_list" value="금&#47;6"></li>
                            	<li class="lecture_time_list" value="금&#47;7"></li>
                            	<li class="lecture_time_list" value="금&#47;8"></li>
                            	<li class="lecture_time_list" value="금&#47;9"></li>
                            	<li class="lecture_time_list" value="금&#47;10"></li>
                            	<li class="lecture_time_list" value="금&#47;11"></li>
                                
                            </ul>
                            
                        </li>
                        
                    </ul>
                    
                </div>
                
            </div>
            
        </div>
        
    </section>
		
		
		<div class="col-5" style="float: right; display: none;">
				
			<table class="timetable" id="timetable">
				
				  <tr style="width: 100%; text-align: center;">
				    <td class="head"></td>
				    <td class="head">월</td>
				    <td class="head">화</td>
				    <td class="head">수</td>
				    <td class="head">목</td>
				    <td class="head">금</td>
				  </tr>
				
				  <tr>
				    <td class="head">9</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">10</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">11</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">12</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">1</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">2</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">3</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">4</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">5</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">6</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td class="head">7</td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td></td>
				  </tr>
				  
				</table>
				
			</div>

				
				
			<div class="modal fade" id="modal-lecture-info" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
				
					<div class="modal-content"> 
					
						<div class="modal-header">
						
							 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						
						</div>
						
						<div class="modal-body">
						
							<h3 class="lecture_title">1</h3>
							
							<ul class="lecture-info">
							
									<li class="lecture-time">
									
										<i class="material-icons ic-lecture-info">access_alarm</i>
										강의시간 : <span class="lecture_time">1</span><span class="lecture_time_db" style="display: none;"></span>
										
									</li>
									
									<li class="lecture-code">
										<i class="material-icons ic-lecture-info">code</i>
										교과목 코드 : <span class="lecutre_code">1</span> 
									</li>
									
									<li class="lecture-code">
										<i class="material-icons ic-lecture-info">school</i>
										담당 교수 : <span class="lecture_professor">1</span>
									</li>
									
								</ul>
								
								<div class="lecture-description">
									<p class="txt-description">텍스트디스크립션</p>
								</div>
								
						</div>
						
						<div class="modal-footer">
						
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="btn_regist">과목 등록하기</button>
						
						</div>
					
					</div>
				
				</div>
				
			</div>

		
		
	
	</div>
	
	

	
	
	<!-- Latest compiled and minified JavaScript -->




	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
	
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- Latest compiled and minified JavaScript -->
	

	
	
	<script src="/team3/js/timetable.js" type="text/javascript"></script>
	
	<script src="https://kit.fontawesome.com/d77abffe02.js"></script>
	
	
	

</body>
</html>