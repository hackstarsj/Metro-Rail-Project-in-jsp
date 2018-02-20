<%-- 
    Document   : Header
    Created on : 17 Feb, 2018, 9:14:29 PM
    Author     : sanjeev
--%>

<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="#"><img class="img-responsive logo" src="../img/logo.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
          <li><a href="../index.jsp"><i class="fa fa-home"></i> Home</a></li>
          <li><a href="../complaint.jsp"><i class="fa fa-comment"></i> Complaints</a></li>
          <li><a href="../timing.jsp"><i class="fa fa-clock-o"></i> Timing</a></li>
          <li><a href="../fair.jsp"><i class="fa fa-map"></i> Fair and Route</a></li>
          <li><a href="card.jsp"><i class="fa fa-credit-card"></i> Metro Card</a></li>
      </ul>
    </div>
  </div>
</nav>
    
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
      <img src="../img/banner.png" alt="Metro Rail">
    </div>

    <div class="item">
      <img src="../img/banner2.png" alt="Metro Rail">
    </div>

    <div class="item">
      <img src="../img/banner3.png" alt="Metro Mail">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="sr-only">Next</span>
  </a>
</div>
</header>
          