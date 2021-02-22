package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.FollowDetails;

public class FollowDetailsDAO {
    
    public void follow(FollowDetails followDetails){
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("INSERT INTO followDetailsAcc VALUES (?,?) ");
            ps.setInt(1, followDetails.getUserId());
            ps.setInt(2, followDetails.getpId());
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(FollowDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void unFollow(int uId, int pId){
        
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("DELETE FROM followDetailsAcc WHERE userID='" +uId+ "' AND pID='"+pId+"' ");
            ps.executeUpdate();
        
        } catch (Exception ex) {
            Logger.getLogger(FollowDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
