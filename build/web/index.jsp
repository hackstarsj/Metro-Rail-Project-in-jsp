<!Doctype html>
<html> 
<head> 
<title>Connection with mysql database</title>
<!--====================================Script and StyleSheet=====================================-->
<%@ include file="scriptsstyle.jsp" %>  
<!--====================================End Script and StyleSheet=====================================-->
</head> 
<body>
<div class="container-fluid">
    <div class="row">
<!--=====================================Header=======================================-->
<%@ include file="nav.jsp" %>
<!--=====================================Header End=======================================-->
    </div>
<div class="row">
    <div class="col-lg-9">
        <main>
            <div class="homecontent">
            <h3>Welcome To Metro Rail.</h3>
            <p>METRORail moves along the street just like other vehicles.</p>
            <p> The tracks are separated from the roadway by large raised white domes warning drivers to stay off the tracks. METRORail is very quiet. In fact, the trains are quieter than buses and most cars. So, whether you are riding METRORail, or just walking or driving near the trains and tracks, it is important to stay alert and follow the safety rules of METRORail. </p>
            </div>
            <div class="homenews">
               <h3>
                Latest News
              </h3>
                <marquee direction="up" scrolldelay="500" behavior=""scroll>
                    <p>MEGA invites bids for ?Design and Construction Underground Stations and Tunnels.</p>
                    <p>The Government of India has finalised a plan to augment and launch mass rapid transportation systems across 50 cities to minimise commuter woes.</p>
                </marquee>
           </div>            

        </main>
    </div>
    <div class="col-lg-3">
      <%@ include file="sidebar.jsp" %>  
    </div>
</div>
    

<!--====================================Footer=====================================-->
<div class="row">
<%@ include file="footer.jsp" %>  
</div>
<!--====================================Footer End=====================================-->
</div>
</body> 
</html>