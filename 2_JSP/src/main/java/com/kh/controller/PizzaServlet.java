package com.kh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PizzaServlet
 */
@WebServlet("/pizzaOrder.do")
public class PizzaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PizzaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String content = request.getParameter("content");
		String pizza = request.getParameter("pizza");
		String[] topping = request.getParameterValues("topping");
		String[] side = request.getParameterValues("side");
		String payment = request.getParameter("payment");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println(userName + phone + address + content + pizza + String.join(",", topping) +
				String.join(",", side) + payment);
		
		request.setAttribute("userName", userName);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
		request.setAttribute("content", content);
		request.setAttribute("pizza",pizza);
		request.setAttribute("topping", topping);
		request.setAttribute("side", side);
		request.setAttribute("payment", payment);
		
//		RequestDispatcher view = request.getRequestDispatcher("views/.jsp");
		
//		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post으로 요청했다면
		//전달값중에 한글이 포함되어있다면 인코딩 처리를 해야한다(post방식일때만)
		request.setCharacterEncoding("UTF-8");
		
		//요청시 전달한 데이터 추출하기(request에 parameter 영역에 있음)
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String content = request.getParameter("content");
		
		String pizza = request.getParameter("pizza");
		String[] topping = request.getParameterValues("topping");
		String[] side = request.getParameterValues("side");
		String payment = request.getParameter("payment");
		
		System.out.println("name: "+ userName);
		System.out.println("phone: "+ phone);
		System.out.println("address: "+ address);
		System.out.println("content: "+ content);
		
		System.out.println("pizza: "+ pizza);
		System.out.println("topping: "+ String.join(",", topping)); //선택하지 않으면 null이기 때문에 오류가 생긴다
		System.out.println("side: "+ String.join(",", side));
		System.out.println("payment: "+ payment);
		
		//위에서 받아온 데이터로 가공처리 후 service - dao - db 처리까지 
		//완료했다는 가정하에 진행
		
		int price = 0;
		
		switch(pizza) {
		case "콤비네이션": price += 10000; break;
		case "치즈피자": price += 8000; break;
		case "페퍼로니 피자": price += 9000; break;
		case "고구마 피자": price += 9500; break;
		case "치즈크러스트 피자": price += 12000; break;
		}
		
		//토핑 선택 안한 경우 
		if(topping!=null) {
			for(int i=0; i<topping.length; i++) {
				switch(topping[i]) {
				case "bacon": price += 2000; break;
				case "sweetpotato": price += 1500; break;
				case "snowcheeze": price += 2500; break;
				case "shrimp": price += 6000; break; 
				case "olive": price += 1000; break;
				case "pig": price += 5000; break;
				}
			}
		}
		
		//사이드 선택 안한 경우
		if(side!=null) {
			for(int i=0; i<side.length; i++) {
				switch(side[i]) {
				case "cola": price += 1500; break;
				case "spagetti": price += 5000; break;
				case "wings": price += 4000; break;
				case "galic": price += 500; break;
				case "cheezeball": price += 2500; break;
				}
			}
		}
		
		
		//사용자가 보게될 화면(응답페이지) 만들어서 데이터 전달하며 응답 위임하기
		//응답페이지에 필요한 데이터 담기(request attribute 영역)
		request.setAttribute("userName", userName);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
		request.setAttribute("content", content);
		request.setAttribute("pizza",pizza);
		request.setAttribute("topping", topping);
		request.setAttribute("side", side);
		request.setAttribute("payment", payment);
		request.setAttribute("price", price);
		
		//응답할 뷰 선택(jsp)
		RequestDispatcher view = request.getRequestDispatcher("views/05_pizzaPayment.jsp");
		
		view.forward(request, response);
		
		
		
	}

}
