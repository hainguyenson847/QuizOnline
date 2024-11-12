/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Question;
import java.sql.*;
import model.Answer;
import model.Dimension;
import model.Lesson_Topic;
import model.Level;
import model.Slider;
import model.Subject;

/**
 *
 * @author trung
 */
public class SliderDAO extends DBContext {

    public List<Slider> getAllSlider() {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT [slider_id], [slider_image], [slider_link], [slider_detail], [slider_title] FROM [Slider]";

        try {
            // Kết nối tới database
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            // Duyệt qua kết quả trả về và thêm vào danh sách sliders
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setSlider_id(rs.getInt("slider_id"));
                slider.setSlider_image(rs.getString("slider_image"));
                slider.setSlider_link(rs.getString("slider_link"));
                slider.setSlider_detail(rs.getString("slider_detail"));
                slider.setSlider_title(rs.getString("slider_title"));
                sliders.add(slider);
            }

            rs.close();
            ps.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sliders;
    }

    public boolean updateSlider(int sliderId, String sliderTitle, String sliderLink, String sliderDetail, String sliderImage) {
        // Câu lệnh SQL để cập nhật slider
        String query = "UPDATE Slider SET slider_title = ?, slider_link = ?, slider_detail = ?, slider_image = ? WHERE slider_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            // Thiết lập các giá trị vào câu lệnh SQL
            ps.setString(1, sliderTitle);
            ps.setString(2, sliderLink);
            ps.setString(3, sliderDetail);
            ps.setString(4, sliderImage);
            ps.setInt(5, sliderId);

            // Thực hiện cập nhật
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ
        }
        return false;
    }

    public boolean deleteById(int sliderId) {
        String sql = "DELETE FROM Slider WHERE slider_id = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, sliderId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean insertSlider(String sliderImage, String sliderLink, String sliderDetail, String sliderTitle) {
    String query = "INSERT INTO Slider (slider_image, slider_link, slider_detail, slider_title) VALUES (?, ?, ?, ?)";

    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, sliderImage);
        ps.setString(2, sliderLink);
        ps.setString(3, sliderDetail);
        ps.setString(4, sliderTitle);

        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; 
    } catch (SQLException e) {
        e.printStackTrace(); 
    }
    return false; 
}

    

    public static void main(String[] args) {
        // Tạo đối tượng SliderDAO
        SliderDAO sliderDAO = new SliderDAO();

        // Các giá trị mới để cập nhật slider
        int sliderId = 2; // slider_id muốn cập nhật
        String sliderTitle = "New Slider Title"; // Tiêu đề mới
        String sliderLink = "http://newsliderlink.com"; // Link mới
        String sliderDetail = "This is the updated detail of the slider"; // Thông tin chi tiết mới
        String sliderImage = "new-image.jpg"; // Đường dẫn hình ảnh mới

        // Gọi phương thức updateSlider để cập nhật slider
        sliderDAO.updateSlider(sliderId, sliderTitle, sliderLink, sliderDetail, sliderImage);

        // Thông báo cập nhật thành công
        System.out.println("Slider with ID " + sliderId + " has been updated successfully!");
    }

}
