package com.kh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestPostServlet
 */
@WebServlet("/test2.do")
public class RequestPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("넘어왔나요?");
//		doGet(request, response);
		//POST요청시 값을 추출하기 전에 UTF-8로 인코딩처리를 하여야한다.
		//GET 방식처럼 url에 담겨오지 않기 때문에 기본 인코딩 설정이 ISO-8859-1로 되어있기 때문에
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String city = request.getParameter("city");
		double height = Double.parseDouble(request.getParameter("height"));
		String [] foods = request.getParameterValues("food");
		
		System.out.println("이름: " + name);
		System.out.println("성별: " + gender);
		System.out.println("도시: " + city);
		System.out.println("키: " + height);
		//String.join("구분자",배열);: 구분자를 이용하여 배열을 하나의 문자열로 바꿔주는 메소드
		System.out.println("좋아하는 음식: " + String.join(",", foods));
		
		//처리 과정 진행 후
		
		//응답페이지 만들기
		//순수Servlet: Java코드 내에 html코드를 작성하는 방법
		//JSP(Java Server Page): html내에 java코드를 기술하는 방법
		
		//응답할 작업을 jsp페이지에게 위임해보자
		//응답페이지에서 보여줘야할 데이터를 전달하면서
		//이때 전달할 데이터는 request객체에 담아서 보내야한다.
		//request객체의 attribute 영역에 키와 벨류 세트로 담아서 전달한다.
		
//		request.setAttribute("키", "벨류");
		
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("city", city);
		request.setAttribute("height", height);
		request.setAttribute("foods", foods);
		
		//작업을 위임하기 위해 필요한 객체: RequestDispatcher
		//1)응답하고자하는 뷰(jsp)를 선택하며 생성한다.
		RequestDispatcher view = request.getRequestDispatcher("views/responsePage.jsp");
		
		//forward(): 응답페이지에게 위임하기 
		view.forward(request, response);
	}

}
