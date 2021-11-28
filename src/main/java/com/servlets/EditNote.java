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
 * Servlet implementation class EditNote
 */
public class EditNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int id=Integer.parseInt(request.getParameter("noteId"));
			
		
				
				Session s=FactoryHandler.getFact().openSession();
				Transaction tx=s.beginTransaction();
				
				Note note=s.get(Note.class, id);
				
				note.setHead(title);
				note.setContent(content);
				note.setDate(new Date());
				
				tx.commit();
				
				s.close();
				
				HttpSession session=request.getSession();
				session.setAttribute("message", "Note Edited Successfully");
				response.sendRedirect("allnote.jsp");
				return;
				
				
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
