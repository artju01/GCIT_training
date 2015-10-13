package com.gcit.lms.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gcit.jdbc.entity.Author;
import com.gcit.jdbc.entity.Book;
import com.gcit.jdbc.entity.BookLoans;
import com.gcit.jdbc.entity.Borrower;
import com.gcit.jdbc.entity.Branch;
import com.gcit.jdbc.entity.Genre;
import com.gcit.jdbc.entity.Publisher;
import com.gcit.jdbc.service.AdministratorService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({"/countAuthors","/searchAuthorsWithIndex","/searchAuthors","/listAuthors","/listAuthorsWithPage","/addAuthor","/deleteAuthor","/editAuthor",
	"/addBorrower","/deleteBorrower","/editBorrower","/listBorrowers","/countBorrowers","/searchBorrowersWithIndex",
	"/addBranch","/deleteBranch","/editBranch","/listBranches","/listBranchesWithPage","/countBranches","/searchBranchesWithIndex",
	"/addBook", "/deleteBook","/editBook","/listBooks","/countBooks","/searchBooksWithIndex",
	"/addPublisher","/deletePublisher","/editPublisher","/listPublishers","/countPublishers","/searchPublishers","/searchPublishersWithIndex",
	"/editBookLoans","/listBookLoans","/countBookLoans",
	"/searchGenres",})
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
		case "/listAuthors": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<Author> authors = new AdministratorService().getAllAuthors(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), authors);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Authors get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/listAuthorsWithPage": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<Author> authors = new AdministratorService().getAllAuthors(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), authors);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Authors get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/countAuthors": {
			try {
				int count = new AdministratorService().getAuthorCount();
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), count);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Authors get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/searchAuthors": {
			try {
				List<Author> authors = new AdministratorService().searchAuthors(request.getParameter("searchText"));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), authors);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Authors get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/searchAuthorsWithIndex": {
			try {
				List<Author> authors = new AdministratorService().searchAuthorsWithPage(request.getParameter("searchText"),
						Integer.parseInt(request.getParameter("page")));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), authors);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Authors get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/addAuthor": {
			Author author = new Author();
			
			Map<String, String[]> map = request.getParameterMap();
	        for(Entry<String,String[]> entry:map.entrySet()){
	            author.setAuthorName(entry.getValue()[0]);
	        }
			
			try {
				new AdministratorService().addAuthor(author);
				error = null;
				message = "Author added succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Author add failed. Reason: " + e.getMessage();
			}
			break;
		}
		
		case "/deleteAuthor": {
			Author author = new Author();
			
			Map<String, String[]> map = request.getParameterMap();
	        for(Entry<String,String[]> entry:map.entrySet()){
	            author.setAuthorId(Integer.parseInt(entry.getValue()[0]));
	        }

			try {
				new AdministratorService().deleteAuthor(author);
				error = null;
				message = "Author deleted succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Author delete failed. Reason: " + e.getMessage();
			}
			
			//view = "/adminAuthor.jsp";
			break;
			
		}
		case "/editAuthor" : {
			try {
			Author author = new Author();
			
			Map<String, String[]> map = request.getParameterMap();
	        for(Entry<String,String[]> entry:map.entrySet()){
	        	if (entry.getKey().equals("authorId")) {	
	        		author.setAuthorId(Integer.parseInt(entry.getValue()[0]));
	        	}
	        	else if (entry.getKey().equals("authorName")) {
	        		author.setAuthorName(entry.getValue()[0]);
	        	}
	        }

				new AdministratorService().updateAuthor(author);
				error = null;
				message = "Author edit succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Author edit failed. Reason: " + e.getMessage();
			}
			
			//view = "/adminAuthor.jsp";
			break;
			
		}
		case "/addBorrower": {
			String borrowerName = request.getParameter("name");
			String borrowerAddress = request.getParameter("address");
			String borrowerPhone = request.getParameter("phone");
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
			//view = "/listBorrowers.jsp";
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
			
			//view = "/listBorrowers.jsp";
			break;
		}
		case "/editBorrower": {
			String cardNo = request.getParameter("cardNo");
			Borrower borrow = new Borrower();
			borrow.setCardNo(Integer.parseInt(cardNo));
			borrow.setName(request.getParameter("name"));
			borrow.setAddress(request.getParameter("address"));
			borrow.setPhone(request.getParameter("phone"));
			
			try {
				new AdministratorService().updateBorrower(borrow);
				error = null;
				message = "Borrower edit succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Borrower edit failed. Reason: " + e.getMessage();
			}
			//view = "/listBranches.jsp";
			break;	
		}
		
		case "/listBorrowers": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<Borrower> borrowers = new AdministratorService().getAllBorrower(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), borrowers);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Borrowers get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/countBorrowers": {
			try {
				int count = new AdministratorService().getBorrowerCount();
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), count);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Boerrowers count get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/searchBorrowersWithIndex": {
			try {
				List<Borrower> borrowers = new AdministratorService().searchBorrowersWithPage(request.getParameter("searchText"),
						Integer.parseInt(request.getParameter("page")));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), borrowers);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Borrower search failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/listBranches": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<Branch> branches = new AdministratorService().getAllBranches(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), branches);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Authors get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/listBranchesWithPage": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<Branch> branches = new AdministratorService().getAllBranches(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), branches);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Branches get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
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
			//view = "/listBranches.jsp";
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
			//view = "/listBranches.jsp";
			break;
		}
		case "/editBranch": {
			String branchId = request.getParameter("branchId");
			Branch branch = new Branch();
			branch.setBranchId(Integer.parseInt(branchId));
			branch.setName(request.getParameter("branchName"));
			branch.setAddress(request.getParameter("branchAddress"));
			
			try {
				new AdministratorService().updateBranch(branch);
				error = null;
				message = "Branch edit succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Branch edit failed. Reason: " + e.getMessage();
			}
			//view = "/listBranches.jsp";
			break;		
		}
		
		case "/countBranches": {
			try {
				int count = new AdministratorService().getBranchCount();
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), count);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Branch search failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/searchBranchesWithIndex": {
			try {
				List<Branch> branches = new AdministratorService().searchBranchesWithPage(request.getParameter("searchText"),
						Integer.parseInt(request.getParameter("page")));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), branches);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Branch search failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/addBook": {
			String bookName = request.getParameter("bookName");
			String pubId = request.getParameter("publisher");
			String[] authorId = request.getParameterValues("authors[]");
			String[] genreId = request.getParameterValues("genres[]");
			
			Publisher pub = null;
			if (pubId != null) {
				pub = new Publisher();
				pub.setPublisherId(Integer.parseInt(pubId));
			}
			
			List<Author> authors = new ArrayList<Author>();
			for (int i=0; i<authorId.length; i++) {
				Author auth = new Author();
				auth.setAuthorId(Integer.parseInt(authorId[i]));
				authors.add(auth);
			}
			
			List<Genre> gens = new ArrayList<Genre>();
			for (int i=0; i<genreId.length; i++) {
				Genre gen = new Genre();
				gen.setGenreId(Integer.parseInt(genreId[i]));
				gens.add(gen);
			}
			
			Book bk = new Book(); 
			bk.setTitle(bookName);
			bk.setPublisher(pub);
			bk.setAuthors(authors);
			bk.setGenres(gens);
						
			try {
				new AdministratorService().addBook(bk);
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "book add failed. Reason: " + e.getMessage();
			}
			
			//view = "/listBooks.jsp";
			break;
		}
		
		case "/editBook": {
			String bookId = request.getParameter("bookId");
			String bookName = request.getParameter("bookName");
			String pubId = request.getParameter("publisher");
			String[] authorId = request.getParameterValues("authors[]");
			String[] genreId = request.getParameterValues("genres[]");
			
			Publisher pub = null;
			if (pubId != null) {
				pub = new Publisher();
				pub.setPublisherId(Integer.parseInt(pubId));
			}
			
			List<Author> authors = new ArrayList<Author>();
			for (int i=0; i<authorId.length; i++) {
				Author auth = new Author();
				auth.setAuthorId(Integer.parseInt(authorId[i]));
				authors.add(auth);
			}
			
			List<Genre> gens = new ArrayList<Genre>();
			for (int i=0; i<genreId.length; i++) {
				Genre gen = new Genre();
				gen.setGenreId(Integer.parseInt(genreId[i]));
				gens.add(gen);
			}
			
			Book bk = new Book(); 
			bk.setBookId(Integer.parseInt(bookId));
			bk.setTitle(bookName);
			bk.setPublisher(pub);
			bk.setAuthors(authors);
			bk.setGenres(gens);
						
			try {
				new AdministratorService().updateBook(bk);
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "book update failed. Reason: " + e.getMessage();
			}
			
			//view = "/listBooks.jsp";
			break;
		}
		
		case "/deleteBook": {
			String bookId = request.getParameter("bookId");
			Book book = new Book();
			book.setBookId(Integer.parseInt(bookId));
			
			try {
				new AdministratorService().deleteBook(book);
				error = null;
				message = "Book delete succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Book delete failed. Reason: " + e.getMessage();
			}
			//view = "/listBooks.jsp";
			break;
		}
		
		case "/listBooks": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<Book> books = new AdministratorService().getAllBooks(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), books);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Books get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/countBooks": {
			try {
				int count = new AdministratorService().getBookCount();
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), count);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Book count failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/searchBooksWithIndex": {
			try {
				List<Book> books = new AdministratorService().searchBooksWithPage(request.getParameter("searchText"),
						Integer.parseInt(request.getParameter("page")));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), books);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Branch search failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/addPublisher": {
			String pubName = request.getParameter("name");
			String pubAddress = request.getParameter("address");
			String pubPhone = request.getParameter("phone");
			Publisher pub = new Publisher();
			pub.setPublisherName(pubName);
			pub.setAddress(pubAddress);
			pub.setPhone(pubPhone);
			
			try {
				new AdministratorService().addPublisher(pub);
				error = null;
				message = "Publisher adde succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Publisher added failed. Reason: " + e.getMessage();
			}
			//view = "/listBranches.jsp";
			break;
		}
		
		case "/deletePublisher": {
			Publisher pub = new Publisher();
			String pubId = request.getParameter("id");
			pub.setPublisherId(Integer.parseInt(pubId));

			try {
				new AdministratorService().deletePublisher(pub);
				error = null;
				message = "Publisher deleted succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Publisher delete failed. Reason: " + e.getMessage();
			}
			
			//view = "/adminAuthor.jsp";
			break;
			
		}
		case "/editPublisher" : {
			String pubId = request.getParameter("id");
			Publisher pub = new Publisher();
			pub.setPublisherId(Integer.parseInt(pubId));
			pub.setPublisherName(request.getParameter("name"));
			pub.setAddress(request.getParameter("address"));
			pub.setPhone(request.getParameter("phone"));
			
			try {
				new AdministratorService().updatePublisher(pub);
				error = null;
				message = "Publisher edit succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Publisher edit failed. Reason: " + e.getMessage();
			}
			//view = "/listBranches.jsp";
			break;	
			
		}
		
		case "/listPublishers": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<Publisher> pubs = new AdministratorService().getAllPublisher(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), pubs);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Publishers get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/countPublishers": {
			try {
				int count = new AdministratorService().getPublisherCount();
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), count);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Publishers count get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		case "/searchPublishers": {
			try {
				List<Publisher> pubs = new AdministratorService().searchPublishers(request.getParameter("searchText"));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), pubs);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Publishers get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/searchPublishersWithIndex": {
			try {
				List<Publisher> publishers = new AdministratorService().searchPublishersWithPage(request.getParameter("searchText"),
						Integer.parseInt(request.getParameter("page")));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), publishers);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Publishers search failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}

