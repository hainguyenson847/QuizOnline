/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Post;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Account;
import model.Blog;
import model.Category;

/**
 *
 * @author ADMIN
 */
public class PostDAO extends DBContext {

    public ArrayList<Post> getPost() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Post> post_list = new ArrayList<>();
        try {
            String strSelect = "SELECT Top 5 * FROM Blog";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                post_list.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return post_list;
    }

    public ArrayList<Post> getHottestPost() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Post> hottest_post_list = new ArrayList<>();
        try {
            String strSelect = "SELECT TOP 3 * FROM Blog order by [number_of_access] desc";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                hottest_post_list.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hottest_post_list;
    }

    public ArrayList<Post> getHottestPost1() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Post> hottest_post_list = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Blog order by [number_of_access] desc";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                hottest_post_list.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hottest_post_list;
    }

    public ArrayList<Post> searchPosts(String keyword) {
        ArrayList<Post> filteredPosts = new ArrayList<>();
        String query = "SELECT * FROM Blog WHERE blog_title LIKE ? OR blog_content LIKE ?"; // Tìm kiếm theo tiêu đề hoặc nội dung

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, "%" + keyword + "%");
            stmt.setString(2, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Post post = new Post();
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                filteredPosts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return filteredPosts;
    }

    public Post getPostByBlogID(int blog_id) {
        PreparedStatement stm;
        ResultSet rs;
        Post myPost = new Post();
        try {
            String strSelect = "SELECT * FROM Blog where blog_id=?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, blog_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                myPost.setBlog_id(rs.getInt("blog_id"));
                myPost.setBlog_title(rs.getString("blog_title"));
                myPost.setThumbnail(rs.getString("thumbnail"));
                myPost.setCreated_date(rs.getString("created_date"));
                myPost.setBlog_summary(rs.getString("blog_summary"));
                myPost.setBlog_title(rs.getString("blog_title"));
                myPost.setBlog_content(rs.getString("blog_content"));
                myPost.setUpdated_date(rs.getString("updated_date"));
                myPost.setIsFeatured(rs.getBoolean("isFeatured"));
                myPost.setStatus(rs.getBoolean("status"));
                myPost.setCategory_id(rs.getInt("category_id"));
                myPost.setAccount_id(rs.getInt("account_id"));
                myPost.setNumber_of_access(rs.getInt("number_of_access"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return myPost;
    }

    public int countCreatedBlogs(Account a) {
        String sql = "select COUNT(*) as count_blog from Blog\n"
                + "where account_id = ?";
        int count = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, a.getAccount_id());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count_blog");
            }
        } catch (Exception e) {
        }
        return count;
    }

    public ArrayList<Post> getLatestPosts() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Post> latestPosts = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Blog ORDER BY created_date DESC"; // Sắp xếp theo ngày tạo mới nhất
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                // Thiết lập các thuộc tính cho đối tượng Post
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                latestPosts.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return latestPosts;
    }

    public ArrayList<Post> getOldestPosts() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Post> oldestPosts = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Blog ORDER BY created_date ASC"; // Sắp xếp theo ngày tạo cũ nhất
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                // Thiết lập các thuộc tính cho đối tượng Post
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                oldestPosts.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return oldestPosts;
    }

    public ArrayList<Post> searchBlogsByCategory(String keyword) {
        ArrayList<Post> search_post = new ArrayList<>();

        String sql = "SELECT * FROM Blog WHERE category_id in (select category_id from Category where category_name= ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            // Sử dụng % để tìm kiếm bất kỳ vị trí nào trong tên hoặc mô tả
            pstmt.setString(1, keyword);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                search_post.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return search_post;
    }

    public List<Post> getALLPost() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Post> hottest_post_list = new ArrayList<>();
        try {
            String strSelect = "  SELECT *  FROM Blog order by [number_of_access] desc";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setBlog_id(rs.getInt("blog_id"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_date(rs.getString("created_date"));
                post.setBlog_summary(rs.getString("blog_summary"));
                post.setBlog_title(rs.getString("blog_title"));
                post.setBlog_content(rs.getString("blog_content"));
                post.setUpdated_date(rs.getString("updated_date"));
                post.setIsFeatured(rs.getBoolean("isFeatured"));
                post.setStatus(rs.getBoolean("status"));
                post.setCategory_id(rs.getInt("category_id"));
                post.setAccount_id(rs.getInt("account_id"));
                post.setNumber_of_access(rs.getInt("number_of_access"));

                hottest_post_list.add(post);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hottest_post_list;
    }

    public List<Category> getALLCategory() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT  category_id, category_name FROM Category";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int categoryId = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");
                categories.add(new Category(categoryId, categoryName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public void createBlog(Blog newBlog) {
        String sql = "INSERT INTO Blog (blog_title, blog_summary, blog_content, status, category_id, account_id, thumbnail, number_of_access, created_date, updated_date, isFeatured) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, getDate(), getDate(), 1)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            // Gán giá trị cho các tham số
            ps.setString(1, newBlog.getBlog_title());
            ps.setString(2, newBlog.getBlog_summary());
            ps.setString(3, newBlog.getBlog_content());
            ps.setBoolean(4, newBlog.isStatus());
            ps.setInt(5, newBlog.getCategory_id());
            ps.setInt(6, newBlog.getAccount_id());
            ps.setString(7, newBlog.getThumbnail());
            ps.setInt(8, 1); // Gán giá trị mặc định cho number_of_access

            // Thực thi câu lệnh
            ps.executeUpdate(); // Chèn blog vào cơ sở dữ liệu
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi nếu có
            throw new RuntimeException("Có lỗi xảy ra khi tạo blog: " + e.getMessage()); // Ném ngoại lệ nếu có lỗi
        }
    }

    public boolean deleteById(int id) {
        String sql = "DELETE FROM Blog WHERE blog_id = ?";
        boolean isDeleted = false;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();

            isDeleted = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Có lỗi xảy ra khi xóa blog: " + e.getMessage());
        }

        return isDeleted;
    }

    public void updateBlog(Blog updatedBlog) {
    String sql = "UPDATE Blog SET blog_title = ?, blog_summary = ?, blog_content = ?, status = ?, category_id = ?, thumbnail = ?, updated_date = getDate() WHERE blog_id = ?";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, updatedBlog.getBlog_title());
        ps.setString(2, updatedBlog.getBlog_summary());
        ps.setString(3, updatedBlog.getBlog_content());
        ps.setBoolean(4, updatedBlog.isStatus());
        ps.setInt(5, updatedBlog.getCategory_id());
        ps.setString(6, updatedBlog.getThumbnail());
        ps.setInt(7, updatedBlog.getBlog_id());

        ps.executeUpdate(); 
    } catch (SQLException e) {
        e.printStackTrace(); 
        throw new RuntimeException("Có lỗi xảy ra khi cập nhật blog: " + e.getMessage()); 
    }
}

    
    
    public static void main(String[] args) {
        // Tạo một đối tượng PostDAO
        PostDAO postDAO = new PostDAO();

        // Tạo một đối tượng Blog mới
        Blog newBlog = new Blog();
        newBlog.setBlog_title("Tiêu đề Blog Mới");
        newBlog.setBlog_summary("Tóm tắt về blog này.");
        newBlog.setBlog_content("Nội dung chi tiết của blog.");
        newBlog.setStatus(true); // hoặc false nếu không kích hoạt
        newBlog.setCategory_id(1); // Giả sử ID danh mục là 1
        newBlog.setAccount_id(1); // Giả sử ID tài khoản là 1
        newBlog.setThumbnail("thumbnail.jpg"); // Tên tệp hình ảnh

        // Gọi phương thức createBlog để chèn blog vào cơ sở dữ liệu
        try {
            postDAO.createBlog(newBlog);
            System.out.println("Blog đã được tạo thành công!");
        } catch (RuntimeException e) {
            System.err.println("Có lỗi xảy ra khi tạo blog: " + e.getMessage());
        }
    }

