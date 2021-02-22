package model;

public class FollowDetails {
    int userId;
    int pId;

    public FollowDetails() {
    }

    public FollowDetails(int userId, int pId) {
        this.userId = userId;
        this.pId = pId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }
    
    
    
}