//		dueDate:dueDate
		case "/editBookLoans": {
			String bookId = request.getParameter("bookId");
			String branchId = request.getParameter("branchId");
			String cardNo = request.getParameter("cardNo");
			String dueDateStr = request.getParameter("dueDate");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dueDate = null;
			try {
				dueDate = sdf.parse(dueDateStr);
			} catch (ParseException e1) {				
				e1.printStackTrace();
			}
		
			
			BookLoans bl = new BookLoans();
			Book bk = new Book();
			bk.setBookId(Integer.parseInt(bookId));
			bl.setBook(bk); 
			Branch br = new Branch();
			br.setBranchId(Integer.parseInt(branchId));
			bl.setBranch(br); 
			Borrower bor = new Borrower();
			bor.setCardNo(Integer.parseInt(cardNo));
			bl.setBorrower(bor);
			bl.setDueDate(dueDate);
			
			try {
				new AdministratorService().updateBookLoansDueDate(bl);
				error = null;
				message = "Overirde dueDate succesfully";
			} catch (Exception e) {
				e.printStackTrace();
				message = null;
				error = "Overirde dueDate failed. Reason: " + e.getMessage();
			}
			break;	
		}
		
		case "/listBookLoans": {
			try {
				String pageNo = request.getParameter("pageNo");
				if(pageNo == null) 
					pageNo = "1";
				List<BookLoans> bookLoans = new AdministratorService().getAllUnreturnBookLoans(Integer.parseInt(pageNo));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), bookLoans);
			} catch (Exception e) {
				e.printStackTrace();
				message = "BookLoans get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/countBookLoans": {
			try {
				int count = new AdministratorService().getUnreturnBookLoansCount();
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), count);
			} catch (Exception e) {
				e.printStackTrace();
				message = "BookLoans count get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
		
		case "/searchGenres": {
			try {
				List<Genre> gens = new AdministratorService().searchGenres(request.getParameter("searchText"));
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getOutputStream(), gens);
			} catch (Exception e) {
				e.printStackTrace();
				message = "Genres get failed. Reason: " + e.getMessage();
				response.getWriter().write(message);
			}
			break;
		}
			
		default:
			break;
		}
//"/editBook","/listBooks","/countBooks","/searchBooksWithIndex"
		//forward
		/*
		if (view != null) {
			request.setAttribute("message", message);
			request.setAttribute("error", error);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(view);
			rd.forward(request, response);
		}*/
		
		//redirect
		

	}

}
