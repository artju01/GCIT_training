package com.gcit.jdbc.service;

import java.sql.SQLException;
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

	
	public AdministratorService() {
		bookDAO = new BookDAO();
		authorDAO = new AuthorDAO();
		genreDAO = new GenreDAO();
		pubDAO = new PublisherDAO();
		branchDAO = new BranchDAO();
		borrowDAO = new BorrowerDAO();
		bookCopiesDAO = new Book_CopiesDAO();
		bookLoansDAO = new Book_LoansDAO();
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
	
	public List<Author> getAllAuthors() throws SQLException {
		return authorDAO.readAll();
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
	
	public void updateAuthorByName(String exName, String newName) throws SQLException {
		Author author = authorDAO.readOneByName(exName);
		if (author != null) {
			author.setAuthorName(newName);
			authorDAO.update(author);
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
	
	public List<Branch> getAllBranches() throws SQLException {
		return branchDAO.readAll();
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
	
	public List<Borrower> getAllBorrower() throws SQLException {
		return borrowDAO.readAll();
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

}
