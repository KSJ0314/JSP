package dao;

import java.util.ArrayList;

import common.SQLConnect;
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
				dto.setUId(rs.getString("uId"));
				dto.setProductImage(rs.getString("p_productImage"));
				
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
	
	public int addProduct(productDTO product) {
		int result = 0;
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?)";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getPname());
			psmt.setInt(3, product.getUnitPrice());
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setLong(7, product.getUnitsInStock());
			psmt.setString(8, product.getCondition());
			psmt.setString(9, product.getuId());
			psmt.setString(10, product.getProductImage());
			result = psmt.executeUpdate();
			
			System.out.println("addProduct() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addProduct() 오류");
		}
		
		return result;
	}
	
	public void deleteProduct(String productId) {
		String sql = "delete from product where p_id = ?";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, productId);
			psmt.executeUpdate();
			System.out.println("deleteProduct() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteProduct() 오류");
		}
	}
	
	public void updateProduct(String id, productDTO dto) {
		String sql = "update product set p_id=?, p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=? where p_id = ?";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, dto.getProductId());
			psmt.setString(2, dto.getPname());
			psmt.setInt(3, dto.getUnitPrice());
			psmt.setString(4, dto.getDescription());
			psmt.setString(5, dto.getManufacturer());
			psmt.setString(6, dto.getCategory());
			psmt.setLong(7, dto.getUnitsInStock());
			psmt.setString(8, dto.getCondition());
			psmt.setString(9, id);
			psmt.executeUpdate();
			
			System.out.println("updateProduct() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateProduct() 오류");
		}
		
	}
	
}