public Blog getBlogById(int blogId) {
    String sql = "SELECT * FROM Blog WHERE blog_id = ?";
    Blog blog = null; // Khởi tạo đối tượng Blog

    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, blogId); // Gán giá trị cho tham số blogId
        ResultSet rs = ps.executeQuery(); // Thực hiện truy vấn

        // Kiểm tra xem có kết quả hay không
        if (rs.next()) {
            blog = new Blog(); // Khởi tạo đối tượng Blog mới
            blog.setBlog_id(rs.getInt("blog_id")); // Gán giá trị các thuộc tính
            blog.setBlog_title(rs.getString("blog_title"));
            blog.setBlog_summary(rs.getString("blog_summary"));
            blog.setBlog_content(rs.getString("blog_content"));
            blog.setStatus(rs.getBoolean("status"));
            blog.setCategory_id(rs.getInt("category_id"));
            blog.setAccount_id(rs.getInt("account_id"));
            blog.setThumbnail(rs.getString("thumbnail"));
        }
    } catch (SQLException e) {
        e.printStackTrace(); // In ra lỗi nếu có
        throw new RuntimeException("Có lỗi xảy ra khi lấy blog: " + e.getMessage()); // Ném ngoại lệ nếu có lỗi
    }

    return blog; // Trả về đối tượng Blog hoặc null nếu không tìm thấy
}

  
}
