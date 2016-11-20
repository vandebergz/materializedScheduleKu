<%-- 
    Document   : register
    Created on : Nov 20, 2016, 7:30:01 PM
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Halaman Registrasi</title>
<!-- CSS -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body class="page-login">
  <div class="center">
    <div class="card bordered z-depth-2" style="margin:0% auto; max-width:400px;">
      <div class="card-header blue">
        <span class="text-lg text-bold text-primary" style="color:white">ACCOUNT REGISTRATION</span>
      </div>
      <div class="card-content">
        <form>
          <div class="input-field col s12">
            <input id="name" type="text" class="validate">
            <label for="name">Nama</label>
          </div>
          <div class="input-field col s12">
            <input id="nim" type="text" class="validate">
            <label for="nim">NIM</label>
          </div>
          <div class="input-field col s12">
            <p>
              Jenis Kelamin
            </p>
              <p>
                <input name="jk" type="radio" id="jk1" />
                <label for="jk1">Laki-laki</label>
                <input name="jk" type="radio" id="jk2" />
                <label for="jk2">Perempuan</label>
              </p>
          </div>
          <div class="input-field col s12">
            <p>
              Kelas
            </p>
              <select>
              <option value="" disabled selected>Choose your option</option>
              <option value="SI-38-01">SI-38-01</option>
              <option value="SI-38-02">SI-38-02</option>
              <option value="SI-38-03">SI-38-03</option>
            </select>
          </div>
          <div class="input-field col s12">
            <p>
              Tanggal Lahir
            </p>
             <input type="date" class="datepicker">
          </div>
          <div class="row">
            <p>
              Peminatan
            </p>
            <p>
              <input type="checkbox" class="filled-in" id="filled-in-box"/>
              <label for="filled-in-box">Management Infrastructure</label>
              <input type="checkbox" class="filled-in" id="filled-in-box2"/>
              <label for="filled-in-box2">Application Development</label>
            </p>
          </div>
          <div class="file-field input-field">
            <div class="btn blue">
                <span>File</span>
                <input type="file">
            </div>
            <div class="file-path-wrapper">
              <input class="file-path validate" type="text">
            </div>
          </div>
          <div class="input-field col s12">
            <input id="username" type="text" class="validate">
            <label for="username">Username</label>
          </div>
          <div class="input-field col s12">
            <input id="password" type="password" class="validate">
            <label for="password">Password</label>
          </div>
          <div class="input-field col s12">
            <input id="confirm" type="password" class="validate">
            <label for="confirm">Confirm Password</label>
            <div class="row">
                <button type="button" id="login" name="login_button" class="btn blue-grey right waves-effect waves-light white-text" onclick="valUser()">Register</button>
            </div>
          </div>
    </form>
    </div>
</div>
<div class="registration">
  Already have an account? <a href="login.jsp">Login</a>
</div>
</body>
</html>
<!-- SCRIPTS -->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.min.js"></script>
<script>
$(document).ready(function() {
$('select').material_select();
});
$('.datepicker').pickadate({
   selectMonths: true, // Creates a dropdown to control month
   selectYears: 15 // Creates a dropdown of 15 years to control year
 });
</script>
<script type="text/javascript">

function valUserPsswd(){
  var usern, psswd, warning;
  usern = document.getElementById('user').value;
  psswd = document.getElementById('pass').value;

  if (usern.length==0 || psswd.length==0) {
    if (usern.length==0) {
        warning = "Username kosong. ";
    } else if (psswd.length==0) {
      warning = "Password kosong. ";
    }
    alert(warning+"Tidak boleh ada yang kosong!");
  }
}

function valNama(){
  var nama = document.getElementById('name').value;
  if (nama.length==0) {
    alert("Silahkan isi Nama");
  }
  if (nama.length < 6 || nama.length > 20) {
    alert("Minimal 6 karakter dan Maksimal 20 karakter!")
  }
}
function valNIM(){
  var nim = document.getElementById('NIM').value;
  if (nim.length==0) {
    alert("Silahkan isi NIM");
  }
  else if (nim.length != 10) {
    alert("Input harus 10 karakter!")
  }
}

function valAddress(){
  var addr = document.getElementById('address').value;
  if (addr.length==0) {
    alert("Tidak boleh kosong!");
  } else if (addr.length > 60) {
    alert("Melebihi batas maksimal karakter!");
  }
}
</script>