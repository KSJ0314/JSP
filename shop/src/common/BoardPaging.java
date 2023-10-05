package common;

public class BoardPaging {

	public static String centerStr(int num, int block_count, int total_page) {
		String str = "";
		int page_count = (num-1)/block_count*block_count + 1;
		
		for (int i = page_count; i < page_count+block_count; i++) {
			if (num != i && i < total_page) {
				str += "<a href='boardMain.jsp?num="+i+"'>"+i+"</a>";
			} else if (i <= total_page) {
				str += num;
			}
			str += "&emsp;";
		}
		
		return str;
	}
	
	public static String leftStr(int num) {
		String str = "";
		
		if(num>1) {
			str += "<a href='boardMain.jsp?num=1'>&lt;&lt; 첫 페이지</a>";
			str += "&emsp;";
			str += "<a href='boardMain.jsp?num="+(num-1)+"'>&lt; 이전</a>";
			str += "&emsp;";
		}
		
		return str;
	}
	public static String rightStr(int num, int total_page) {
		String str = "";
		
		if(num<total_page) {
			str += "<a href='boardMain.jsp?num="+(num+1)+"'>다음 &gt;</a>";
			str += "&emsp;";
			str += "<a href='boardMain.jsp?num="+total_page+"'>마지막 페이지 &gt;&gt;</a>";
			str += "&emsp;";
		}
		
		return str;
	}
	
}
