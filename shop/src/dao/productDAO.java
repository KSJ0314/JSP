package dao;

import java.util.ArrayList;

import JDBC.SQLConnect;
import dto.productDTO;

public class productDAO extends SQLConnect {
	
	private ArrayList<productDTO> listOfProduct = new ArrayList<>();
	
	public productDAO() {
		super();
		
		String sql = "select * from product";
		try {
			stmt = co.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				productDTO dto = new productDTO();
				dto.setProductId(rs.getString("p_id"));
				dto.setPname(rs.getString("p_name"));
				dto.setUnitPrice(rs.getInt("p_unitPrice"));
				dto.setDescription(rs.getString("p_description"));
				dto.setManufacturer(rs.getString("p_manufacturer"));
				dto.setCategory(rs.getString("p_category"));
				dto.setUnitsInStock(rs.getLong("p_unitsInStock"));
				dto.setCondition(rs.getString("p_condition"));
				
				listOfProduct.add(dto);
			}
			System.out.println("ProductRepository() 생성 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ProductRepository() 생성 오류");
		}
	}
	
	public ArrayList<productDTO> getAllProducts(){
		return listOfProduct;
	}
	
	public productDTO getProductById(String productId) {
		productDTO productById = null;
		for (productDTO product : listOfProduct){
			if (productId != null && product.getProductId().equals(productId)){
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(productDTO product) {
		listOfProduct.add(product);
		
		String sql = "insert into product values(?,?,?,?,?,?,?,?)";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getPname());
			psmt.setString(3, String.valueOf(product.getUnitPrice()));
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setString(7, String.valueOf(product.getUnitsInStock()));
			psmt.setString(8, product.getCondition());
			psmt.executeUpdate();
			
			System.out.println("addProduct() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addProduct() 오류");
		}
	}
	
}
