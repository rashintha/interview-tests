import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.FileReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ProductDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Load JSON file
            JSONTokener tokener = new JSONTokener(new FileReader("data.json"));
            JSONObject jsonObject = new JSONObject(tokener);
            JSONArray products = jsonObject.getJSONArray("products");

            // Iterate over each product and call the stored procedure
            for (int i = 0; i < products.length(); i++) {
                JSONObject product = products.getJSONObject(i);
                insertProduct(connection, product);
            }

            System.out.println("Products inserted successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void insertProduct(Connection connection, JSONObject product) throws SQLException {
        String productJson = product.toString();
        System.out.println("Inserting product: " + productJson);

        String sql = "{CALL InsertProduct(?)}";

        try (CallableStatement callableStatement = connection.prepareCall(sql)) {
            callableStatement.setString(1, productJson);
            callableStatement.execute();
        }
    }
}