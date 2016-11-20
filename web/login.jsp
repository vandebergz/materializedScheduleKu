<%-- 
    Document   : login
    Created on : Nov 20, 2016, 7:29:26 PM
    Author     : Evan
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.swing.JOptionPane"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>
<html>
    <head>
        <title>Login</title>
        <!-- CSS -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>
    <body class="page-login">
        <div class="center">
            <div class="card bordered z-depth-2" style="margin:0% auto; max-width:400px;">
                <div class="card-header green accent-2">
                    <i class="material-icons medium white-text">perm_identity</i>
                </div>
                <form action="login.jsp" method="POST">
                    <div class="card-content">
                        <!--form-->
                        <div class="input-field col s12">
                            <input id="username" name="username" type="text" class="validate">
                            <label for="username">Username</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="password" name="password" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>

                        <input type="checkbox" class="filled-in" id="filled-in-box">
                        <label for="filled-in-box">Remember me?</label>
                        <button type="submit" id="login" name="login_button" class="btn blue-grey right waves-effect waves-light white-text" value="Log In">Login</button>
                        <!--/form-->
                    </div>
                    <div class="card-content clearfix">
                        <div class="row">
                            <div class="col s6 text-p">
                                <a href="#forgotpass" class="amber-text lighten-1 tooltipped modal-trigger" data-position="top" data-delay="50" data-tooltip="Forgot your password?">Forgot your password?</a>
                            </div>
                            <div class="col s6 right-align text-p">
                                <a href="register.jsp" class="amber-text lighten-1 tooltipped" data-position="top" data-delay="50" data-tooltip="Register now!">Register now!</a>
                                <!-- Modal Structure -->
                                <div id="forgotpass" class="modal">
                                    <div class="modal-content">
                                        <h5 class="left-align">Forgot Password?</h5>
                                        <br>
                                        <div class="input-field col s12">
                                            <input placeholder="Email" id="forgot" type="email" class="validate">
                                            <label for="forgot">Enter your e-mail address below to reset your password.</label>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Submit</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
<!-- SCRIPTS -->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();
    });
</script>
<script type="text/javascript">
    function valUser() {
        var usern, psswd, warning;
        usern = document.getElementById('username').value;
        psswd = document.getElementById('password').value;

        if (usern.length == 0 || psswd.length == 0) {
            if (usern.length == 0) {
                warning = "Username kosong. ";
            } else if (psswd.length == 0) {
                warning = "Password kosong. ";
            }
            alert(warning + "Tidak boleh ada yang kosong!");
        }
    }
</script>
<%
   
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesags",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("username", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("home.html");
    } else {
       // out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
    
    
    /* try {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesags" + "user=root&password=");
        PreparedStatement pst = conn.prepareStatement("SELECT * from users where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            response.sendRedirect("home.jsp");
        } else {
            out.println("Invalid login credentials");
        }
    } catch (Exception e) {
        out.println("Something went wrong! Please try again.");
    }*/

    /*  String thisUser = request.getParameter("username");
    String thisPass = request.getParameter("password");
    
//membuat variabel untuk nampung alamat untuk akses database nantinya.
    String url = "jdbc:mysql://localhost:3306/tubesags";

//membuat koneksi ke database dengan jdbc
    Connection conn = null;
    PreparedStatement ps = null;
    int updateQuery = 0;

//untuk mengecek textbox name, city, dan phone tidak kosong
    if (thisUser != null && thisPass != null) {
        if (thisUser != "" && thisPass != "") {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "root", "");
                String query = "SELECT * FROM users where username = ? and password = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, thisUser);
                ps.setString(2, thisPass);
                updateQuery = ps.executeUpdate();
                if (updateQuery >= 0) {
                    //JOptionPane.showMessageDialog(null, "Berhasil Tambah Data");
                    response.sendRedirect("home.html.jsp");
                }
            } catch (SQLException ex) {

                ex.printStackTrace();
            } 
                ps.close();
                conn.close();
            
        }
    }*/
%>

