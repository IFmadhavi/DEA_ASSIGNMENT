<%@ page import="java.io.*, java.util.*, jakarta.servlet.http.Part, jakarta.servlet.annotation.MultipartConfig" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="com.shop.shopapplication.DBManager" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="java.io.BufferedInputStream, java.io.BufferedOutputStream" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest, jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.StandardCopyOption" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<html>
<body>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        Part filePart = request.getPart("file");
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String description = request.getParameter("description");

        Random rand = new Random();
        int rand_int = rand.nextInt(90000) + 10000;
        String fileName = Integer.toString(rand_int);

        Part part = request.getPart("image");
        String originalFileName = part.getSubmittedFileName();
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        String randomFileName = fileName + extension;

        File directory = new File("./images");
        if (! directory.exists()){
            directory.mkdir();
        }

        String uploadFilePath = getServletContext().getRealPath(File.separator + "../images") + File.separator + randomFileName;

        try {
            BufferedInputStream in = new BufferedInputStream(part.getInputStream());
            BufferedOutputStream fileOut = new BufferedOutputStream(new FileOutputStream(uploadFilePath));
            byte[] buffer = new byte[1024];
            int read;
            while ((read = in.read(buffer)) != -1) {
                fileOut.write(buffer, 0, read);
            }
            fileOut.flush();
            fileOut.close();
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error writing file");
        }

        part.write(uploadFilePath);
        response.getWriter().print("The file uploaded successfully.");

        if(part == null || part.getSize() == 0) {
            return;
        }

        Connection connection = DBManager.getInstance().getConnection();
        Random randId = new Random();
        int number = rand.nextInt(90000) + 10000;

        try {
            String sql = "INSERT INTO products (productName, price, category, imageUrl,id, description) VALUES (?, ?, ?, ?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productName);
            preparedStatement.setString(2, price);
            preparedStatement.setString(3, category);
            preparedStatement.setString(4, uploadFilePath);
            preparedStatement.setString(5, Integer.toString(number));
            preparedStatement.setString(6, description);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
%>
<form method="post" action="upload.jsp" enctype="multipart/form-data">
    <input type="text" name="productName">
    <!-- Other form fields... -->
    <input type="file" name="file" id="file">
    <input type="submit">
</form>
</body>
</html>
