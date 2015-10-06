package com.gcit.lms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcit.jdbc.entity.Author;
import com.gcit.jdbc.entity.Borrower;
import com.gcit.jdbc.entity.Branch;
import com.gcit.jdbc.entity.Publisher;
import com.gcit.jdbc.service.AdministratorService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private AdministratorService adminService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        
        adminService = new AdministratorService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<html>");
	    out.println("<head><title>All Branch</title></head>");
	    out.println("<body>");
	    out.println("<center><h1>All Branch sssss</h1>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		//Add author
		if (request.getParameter("authorName") != null) {
			addAuthor(request.getParameter("authorName"));	
		}
		
		//Update author
		if (request.getParameter("exAuthorName") != null && request.getParameter("newAuthorName") != null ) {
			updateAuthor(request.getParameter("exAuthorName"), request.getParameter("newAuthorName"));
		}
		
		
		
		//Add Publisher
		if (request.getParameter("publisherName") != null) {
			Publisher pub = new Publisher();
			pub.setPublisherName(request.getParameter("publisherName"));
			
			//this could be null, but not for publisher name
			pub.setAddress(request.getParameter("publisherAddress"));
			pub.setPhone(request.getParameter("publisherPhone"));
			
			addPublisher(pub);
		}
		
		//Add Borrower
		if (request.getParameter("borrowerName") != null) {
			Borrower borrow = new Borrower();
			borrow.setName(request.getParameter("borrowerName"));
			
			//this could be null;
			borrow.setAddress(request.getParameter("borrowerAddress"));
			borrow.setPhone(request.getParameter("borrowerPhone"));
			
			addBorrower(borrow);
		}

		//Add Branch
		if (request.getParameter("branchName") != null) {
			Branch branch = new Branch();
			branch.setName(request.getParameter("branchName"));
			
			//this could be null;
			branch.setAddress(request.getParameter("branchAddress"));

			addBranch(branch);
		}
		
		
	}
	
	
	public void addAuthor(String authorName) {
		Author author = new Author();
		author.setAuthorName(authorName);
		
		try {
			new AdministratorService().addAuthor(author);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateAuthor(String exName, String newName) {
		try {
			adminService.updateAuthorByName(exName, newName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addPublisher(Publisher pub) {
		try {
			new AdministratorService().addPublisher(pub);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addBorrower(Borrower borrower) {
		try {
			new AdministratorService().addBorrower(borrower);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addBranch(Branch branch) {
		try {
			adminService.addBranch(branch);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
