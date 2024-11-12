/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.SubjectCategory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Category;
import model.Subject;

/**
 *
 * @author trung
 */
public class CategoryDAO extends DBContext {

    public List<SubjectCategory> getAllCategory() {
        List<SubjectCategory> categories = new ArrayList<>();
        String sql = "SELECT * FROM Category";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SubjectCategory category = new SubjectCategory();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
                categories.add(category);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }

    public SubjectCategory getCategoryById(int categoryId) {
        String sql = "SELECT * FROM Category WHERE category_id = ?";
        SubjectCategory category = null;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, categoryId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                category = new SubjectCategory();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
            }

        } catch (Exception e) {
            e.printStackTrace(); //
        }

        return category;
    }

    public List<Category> searchCategories(String keyword) {
        List<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM Category WHERE category_name LIKE ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%"); 
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
                categoryList.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoryList;
    }

    public ArrayList<Category> getCategory() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Category> category_list = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Category ";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));

                category_list.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return category_list;
    }
    
    public Category getCategoryByID(int categoryId) {
        String sql = "SELECT * FROM Category WHERE category_id = ?";
        Category category = null;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, categoryId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
            }

        } catch (Exception e) {
            e.printStackTrace(); //
        }

        return category;
    }
    
     public String getCategoryNameById(int categoryId) {
        String sql = "SELECT category_name FROM Category WHERE category_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("category_name");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        Category c = dao.getCategoryByID(1);
        System.out.println(c);
    }

}
