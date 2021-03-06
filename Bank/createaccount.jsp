<%@ page import="java.util.Random"%>
<%@ page import="java.sql.*" session="true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>LPU e-Banking | Create Account </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Net Banking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
<link href="css/owl.theme.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/cm-overlay.css" />
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- animation -->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!-- //animation --> 
<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({
 
		autoPlay: 3000, //Set AutoPlay to 3 seconds
		autoPlay:true,
		items : 3,
		itemsDesktop : [640,5],
		itemsDesktopSmall : [414,4]
 
	});
	
}); 
</script>

</head>
<body>
	<!-- banner -->
	<div class="banner">
		<!--header-->
		<div class="header">
			<div class="container">		
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a  href="index.html">LPU<span>e-BANK</span></a></h1>
					</div>
					<!--navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="index.html">Home</a></li>
							<li><a href="#" class="active">Create Account</a></li>
						</ul>	
						<div class="clearfix"> </div>	
					</div>
				</nav>
			</div>
		</div>
	<!-- welcome -->
	<div class="welcome about" id="welcome">
		<div class="container">
			<div>
            <%
				String name=request.getParameter("uname");
				String email=request.getParameter("email");
				String password=request.getParameter("password");
				Long cno=Long.parseLong(request.getParameter("cno"));
				int balance=0;
				Random rand=new Random();
				int accno=rand.nextInt(10000)+100000;
				String fname=request.getParameter("fname");
				int age=Integer.parseInt(request.getParameter("age"));
				String city=request.getParameter("city");
				int flag=0;
				int regno=Integer.parseInt(request.getParameter("regno"));
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Vish123");
					PreparedStatement ps1=con.prepareStatement("insert into usertable values(?,?,?,?,?,?,?,?,?)");
					ps1.setString(1,name);
					ps1.setString(2,email);
					ps1.setString(3,password);
					ps1.setLong(4,cno);
					ps1.setInt(5,accno);
					ps1.setString(6,fname);
					ps1.setInt(7,age);
					ps1.setString(8,city);
					ps1.setInt(9,regno);
					
					int rs=ps1.executeUpdate();
					if(rs>0)
					{	
						flag++;
					}
					else
					{
						out.println("Not Created");
					}
					PreparedStatement ps=con.prepareStatement("insert into accounttable values(?,?)");
					ps.setInt(1,accno);
					ps.setInt(2,balance);
					int rs1=ps.executeUpdate();
					if(rs1>0)
					{	
						flag++;
					}
					else
					{
						out.println("Not Created");
					}
					if(flag==2)
					{
					%>
					<div class="w3-welcome-heading">
						<h2>Account Created Successfully.</h2><h3>Your Account No. is <%=accno%></h3>
					</div>
                    <%
                    }
					else
					{
						out.println("Not Created");
					}
				}
				catch(Exception e)
				{
					out.println(e);
				}				
			%>
            </div>
		</div>
	</div>
	
	
	<!-- footer -->
	<div class="jarallax footer">
		<div class="container">
			<div class="footer-logo">
				<h3><a href="index.html">LPU<span>Bank</span></a></h3>
			</div>
			<div class="copyright">
				<p>© 2017 LPU BANK. All rights reserved</p>
			</div>
		</div>
	</div>
	<!-- //copyright -->
	<script src="js/jarallax.js"></script>
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 768
		})
	</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/owl.carousel.js"></script>  
</body>	
</html>