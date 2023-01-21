<?php

/* 
 * about.php: a PHP file for information about CVHR.
 * Will hopefully contains pictures and links later.
 */

	session_start();
	session_cache_expire(30);
?>
<html>
	<head>
		<title>
			About
		</title>
		<link rel="stylesheet" href="styles.css" type="text/css" />
	</head>
	<body>
		<div id="container">
			<?PHP include('header.php');?>
			<div id="content">
				<p><strong>Background</strong><br /><br />

				Central Virginia Horse Rescue, Inc   is a 501(c)3 small  rescue founded in south central Virginia and 
				dedicated to the care and rehabilitation of needy horses.  In 2020, the Horse Adoption Central moved to 
				Fredericksburg, VA.  The rescue serves the state of Virginia.

				<p>Our mission is to save, protect, and rehabilitate equines in need.  We rescue unwanted, abused, neglected, 
				or abandoned equines; provide them with care and rehabilitation; and finally find them a compatible, loving home.  
				We believe that education is the long-term solution to improving the lives of equines.

				<p> For more information, please visit our <a href="https://centralvahorserescue.org/" target="_blank"><strong><u>website</u></strong></a>.</p>
				
			</div>
		</div>
	</body>
</html>
