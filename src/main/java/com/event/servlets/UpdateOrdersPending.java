package com.event.servlets;

import java.io.IOException;

import com.event.dao.EventOrdersDAO;
import com.event.dao.EventOrdersDAOImpl;
import com.event.dto.EventOrders;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/updatepending")
public class UpdateOrdersPending extends HttpServlet{

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if (session == null || session.getAttribute("users") == null) {
            req.setAttribute("error", "please login to cancle");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
            return;
        }
		EventOrders eo=new EventOrders();
		EventOrdersDAO eodao=new EventOrdersDAOImpl();
		eo.setOrder_id(Integer.parseInt(req.getParameter("orderId")));
		eo.setStatus(req.getParameter("status"));
		if(eodao.updateEventOrders(eo)) {
			req.setAttribute("success", "Data Saved");
			RequestDispatcher rd=req.getRequestDispatcher("pendingorder.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error", "failed to Save");
			RequestDispatcher rd=req.getRequestDispatcher("pendingorder.jsp");
			rd.forward(req, resp);
		}
		
	}
}
