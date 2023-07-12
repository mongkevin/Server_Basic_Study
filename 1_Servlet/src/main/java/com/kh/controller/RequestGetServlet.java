package com.kh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestGetServlet
 */
@WebServlet("/test1.do") //매칭주소를 넣는 곳
public class RequestGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestGetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("요청이 잘되나요?");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		/*
		 * GET방식으로 요청했으면 doGet메소드가 호출된다.
		 * 첫번째 매개변수인 HttpSevletRequest 에는 요청시 전달된 내용을 갖고 있다
		 * (입력한 값, 요청전속방식, 사용자의 ip등등)
		 * 두번째 매개변수인 HttpServletResponse에는 요청 처리 후 응답할때 필요한 객체들이 담겨있다.
		 * 
		 * 요청을 처리하기 위해 요청시 전달된 값(사용자가 입력한 값)들을 뽑아준다.
		 * request 객체의 parameter영역 안에 존재한다. (key-value의 형태로 담겨져 있다)
		 * 이때 key는 name속성 value는 value속성값
		 * 
		 * request.getParameter("키값"): (반환타입: String): 무조건 문자열 형으로 반환되기 때문에
		 * 												  필요에 의해 형변환을 하여야한다.
		 * request.getParameterValues("키값"): 반환타입: String[] 
		 * 							-하나의 key값으로 여러개의 value값을 받을 경우 문자열배 형태로 반환받는다.
		 * */
		
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String city = request.getParameter("city");
		//무조건 문자열로 넘어오기 때문에 해당 자료형으로 파싱해야한다.
		double height = Double.parseDouble(request.getParameter("height")); //형변환 파싱 해야함
		String[] foods = request.getParameterValues("food"); //checkbox도 선택안하면 null이 넘어옴
		
		System.out.println("이름: " + name);
		System.out.println("성별: " + gender);
		System.out.println("도시: " + city);
		System.out.println("키: " + height);
		
		System.out.println("좋아하는 음식: " + Arrays.toString(foods));
		
		//지금 얻어온 데이터를 db에 저장하는 작업을 해야한다.(요청처리)
		//보통의 흐름: Service메소드 호출하여 현재 얻어낸 데이터 전달 - dao호출-db작업- 결과 반환.
		
		//위와같은 작업이 진행됐다고 가정하고 사용자가 보게될 응답화면을 구성해보자
		
		//Servlet내에서 응답 화면을 생성하여 보낼것.
		//장점: JAVA코드 내에 작성하기 때문에 반복문이나 조건문, 유용한 메소들을 활용할 수 있다.
		//단점: 복잡하고 혹시라도 html 코드를 수정하고자 할때는 서버를 재실행해서 적용시켜야한다.
		//response객체를 통해서 사용자에거 html(응답화면)전달
		//1)이제부터 전달할 문서형태는 html이고 문자인코딩은 utf-8이라는 것을 지정
		response.setContentType("text/html; charset=UTF-8");
		
		//2)응답하고자하는 사용자(요청했던 사용자)와의 스트림 생성(클라이언트와의 통로
		PrintWriter out = response.getWriter();
		
		//3)생성된 스트림을 통해 응답 html구문을 한줄씩 출력
		out.println("<html>");
		out.println("<head>");
		out.println("<title>힘든 제목입니다.</title>");
		out.println("<style> li{color:salmon;};</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>개인정보 응답화면</h2>");
		out.println("<span>당신의 이름은 "+name+"이군요</span><br>");
		out.printf("<span>키는 %.1fcm이군요</span><br>", height);
		out.printf("<span>사는 곳은 %s군요</span><br>", city);
		
		out.print("성별은");
		if(gender==null) {
			out.print("선택하지 않았군요.<br>");
		}else {
			if(gender.equals("M")) {
				out.print("<span>남자입니다.</span><br>");
			}else {
				out.print("<span>여자입니다.</span><br>");
			}
		}
		
		out.print("좋아하는 음식은");
		if(foods==null) {
			out.print("없습니다..<br>");
		}else {
			out.print("<ul>");
			for(int i=0; i<foods.length; i++) {
				out.printf("<li>%s</li>", foods[i]);
			}
			out.print("</ul>");
		}
		
		out.println("<body>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
