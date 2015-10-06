package com.gcit.jdbc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import com.gcit.jdbc.dao.AuthorDAO;
import com.gcit.jdbc.dao.BookDAO;
import com.gcit.jdbc.dao.Book_CopiesDAO;
import com.gcit.jdbc.dao.Book_LoansDAO;
import com.gcit.jdbc.dao.BorrowerDAO;
import com.gcit.jdbc.dao.BranchDAO;
import com.gcit.jdbc.dao.GenreDAO;
import com.gcit.jdbc.dao.PublisherDAO;
import com.gcit.jdbc.entity.Author;
import com.gcit.jdbc.entity.Book;
import com.gcit.jdbc.entity.BookLoans;
import com.gcit.jdbc.entity.Borrower;
import com.gcit.jdbc.entity.Branch;
import com.gcit.jdbc.entity.Genre;
import com.gcit.jdbc.entity.Publisher;

public class AdministratorService {
	private BookDAO bookDAO;
	private AuthorDAO authorDAO;
	private GenreDAO genreDAO;
	private PublisherDAO pubDAO;
	private BranchDAO branchDAO;
	private BorrowerDAO borrowDAO;
	private Book_CopiesDAO bookCopiesDAO;
	private Book_LoansDAO bookLoansDAO;
	
	private BufferedReader in;
	
	public AdministratorService() {
		bookDAO = new BookDAO();
		authorDAO = new AuthorDAO();
		genreDAO = new GenreDAO();
		pubDAO = new PublisherDAO();
		branchDAO = new BranchDAO();
		borrowDAO = new BorrowerDAO();
		bookCopiesDAO = new Book_CopiesDAO();
		bookLoansDAO = new Book_LoansDAO();
		
		in = new BufferedReader(new InputStreamReader(System.in));
	}
	public List<Publisher> getAllPublisher() throws SQLException {
		List<Publisher> pubs = pubDAO.readAll();
		
		for (Publisher pub : pubs) {
			pub.setBooks(bookDAO.readAllByPublisher(pub));
		}
		
		return pubs;
	}
	
	public List<Book> getAllBooks() throws SQLException {
		List<Book> books = bookDAO.readAll();
	
		for(Book b : books) {
			assignBookData(b);
		}
		
		return books;
	}
 	
	public Book getBook (int bookId) throws SQLException {
		Book bk = bookDAO.readOne(bookId);
		assignBookData(bk);
		return bk;
	}
	
