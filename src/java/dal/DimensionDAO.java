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
import model.Dimension;
import model.DimensionType;
import model.Subject;

/**
 *
 * @author trung
 */
public class DimensionDAO extends DBContext {

    public List<Dimension> getAllDimension() {
        List<Dimension> dimensions = new ArrayList<>();
        String sql = "SELECT  [dimension_id]\n"
                + "      ,[dimension_name]\n"
                + "      ,[dimension_type_id]\n"
                + "      ,[subject_id]\n"
                + "  FROM [dbo].[Dimension]";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dimension dimension = new Dimension();
                dimension.setDimension_id(rs.getInt("dimension_id"));
                dimension.setDimension_name(rs.getString("dimension_name"));

                SubjectDAO sDao = new SubjectDAO();
                Subject subject = sDao.getSubjectByID(rs.getInt("subject_id"));

                dimension.setSubject_id(rs.getInt("subject_id"));

                DimensionDAO dDap = new DimensionDAO();
                DimensionType dt = dDap.getType(rs.getInt("dimension_type_id"));
                dimension.setDimension_type_id(rs.getInt("dimension_type_id"));

                dimensions.add(dimension);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dimensions;
    }

    public DimensionType getType(int dimensionTypeId) {
        String sql = "SELECT * FROM Dimension_Type WHERE dimension_type_id = ?";
        DimensionType dimensionType = null;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, dimensionTypeId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                dimensionType = new DimensionType();
                dimensionType.setDimension_type_id(rs.getInt("dimension_type_id"));
                dimensionType.setDimension_type_name(rs.getString("dimension_type_name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dimensionType;
    }

    public Dimension getDimensionById(int dimensionId) {
        Dimension dimension = null; // Initialize the dimension object
        String sql = "SELECT [dimension_id], [dimension_name], [dimension_type_id], [subject_id] FROM [dbo].[Dimension] WHERE [dimension_id] = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, dimensionId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                dimension = new Dimension();
                dimension.setDimension_id(rs.getInt("dimension_id"));
                dimension.setDimension_name(rs.getString("dimension_name"));

                SubjectDAO sDao = new SubjectDAO();

                dimension.setSubject_id(rs.getInt("subject_id"));

                DimensionType dt = getType(rs.getInt("dimension_type_id"));
                dimension.setDimension_type_id(rs.getInt("dimension_type_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dimension;
    }

    public List<DimensionType> getAllType() {
        List<DimensionType> types = new ArrayList<>();
        String sql = "SELECT dimension_type_id, dimension_type_name FROM Dimension_Type";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                DimensionType dimensionType = new DimensionType();
                dimensionType.setDimension_type_id(rs.getInt("dimension_type_id"));
                dimensionType.setDimension_type_name(rs.getString("dimension_type_name"));

                types.add(dimensionType);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return types;
    }

    public boolean updateDimension(int id, String dimension_name, int dimension_type_id) {
        String sql = "UPDATE Dimension SET dimension_name = ?, dimension_type_id = ? WHERE dimension_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, dimension_name);
            pstmt.setInt(2, dimension_type_id);
            pstmt.setInt(3, id);

            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean createNewDimension(String dimension_name, int dimension_type_id, int subject_id) {
        String sql = "INSERT INTO Dimension (dimension_name, dimension_type_id, subject_id) VALUES (?, ?, ?)";

        try (
                PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, dimension_name);
            pstmt.setInt(2, dimension_type_id);
            pstmt.setInt(3, subject_id);

            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteDimension(int id) {
        String sql = "DELETE FROM Dimension WHERE dimension_id = ?"; // SQL query to delete by id
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Dimension> getAllDimension1() {
        List<Dimension> dimensions = new ArrayList<>();
        String sql = "SELECT  [dimension_id]\n"
                + "      ,[dimension_name]\n"
                + "      ,[dimension_type_id]\n"
                + "      ,[subject_id]\n"
                + "  FROM [dbo].[Dimension]";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Dimension dimension = new Dimension();
                dimension.setDimension_id(rs.getInt("dimension_id"));
                dimension.setDimension_name(rs.getString("dimension_name"));

                SubjectDAO sDao = new SubjectDAO();
                Subject subject = sDao.getSubjectByID(rs.getInt("subject_id"));

                dimension.setSubject_id1(subject);

                DimensionDAO dDap = new DimensionDAO();
                DimensionType dt = dDap.getType(rs.getInt("dimension_type_id"));
                dimension.setDimension_type_id1(dt);

                dimensions.add(dimension);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dimensions;
    }

    public Dimension getDimensionById1(int dimensionId) {
        Dimension dimension = null; // Initialize the dimension object
        String sql = "SELECT [dimension_id], [dimension_name], [dimension_type_id], [subject_id] FROM [dbo].[Dimension] WHERE [dimension_id] = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, dimensionId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                dimension = new Dimension();
                dimension.setDimension_id(rs.getInt("dimension_id"));
                dimension.setDimension_name(rs.getString("dimension_name"));

                SubjectDAO sDao = new SubjectDAO();
                Subject subject = sDao.getSubjectByID(rs.getInt("subject_id"));
                dimension.setSubject_id1(subject);

                DimensionType dt = getType(rs.getInt("dimension_type_id"));
                dimension.setDimension_type_id1(dt);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dimension;
    }

}
