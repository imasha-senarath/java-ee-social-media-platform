
package model;

public class Page {
    int pageId;
    int userId;
    String companyName;
    String companyAddress;
    String companyTelephone;
    String companyEmail;

    public Page() {
    }

    public Page(int pageId, int userId, String companyName, String companyAddress, String companyTelephone, String companyEmail) {
        this.pageId = pageId;
        this.userId = userId;
        this.companyName = companyName;
        this.companyAddress = companyAddress;
        this.companyTelephone = companyTelephone;
        this.companyEmail = companyEmail;
    }

    public Page(String companyName) {
        this.companyName = companyName;
    }

    
    public Page(int userId, String companyName, String companyAddress, String companyTelephone, String companyEmail) {
        this.userId = userId;
        this.companyName = companyName;
        this.companyAddress = companyAddress;
        this.companyTelephone = companyTelephone;
        this.companyEmail = companyEmail;
    }

    public Page(int pageId, String companyName) {
        this.pageId = pageId;
        this.companyName = companyName;
    }

    public Page(int userId) {
        this.userId = userId;
    }
    

    public int getPageId() {
        return pageId;
    }

    public void setPageId(int pageId) {
        this.pageId = pageId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCompanyTelephone() {
        return companyTelephone;
    }

    public void setCompanyTelephone(String companyTelephone) {
        this.companyTelephone = companyTelephone;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }
    
    
    
}
