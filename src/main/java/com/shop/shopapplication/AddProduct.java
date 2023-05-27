package com.shop.shopapplication;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class AddProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        Random rand = new Random();
        int rand_int = rand.nextInt(90000) + 10000;
        String fileName = Integer.toString(rand_int);

        Part part = request.getPart("image"); // Obtain the upload file part in this multipart request
        String originalFileName = part.getSubmittedFileName();
       
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

        String randomFileName = fileName + extension;

      File directory = new File("./images");
if (! directory.exists()){
    directory.mkdir();
}

System.out.println("Directory absolute path: " + directory.getAbsolutePath());  // Print the absolute path
System.out.println("Random file name: " + randomFileName); // Print the random file name
String uploadFilePath = getServletContext().getRealPath(File.separator + "images") + File.separator + randomFileName;

try {
    
    BufferedInputStream in = new BufferedInputStream(part.getInputStream());
BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(uploadFilePath));

byte[] buffer = new byte[1024];
int read = 0;
while ((read = in.read(buffer)) != -1) {
    out.write(buffer, 0, read);
}

out.flush();
out.close();
in.close();

} catch (IOException e) {
    e.printStackTrace();
    System.out.println("Error writing file");
}


        part.write(uploadFilePath);
        response.getWriter().print("The file uploaded successfully.");

        if(part == null || part.getSize() == 0) {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('No image file was selected. Please select an image file before submitting.');");
            out.println("location='addProduct.jsp';");  // Redirect back to the addProduct page
            out.println("</script>");
            return;
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        connection = DBManager.getInstance().getConnection();

        
  Random randId = new Random();
        int number = rand.nextInt(90000) + 10000;
        
        
        try {
            String sql = "INSERT INTO products (productName, price, category, imageUrl,id, description) VALUES (?, ?, ?, ?,?,?)";
            connection = DBManager.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productName);
            preparedStatement.setString(2, price);
            preparedStatement.setString(3, category);
            preparedStatement.setString(4, "..\\images\\"+randomFileName);
            preparedStatement.setString(5, Integer.toString(number));
            preparedStatement.setString(6, description);


            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Product added successfully!');");
        out.println("location='addProduct.jsp';");  // Redirect to the addProduct page after successful insertion
        out.println("</script>");
    }
}
