package model;

public class News {
    private int postId;
    private int pId;
    private String pageName;
    private String postTitle;
    private String postCategory;
    private String postBody;
    private String postDate;
    
    public News() {
    }

    public News(String postTitle, String postCategory, String postBody) {
        this.postTitle = postTitle;
        this.postCategory = postCategory;
        this.postBody = postBody;
    }

    public News(int postId, int pId, String postTitle, String postCategory, String postBody, String postDate) {
        this.postId = postId;
        this.pId = pId;
        this.postTitle = postTitle;
        this.postCategory = postCategory;
        this.postBody = postBody;
        this.postDate = postDate;
    }

    public News(int pId, String pageName, String postTitle, String postCategory, String postBody, String postDate) {
        this.pId = pId;
        this.pageName = pageName;
        this.postTitle = postTitle;
        this.postCategory = postCategory;
        this.postBody = postBody;
        this.postDate = postDate;
    }

    public News(int postId, int pId, String pageName, String postTitle, String postCategory, String postBody, String postDate) {
        this.postId = postId;
        this.pId = pId;
        this.pageName = pageName;
        this.postTitle = postTitle;
        this.postCategory = postCategory;
        this.postBody = postBody;
        this.postDate = postDate;
    }

    public News(int pId, String pageName, String postTitle, String postCategory, String postBody) {
        this.pId = pId;
        this.pageName = pageName;
        this.postTitle = postTitle;
        this.postCategory = postCategory;
        this.postBody = postBody;
    }

    
    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }
    
    
    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }
    
    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostCategory() {
        return postCategory;
    }

    public void setPostCategory(String postCategory) {
        this.postCategory = postCategory;
    }

    public String getPostBody() {
        return postBody;
    }

    public void setPostBody(String postBody) {
        this.postBody = postBody;
    }
    
}
