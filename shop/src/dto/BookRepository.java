package dto;

import java.util.ArrayList;

public class BookRepository {

	private ArrayList<Book> listOfBook = new ArrayList<>();

	public BookRepository() {
		
		Book book1 = new Book();
		book1.setBookId("A001");
		book1.setBookName("혼공자");
		book1.setBookPrice(10000);
		book1.setAuthor("신용권");
		book1.setDescription("자바책");
		
		Book book2 = new Book();
		book2.setBookId("A002");
		book2.setBookName("성낙현의 JSP 자바 웹 프로그래밍");
		book2.setBookPrice(20000);
		book2.setAuthor("성낙현");
		book2.setDescription("JSP책");
		
		Book book3 = new Book();
		book3.setBookId("A003");
		book3.setBookName("데이터베이스의 정석");
		book3.setBookPrice(7000);
		book3.setAuthor("박성진");
		book3.setDescription("SQL책");
		
		listOfBook.add(book1);
		listOfBook.add(book2);
		listOfBook.add(book3);
		
	}

	public ArrayList<Book> getListOfBook() {
		return listOfBook;
	}

	
}
