package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private static BoardDAO instance;
	
	public BoardDAO() {
		try {
			Context context=new InitialContext();
			ds=(DataSource) context.lookup("java:comp/env/jdbc/oracle");//tomcat일 경우 java:comp/env/를 꼭 써야한다
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance(){
		if(instance==null){
			synchronized(BoardDAO.class){
				instance=new BoardDAO();
			}
		}
		return instance;
	}
	
	
	public void boardWrite(BoardDTO dto){
		String sql="insert into board values (seq_board.nextval,?,?,?,?,0,sysdate)";
		
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();//커넥션 풀에게 반환
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public List<BoardDTO> getBoardList(int startNum, int endNum){
		List<BoardDTO> list=new ArrayList<BoardDTO>();
		String sql="select * from(select rownum rn, aa.* from "
				+ "(select seq, name, id, subject, content, hit, "
				+ " to_char(logtime,'yyyy-mm-dd hh:mi') as logtime "
				+ "from board order by seq desc)aa)where rn>=? and rn<=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BoardDTO dto=new BoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setId("id");
				dto.setName(rs.getString("name"));
				dto.setHit(rs.getInt("hit"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setLogtime(rs.getString("logtime"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			list=null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public BoardDTO getBoard(int seq){
		BoardDTO dto=null;
		String sql="select * from board where seq=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new BoardDTO();
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setId(rs.getString("id"));
				dto.setLogtime(rs.getString("logtime"));
				dto.setName(rs.getString("name"));
				dto.setSeq(rs.getInt("seq"));
				dto.setSubject(rs.getString("subject"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public void hitUpdate(int seq){
		String sql="update board set hit=hit+1 where seq=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void boardModify(int seq,String subject, String content){
		String sql="update board set subject=?, content=? where seq=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void boardDelete(int seq){
		String sql="delete from board where seq=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public int pageNum(){
		int su=0;
		String sql="select count(*) as cnt from board";
		
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);		
			rs=pstmt.executeQuery();
			rs.next();
			su=rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return su;
	}
}
