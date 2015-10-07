package com.gcit.jdbc.dao;

import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gcit.jdbc.entity.Book;
import com.gcit.jdbc.entity.Borrower;
import com.gcit.jdbc.entity.Branch;



public class BranchDAO extends  BaseDAO{

	public void insert(Branch branch) throws SQLException {
		save("insert into tbl_library_branch (branchName, branchAddress) values (?,?)",
				new Object[] { branch.getName(), branch.getAddress() });
	}
	
	public void update(Branch branch) throws SQLException {
		save("update tbl_library_branch set branchName = ? , branchAddress = ? where branchId = ?",
				new Object[] { branch.getName(), branch.getAddress(), branch.getBranchId() });
	}

	public void delete(Branch branch) throws SQLException {
		save("delete from tbl_book_copies where branchId = ?",
				new Object[] { branch.getBranchId() });
		
		save("delete from tbl_book_loans where branchId = ?",
				new Object[] { branch.getBranchId() });
		
		save("delete from tbl_library_branch where branchId = ?",
				new Object[] { branch.getBranchId() });
	}
	
	@SuppressWarnings("unchecked")
	public Branch readOne(int branchId) throws SQLException {
		List<Branch> branches = (List<Branch>) read(
				"select * from tbl_library_branch where branchId = ?",
				new Object[] { branchId });
		if (branches != null && branches.size() > 0) {
			return branches.get(0);
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Branch> readAll() throws SQLException {
		List<Branch> read = (List<Branch>) read("select * from tbl_library_branch", null);
		System.out.println(read);
		return read;
	}

	@SuppressWarnings("unchecked")
	public List<Branch> readAllByBook(Book bk) throws SQLException {
		return (List<Branch>) read(
				"select * from tbl_library_branch where branchId in (select branchId from tbl_book_copies where bookId = ?)",
				new Object[] { bk.getBookId() });
	}

	@SuppressWarnings("unchecked")
	public List<Borrower> readAllByBorrower(Borrower brw) throws SQLException {
		return (List<Borrower>) read(
				"select * from tbl_library_branch where branchId in (select branchId from tbl_book_loans where cardNo = ?)",
				new Object[] { brw.getCardNo() });
	}
	
	@Override
	protected List<Branch> convertResult(ResultSet rs) throws SQLException {
		List<Branch> branches = new ArrayList<Branch>();
		while (rs.next()) {
			Branch branch = new Branch();
			branch.setBranchId(rs.getInt("branchId"));
			branch.setName(rs.getString("branchName"));
			branch.setAddress(rs.getString("branchAddress"));
			branches.add(branch);
		}
		
		return branches;
	}	

}
