package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Page;

public class PageDAO {

    public void addNewPage(Page page) {
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("INSERT INTO companyProfile(userID,profileName,companyAddress,companyTelephone,companyEmail) VALUES (?,?,?,?,?)");

            ps.setInt(1, page.getUserId());
            ps.setString(2, page.getCompanyName());
            ps.setString(3, page.getCompanyAddress());
            ps.setString(4, page.getCompanyTelephone());
            ps.setString(5, page.getCompanyEmail());
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(PageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<Page> getAllPages() {
        List<Page> pages = new ArrayList<>();
        try {
            ResultSet rs = DBUtils.getPreparedStatement("SELECT * FROM companyProfile ORDER BY pID DESC").executeQuery();
            while (rs.next()) {                
                Page p = new Page(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
                pages.add(p);
            }

        } catch (Exception ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pages;
    }
    
}
