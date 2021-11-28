package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.handler.FactoryHandler;

/**
 * Servlet implementation class AddNote
 */
public class AddNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNote() {
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
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		try {
			
			Note note=new Note();
			note.setHead(title);
			note.setContent(content);
			note.setDate(new Date());
			
			
			Session s=FactoryHandler.getFact().openSession();
			Transaction t=s.beginTransaction();
			t.commit();
			
			s.save(note);
			
			s.close();
			
			HttpSession session=request.getSession();
			session.setAttribute("message", "Note Added Successfully");
			response.sendRedirect("addnote.jsp");
			return;
			 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
