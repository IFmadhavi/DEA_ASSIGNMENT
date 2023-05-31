<%@ page import="java.sql.*" %>
<%
    String orderId = request.getParameter("orderId");
    String newStatus = request.getParameter("status");

    Connection con = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopdb", "root", "");

        String query = "UPDATE orders SET status = ? WHERE id = ?";
        stmt = con.prepareStatement(query);
        stmt.setString(1, newStatus);
        stmt.setString(2, orderId);

        int i = stmt.executeUpdate();

        if(i > 0) {
            out.print("Status updated successfully");
        } else {
            out.print("There was a problem updating the status");
        }

    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(stmt != null) {
            try { stmt.close(); } catch(Exception e) {}
        }
        if(con != null) {
            try { con.close(); } catch(Exception e) {}
        }
    }

    // Redirecting back to the admin.jsp page
    response.sendRedirect("admin.jsp");
%>
