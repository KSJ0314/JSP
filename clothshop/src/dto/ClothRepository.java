package dto;

import java.util.ArrayList;

public class ClothRepository {
	
	private ArrayList<Cloth> listOfCloth = new ArrayList<>();
	private static ClothRepository instance = new ClothRepository();
	
	public ClothRepository getinstance() {
		return instance;
	}
	
	public ClothRepository() {
		
		Cloth cloth1 = new Cloth();
		cloth1.setClothId("A001");
		cloth1.setClothName("릴렉스 핏 실키 셔츠");
		cloth1.setClothCost(29900);
		cloth1.setClothSize(95);
		cloth1.setClothColor("black");
		
		Cloth cloth2 = new Cloth();
		cloth2.setClothId("A002");
		cloth2.setClothName("페이퍼 코튼 오버핏");
		cloth2.setClothCost(66000);
		cloth2.setClothSize(100);
		cloth2.setClothColor("skyblue");
		
		Cloth cloth3 = new Cloth();
		cloth3.setClothId("A003");
		cloth3.setClothName("데님 루즈 반팔 셔츠");
		cloth3.setClothCost(42000);
		cloth3.setClothSize(105);
		cloth3.setClothColor("gray");
		
		listOfCloth.add(cloth1);
		listOfCloth.add(cloth2);
		listOfCloth.add(cloth3);
		
	}

	public ArrayList<Cloth> getListOfCloth() {
		return listOfCloth;
	}
	
	public Cloth getCloth(String id) {
		Cloth cloth = null;
		for(Cloth cl : listOfCloth) {
			if (cl.getClothId().equals(id)) {
				cloth = cl;
			}
		}
		return cloth;
	}
	
	public void addCloth(Cloth cloth) {
		listOfCloth.add(cloth);
	}
	
}
