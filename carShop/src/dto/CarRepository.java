package dto;

import java.util.ArrayList;

public class CarRepository {

	ArrayList<Car> listOfCar = new ArrayList<>();
	
	public CarRepository() {
		Car car1 = new Car();
		car1.setCarName("Maserati");
		car1.setCarCost(337000000);
		car1.setCarFuel("가솔린");
		car1.setCarYear("2023");
		car1.setCarPower("630hp");
		
		Car car2 = new Car();
		car2.setCarName("Tesla");
		car2.setCarCost(141350000);
		car2.setCarFuel("전기");
		car2.setCarYear("2023");
		car2.setCarPower("760kW");
		
		Car car3 = new Car();
		car3.setCarName("Genesis");
		car3.setCarCost(73980000);
		car3.setCarFuel("가솔린, 디젤");
		car3.setCarYear("2022");
		car3.setCarPower("380hp");
		
		listOfCar.add(car1);
		listOfCar.add(car2);
		listOfCar.add(car3);
		
	}

	public ArrayList<Car> getListOfCar() {
		return listOfCar;
	}
	
	public Car getCar(String name) {
		Car car = null;
		for (Car car2 : listOfCar) {
			if (car2.getCarName().equals(name)) {
				car = car2;
				break;
			}
		}
		return car;
	}
	
}
