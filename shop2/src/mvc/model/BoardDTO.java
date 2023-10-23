package mvc.model;

public class BoardDTO {
	private int num;			// 게시글 순번 (자동증가) *
	private String id;			// 사용자 아이디 *
	private String name;		// 사용자 이름 *
	private String title;		// 게시글 제목 *
	private String content;		// 게시글 내용 *
	private String regist_day;	// 게시글 작성일자
	private int hit;			// 조회수
	private String ip;			// 사용자 아이피 주소
	
	public BoardDTO() {
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
