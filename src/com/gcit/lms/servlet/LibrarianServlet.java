package com.gcit.lms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcit.jdbc.entity.Branch;
import com.gcit.jdbc.service.LibrarianService;

/**
 * Servlet implementation class LibrarianServlet
 */
@WebServlet("/librarianServlet")
public class LibrarianServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LibrarianServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("getAllBranch") != null) {
			writeAllBranch(response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*if (request.getParameter("authorName") != null) {
			addAuthor(request.getParameter("authorName"));	
		}*/
	}

	public void writeAllBranch (HttpServletResponse response) throws IOException {
		LibrarianService libService = new LibrarianService();
	    List<Branch> branches = null;
	    try {
	    	branches = libService.getAllBranch();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		out.println("<P ALIGN='center'><TABLE BORDER=1>");
		 
		// table header
		out.println("<TR>");
		out.println("<TH>" + "Id" + "</TH>");
		out.println("<TH>" + "Name" + "</TH>");
		out.println("<TH>" + "Address" + "</TH>");
		out.println("</TR>");
		
		//table data
		//int rowCount = 0;
	    for (Branch branch : branches) {
	    	out.println("<TR>");
	    	out.println("<TD>"+branch.getBranchId()+"</TD>");
	    	out.println("<TD>"+branch.getName()+"</TD>");
	    	out.println("<TD>"+branch.getAddress()+"</TD>");
	    	out.println("</TR>");
	    }
	    
	    out.println("</TABLE></P>");
	    out.close();
	}
}
