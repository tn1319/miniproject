package board.bean;
import lombok.Data;


@Data
public class BoardDTO {
	private int seq;
	private String id;
	private String name;
	private String subject;
	private String content;
	private int hit;
	private String logtime;	
}
