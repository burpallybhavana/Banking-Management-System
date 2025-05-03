<%-- 
    Document   : AdminHome
    Created on : Jun 15, 2020, 6:39:00 PM
    Author     : Venkat
--%>
<% String username=(String)session.getAttribute("username");
                        String ano=(String)session.getAttribute("ano");
                        String bankname=(String)session.getAttribute("bankname");
                        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>Bank Management System</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="#" type="image/x-icon" />
    <link rel="apple-touch-icon" href="#" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Pogo Slider CSS -->
    <link rel="stylesheet" href="css/pogo-slider.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

    <!-- LOADER -->
    <div id="preloader">
        <div class="loader">
            Bank Management System
        </div>
    </div>
    <!-- end loader -->
    <!-- END LOADER -->

    <!-- Start header -->
    <header class="top-header">
        <nav class="navbar header-nav navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.html"><h1><font color="blue">Bank Management System</font></h1></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                    <ul class="navbar-nav">
                        <li><a class="nav-link active" href="CustomerHome.jsp">Home</a></li>
                         <li><a class="nav-link" href="ViewBalance.jsp">View Balance</a></li>
                        <li><a class="nav-link" href="Deposit.jsp">Deposit</a></li>
                        <li><a class="nav-link" href="WithDraw.jsp">Withdraw</a></li>
                        <li><a class="nav-link" href="Transfer.jsp">Transfer</a></li>
                              <li><a class="nav-link" href="ViewTransactions.jsp">View Transactions</a></li>
                        <li><a class="nav-link" href="ViewHolidays.jsp">View Holidays </a></li>
                        <li><a class="nav-link" href="index.html">Logout</a></li>
						
                </div>
                
            </div>
        </nav>
    </header>
    <!-- End header -->
<!-- end section -->
	<!-- section -->
    <div class="section margin-top_50 silver_bg">
        <div class="container">
            <div class="row">
			    <div class="col-md-6">
                    <div class="full float-right_img">
                        <br><br>
                        <h1>Account Number: <font color="red"><br><br>
                                 <%=ano%></font></h1>
                    </div>
                </div>
                <div class="col-md-6 layout_padding_2">
                    <div class="full">
                        <div class="heading_main text_align_left">
                            
						   <h2><span>Deposit Here</h2>
                        </div>
                        
						<div class="full">
                                                    <form name="deposit" action="DepositAction.jsp" method="post" onsubmit="return validate()"
                                                    <p>ACC NO<input type="text" nam="ano" value="<%=ano%>" ></p>
                                                       <%@page import="java.sql.*"%>
            <%@page import="com.DBCon" %>
<%
	try
	{
	
	Connection con=DBCon.getCon();
                Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from account where ano='"+ano+"'");
        while(rs.next())
        {
            String balance=rs.getString(4);
%>
                                                        
                                                        <p><input type="hidden"  name="balace" value="<%=balance%>"></p> 
                                                                <%}

                                                
	}
			catch(Exception e)
			{
			out.println(e);
			}
			 %>
                                                        <p><input type="text" name="amount" placeholder="Enter Amount to Deposit" required=""></p>
                                                        <p><input type="submit" value="Deposit"></p>
                                                </div>
						<div class="full">
						  </div>
                    </div>
                </div>
			</div>
        </div>
    </div>

    

    <a href="#" id="scroll-to-top" class="hvr-radial-out"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.pogo-slider.min.js"></script>
    <script src="js/slider-index.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/custom.js"></script>
	<script>
	/* counter js */

(function ($) {
	$.fn.countTo = function (options) {
		options = options || {};
		
		return $(this).each(function () {
			// set options for current element
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);
			
			// how many times to update the value, and how much to increment the value on each update
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;
			
			// references & variables that will change with each update
			var self = this,
				$self = $(this),
				loopCount = 0,
				value = settings.from,
				data = $self.data('countTo') || {};
			
			$self.data('countTo', data);
			
			// if an existing interval can be found, clear it first
			if (data.interval) {
				clearInterval(data.interval);
			}
			data.interval = setInterval(updateTimer, settings.refreshInterval);
			
			// initialize the element with the starting value
			render(value);
			
			function updateTimer() {
				value += increment;
				loopCount++;
				
				render(value);
				
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}
				
				if (loopCount >= loops) {
					// remove the interval
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;
					
					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}
			
			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.html(formattedValue);
			}
		});
	};
	
	$.fn.countTo.defaults = {
		from: 0,               // the number the element should start at
		to: 0,                 // the number the element should end at
		speed: 1000,           // how long it should take to count between the target numbers
		refreshInterval: 100,  // how often the element should be updated
		decimals: 0,           // the number of decimal places to show
		formatter: formatter,  // handler for formatting the value before rendering
		onUpdate: null,        // callback method for every time the element is updated
		onComplete: null       // callback method for when the element finishes updating
	};
	
	function formatter(value, settings) {
		return value.toFixed(settings.decimals);
	}
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
	formatter: function (value, options) {
	  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
	}
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
	var $this = $(this);
	options = $.extend({}, options || {}, $this.data('countToOptions') || {});
	$this.countTo(options);
  }
});
	</script>
</body>

</html>
