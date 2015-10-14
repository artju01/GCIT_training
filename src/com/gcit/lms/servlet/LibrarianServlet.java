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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gcit.jdbc.entity.Author;
import com.gcit.jdbc.entity.Book;
import com.gcit.jdbc.entity.BookCopies;
import com.gcit.jdbc.entity.Branch;
import com.gcit.jdbc.entity.Genre;
import com.gcit.jdbc.service.AdministratorService;
import com.gcit.jdbc.service.LibrarianService;

/**
 * Servlet implementation class LibrarianServlet
 */
@WebServlet({"/listBookCopiesForBranch",
			"/editBookCopies"})
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String function = request.getRequestURI().substring(request.getContextPath().length(), request.getRequestURI().length());
		
		String message = null;
		
		switch (function) {
		case "/listBookCopiesForBranch": {
			try {
				int branchId = Integer.parseInt(request.getParameter("branchId"));
				List<BookCopies> copies = new LibrarianService().getBookCopiesByBranch(branchId);
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), copies);
			} catch (Exception e) {
				e.printStackTrace();
				message = "BookCopies get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/editBookCopies": {
			try {
				int noOfCopies = Integer.parseInt(request.getParameter("noOfCopies"));
				int bookId = Integer.parseInt(request.getParameter("bookId"));
				int branchId = Integer.parseInt(request.getParameter("branchId"));
				BookCopies copy = new BookCopies();
				Book bk = new Book();
				bk.setBookId(bookId);
				Branch br = new Branch();
				br.setBranchId(branchId);
				copy.setBook(bk);
				copy.setBranch(br);
				copy.setNoOfCopies(noOfCopies);
				new LibrarianService().updateBookCopies(copy);
			} catch (Exception e) {
				e.printStackTrace();
				message = "BookCopies get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		default:
			break;
		}
	}

	
}
