package com.gcit.jdbc.dao;

import java.util.ArrayList;
import java.util.List;

import com.gcit.jdbc.entity.Author;
import com.gcit.jdbc.entity.Book;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthorDAO extends BaseDAO {
	
	public void insert(Author auth) throws SQLException {
		save("insert into tbl_author (authorName) values (?)",
				new Object[] { auth.getAuthorName() });
	}
	
	public void update(Author auth) throws SQLException {
		save("update tbl_author set authorName = ? where authorId = ?",
				new Object[] { auth.getAuthorName(), auth.getAuthorId() });
	}

	public void delete(Author auth) throws SQLException {
		save("delete from tbl_book_authors where authorId = ?",
				new Object[] { auth.getAuthorId() });
		
		save("delete from tbl_author where authorId = ?",
				new Object[] { auth.getAuthorId() });
		
	}

	@SuppressWarnings("unchecked")
	public Author readOne(int authorId) throws SQLException {
		List<Author> authors = (List<Author>) read(
				"select * from tbl_author where authorId = ?",
				new Object[] { authorId });
		if (authors != null && authors.size() > 0) {
			return authors.get(0);
		} else {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public Author readOneByName(String name) throws SQLException {
		List<Author> authors = (List<Author>) read(
				"select * from tbl_author where authorName = ?",
				new Object[] { name });
		if (authors != null && authors.size() > 0) {
			return authors.get(0);
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Author> readAll() throws SQLException {
		List<Author> read = (List<Author>) read("select * from tbl_author", null);
		return read;
	}

	@SuppressWarnings("unchecked")
	public List<Author> readAllByBook(Book bk) throws SQLException {
		return (List<Author>) read(
				"select * from tbl_author where authorId in (select authorId from tbl_book_authors where bookId = ?)",
				new Object[] { bk.getBookId() });
	}
	
	@Override
	protected List<Author> convertResult(ResultSet rs) throws SQLException {
		List<Author> authors = new ArrayList<Author>();
		while (rs.next()) {
			Author auth = new Author();
			auth.setAuthorId(rs.getInt("authorId"));
			auth.setAuthorName(rs.getString("authorName"));
			authors.add(auth);
		}

		return authors;
	}

	@Override
	protected int convertResultCount(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
