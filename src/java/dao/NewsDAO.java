package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.News;

public class NewsDAO {

    public void addNews(News news) {
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("INSERT INTO pagePost(pageId,pageName,postTitle,postCategory,postBody) VALUES (?,?,?,?,?) ");
            ps.setInt(1, news.getpId());
            ps.setString(2, news.getPageName());
            ps.setString(3, news.getPostTitle());
            ps.setString(4, news.getPostCategory());
            ps.setString(5, news.getPostBody());
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static List<News> getAllNews() {
        List<News> newses = new ArrayList<>();
        try {
            ResultSet rs = DBUtils.getPreparedStatement("SELECT * FROM pagePost ORDER BY posted_on DESC").executeQuery();
            while (rs.next()) {
                News n = new News(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                newses.add(n);
            }

        } catch (Exception ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return newses;
    }

    public void deleteNews(int id){
        
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("DELETE FROM pagePost WHERE postId=? ");
            ps.setInt(1, id);
            ps.executeUpdate();
            
            
        } catch (Exception ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
