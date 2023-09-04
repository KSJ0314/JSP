package dto;

public class ProductMain {

	public static void main(String[] args) {
		
		Product pr = new Product("A001", "아이폰15Pro", 2200000);
		pr.setDescription("최신형 아이폰");
		pr.setManufacturer("애플");
		
		System.out.println("상품설명 : " + pr.getDescription());
		System.out.println("제조회사 : " + pr.getManufacturer());
		
		

	}

}