	private void assignBookData (Book bk) throws SQLException {
		bk.setAuthors(authorDAO.readAllByBook(bk));
		bk.setGenres(genreDAO.readGenreByBook(bk));
		bk.setPublisher(pubDAO.readOneByBook(bk));
		bk.setCopies(bookCopiesDAO.readAllByBook(bk));
		bk.setLoans(bookLoansDAO.readAllByBook(bk));
	}
	
	
	public List<BookLoans> getAllBookLoans() throws SQLException {
		return bookLoansDAO.readAll();
	}
	
	
	public void addBook(Book bk) throws SQLException {
		List<Book>books = bookDAO.readAll();
		for (Book book : books) {
			if (bk.getTitle() == book.getTitle()) {
				List<Author> authors = authorDAO.readAllByBook(book);
				HashSet<String> authorName = new HashSet<String>();
				for (Author author : authors) {
					authorName.add(author.getAuthorName());
				}
				
				List<Author> addedAuthor = bk.getAuthors();
				HashSet<String> authorName2 = new HashSet<String>();
				for (Author author : addedAuthor) {
					authorName2.add(author.getAuthorName());
				}
				
				if (authorName.containsAll(authorName2)) {
					//duplicate
					System.out.println("This book is already in the record");
					return;
				}
			}
		}
		
		//Add
		try {
			bookDAO.insert(bk);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}

	public void delateBook(Book bk) throws SQLException {
		try {
			bookDAO.delete(bk);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
		
	}
	
	public void updateBook(Book bk) throws SQLException {
		try {
			bookDAO.update(bk);
		}
		catch (SQLException e) {
			System.out.println(e);
		}	
	}
	
	
	public void addAuthor(Author author) throws SQLException {
		try {
			authorDAO.insert(author);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
		
	}
 	
	public void updateAuthor(Author author) throws SQLException {
		try {
			authorDAO.update(author);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void deleteAuthor(Author author) throws SQLException {
		try {
			authorDAO.delete(author);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void addPublisher(Publisher pub) throws SQLException {
		try {
			pubDAO.insert(pub);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void updatePublisher(Publisher pub) throws SQLException
	{
		try {
			pubDAO.update(pub);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void deletePublisher(Publisher pub) throws SQLException {
		try {
			pubDAO.delete(pub);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}

	public void addBranch(Branch branch) throws SQLException {
		try {
			branchDAO.insert(branch);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void updateBranch(Branch branch) throws SQLException {
		try {
			branchDAO.update(branch);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void deleteBranch(Branch branch) throws SQLException {
		try {
			branchDAO.delete(branch);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void addBorrower(Borrower borrow) throws SQLException {
		try {
			borrowDAO.insert(borrow);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void updateBorrower(Borrower borrow) throws SQLException {
		try {
			borrowDAO.update(borrow);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void deleteBorrower(Borrower borrow) throws SQLException {
		try {
			borrowDAO.delete(borrow);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void updateBookLoans(BookLoans loan) throws SQLException {
		try {
			bookLoansDAO.update(loan);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	/*--------------------------------------
	 *    Input  Command
	 *///--------------------------------------
	
	public void commandInput () throws IOException, SQLException {
		while(true) {
			System.out.println("Please choose what to do");
			System.out.println("1) Add/Update/Delete Book");
			System.out.println("2) Add/Update/Delete Author");
			System.out.println("3) Add/Update/Delete Library Branches");
			System.out.println("4) Add/Update/Delete Borrower");
			System.out.println("5) Over-ride due date for a Book Loan");
			System.out.println("6) Exit");
			
			String keyboard = in.readLine();
			int input = Integer.parseInt(keyboard);
			
			if (input == 1) {
				bookCommandLine();
			}
			else if (input == 2) {
				
			}
			else {
				break;
			}
		}
	}
	
	private void bookCommandLine() throws IOException, SQLException {
		System.out.println("Add/Update/Delete Book");
		System.out.println("1) Add");
		System.out.println("2) Update");
		System.out.println("3) Delete");
		System.out.println("4) Previos menu");
		
		String keyboard = in.readLine();
		int input = Integer.parseInt(keyboard);
		
		if (input == 1) {
			String selectedBookName;
			Publisher selectedPublisher = null;
			List<Author> seletedAuthors = new ArrayList<Author>();
			List<Genre> selectedGenre = new ArrayList<Genre>();
			
			System.out.println("Enter book name :");
			keyboard = in.readLine();
			selectedBookName = keyboard;
			
			//select publisher
			int count = 1;
			System.out.println("Select publisher :");
			List<Publisher> pubs = this.getAllPublisher();
			for (Publisher pub : pubs) {
				System.out.println(count+") "+pub.getPublisherName());
				count++;
			}
			keyboard = in.readLine();
			input = Integer.parseInt(keyboard);
			
			if (input < count) {
				selectedPublisher = pubs.get(input-1);
			}
			
			//select authors
			int authorCount = 0;
			System.out.println("How many author? :");
			keyboard = in.readLine();
			authorCount = Integer.parseInt(keyboard);
			count = 0;
			
			List<Author> auths = authorDAO.readAll();
			
			for (int i = 0; i< authorCount; i++) {
				System.out.println("Please select "+(i+1)+ " author");
				count = 0;
				for (Author auth : auths) {
					System.out.println(count+") "+auth.getAuthorName());
					count++;
				}
				
				keyboard = in.readLine();
				input = Integer.parseInt(keyboard);
				seletedAuthors.add(auths.get(input-1));
			}
			
			//select genres
			int genreCount = 0;
			System.out.println("How many genre? :");
			keyboard = in.readLine();
			genreCount = Integer.parseInt(keyboard);
			count = 0;
			
			List<Genre> gens = genreDAO.readAll();
			
			for (int i = 0; i< genreCount; i++) {
				System.out.println("Please select "+(i+1)+ " genre");
				count = 0;
				for (Genre gen : gens) {
					System.out.println(count+") "+gen.getGenreName());
					count++;
				}
				
				keyboard = in.readLine();
				input = Integer.parseInt(keyboard);
				selectedGenre.add(gens.get(input-1));
			}
			
			//book copies
			
			Book bk = new Book();
			bk.setTitle(selectedBookName);
			bk.setAuthors(seletedAuthors);
			bk.setGenres(selectedGenre);
			bk.setPublisher(selectedPublisher);
			
			this.addBook(bk);
			//bookDAO.insert(bk);
			
		}
		else if (input == 2) {
			//update
			System.out.println("Select a book that you want to update.");
			List<Book> books = this.getAllBooks();
			int bookCount = 1;
			for (Book book : books) {
				System.out.println(bookCount+") "+book.getTitle());
				bookCount++;
			}
			System.out.println(bookCount+") Cancel");
			
			keyboard = in.readLine();
			input = Integer.parseInt(keyboard);
			
			if (input >= bookCount) {
				return;
			}
			
			Book updatedBook = books.get(input-1);
			System.out.println("Enter a new title");
			String newTitle = in.readLine();
			updatedBook.setTitle(newTitle);
			
			this.updateBook(updatedBook);
			//bookDAO.update(updatedBook);
			
		}
		else if (input == 3) {
			//delete
			System.out.println("Select a book that you want to remove.");
			List<Book> books = this.getAllBooks();
			int bookCount = 1;
			for (Book book : books) {
				System.out.println(bookCount+") "+book.getTitle());
				bookCount++;
			}
			System.out.println(bookCount+") Cancel");
			
			keyboard = in.readLine();
			input = Integer.parseInt(keyboard);
			
			if (input >= bookCount) {
				return;
			}
			Book deletedBook = books.get(input-1);
			bookDAO.delete(deletedBook);
		}
		else {
			return;
		}
	}
}
