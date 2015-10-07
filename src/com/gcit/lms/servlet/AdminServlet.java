package com.gcit.lms.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcit.jdbc.entity.Author;
import com.gcit.jdbc.entity.Borrower;
import com.gcit.jdbc.entity.Branch;
import com.gcit.jdbc.service.AdministratorService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({"/addAuthor","/deleteAuthor","/editAuthor",
	"/addBorrower","/deleteBorrower","/editBorrower",
	"/addBranch","/deleteBranch","/editBranch",
	"/addBook", "/deleteBook", "editBook"})
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String function = request.getRequestURI().substring(request.getContextPath().length(), request.getRequestURI().length());
		
		String message = null;
		String error = null;
		String view = null;
		
		
		
		switch (function) {
		case "/addAuthor": {
			String authorName = request.getParameter("authorName");
			Author author = new Author();
			author.setAuthorName(authorName);

			try {
				new AdministratorService().addAuthor(author);
				error = null;
				message = "Author added succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Author add failed. Reason: " + e.getMessage();
			}
			view = "/listAuthors.jsp";
			break;
		}
		case "/deleteAuthor": {
			String authorId = request.getParameter("authorId");
			Author author = new Author();
			author.setAuthorId(Integer.parseInt(authorId));

			try {
				new AdministratorService().deleteAuthor(author);
				error = null;
				message = "Author deleted succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Author delete failed. Reason: " + e.getMessage();
			}
			
			view = "/listAuthors.jsp";
			break;
			
		}
		case "/editAuthor" : {
			String authorId = request.getParameter("authorId");
			String authorName = request.getParameter("newName");
			Author author = new Author();
			author.setAuthorId(Integer.parseInt(authorId));
			author.setAuthorName(authorName);
			
			try {
				new AdministratorService().updateAuthor(author);
				error = null;
				message = "Author edit succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Author edit failed. Reason: " + e.getMessage();
			}
			
			view = "/listAuthors.jsp";
			break;
			
		}
		case "/addBorrower": {
			String borrowerName = request.getParameter("borrowerName");
			String borrowerAddress = request.getParameter("borrowerAddress");
			String borrowerPhone = request.getParameter("borrowerPhone");
			Borrower borrow = new Borrower();
			borrow.setName(borrowerName);
			borrow.setAddress(borrowerAddress);
			borrow.setPhone(borrowerPhone);

			try {
				new AdministratorService().addBorrower(borrow);
				error = null;
				message = "Borrower add succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Borrower add failed. Reason: " + e.getMessage();
			}
			view = "/listBorrowers.jsp";
			break;
		}
		case "/deleteBorrower": {
			String cardNo = request.getParameter("cardNo");
			Borrower borrow = new Borrower();
			borrow.setCardNo(Integer.parseInt(cardNo));

			try {
				new AdministratorService().deleteBorrower(borrow);
				error = null;
				message = "Borrower delete succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Borrower delete failed. Reason: " + e.getMessage();
			}
			
			view = "/listBorrowers.jsp";
			break;
		}
		case "/editBorrower": {
			//TODO need to implement
			view = "/listBorrowers.jsp";
			break;
		}
		case "/addBranch": {
			String branchName = request.getParameter("branchName");
			String branchAddress = request.getParameter("branchAddress");
			Branch branch = new Branch();
			branch.setName(branchName);
			branch.setAddress(branchAddress);
			
			try {
				new AdministratorService().addBranch(branch);
				error = null;
				message = "Branch adde succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Branch adde failed. Reason: " + e.getMessage();
			}
			view = "/listBranches.jsp";
			break;
		}
		case "/deleteBranch": {
			String branchId = request.getParameter("branchId");
			Branch branch = new Branch();
			branch.setBranchId(Integer.parseInt(branchId));
			
			try {
				new AdministratorService().deleteBranch(branch);
				error = null;
				message = "Branch delete succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Branch delete failed. Reason: " + e.getMessage();
			}
			view = "/listBranches.jsp";
			break;
		}
		case "/editBranch": {
			//TODO need to implement
			view = "/listBranches.jsp";
			break;
		}
		default:
			break;
		}

		//forward
		request.setAttribute("message", message);
		request.setAttribute("error", error);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(view);
		rd.forward(request, response);
		
		//redirect
		

	}

}
