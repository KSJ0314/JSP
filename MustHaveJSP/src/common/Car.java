package common;

public class Car {
	
	private String carName;		// 모델명
	private int carPrice;		// 가격
	private String carColor;	// 색상
	
	public Car() {
		
	}

	public Car(String carName, int carPrice, String carColor) {
		this.carName = carName;
		this.carPrice = carPrice;
		this.carColor = carColor;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public int getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}

	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	
	
	
}
