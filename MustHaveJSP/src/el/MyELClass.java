package el;

public class MyELClass {
	
	public String getGender(String jumin) {
		String returnStr = "";
		
		int beginIdx = jumin.indexOf("-")+1;
		
		char genderChar = jumin.charAt(beginIdx);
		
		if (genderChar == '1' || genderChar == '3') {
			returnStr = "남자";
		} else if (genderChar == '2' || genderChar == '4') {
			returnStr = "여자";
		} else {
			returnStr = "오류";
		}
		
		return returnStr;
	}
	
	public String getId(String email) {
		String returnStr = "";
		
		int endIdx = email.indexOf("@");
		returnStr = email.substring(0, endIdx);
		
		return returnStr;
	}
	
	public String getDomain(String email) {
		String returnStr = "";
		
		int beginIdx = email.indexOf("@") + 1;
		returnStr = email.substring(beginIdx);
		
		return returnStr;
	}
}
