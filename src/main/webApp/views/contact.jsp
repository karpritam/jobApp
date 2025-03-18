<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Job Portal</title>


	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
			crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="style1.css">
	<link rel="stylesheet" type="text/css" href="contactStyle.css">

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-warning">
	<div class="container">
		<a class="navbar-brand fs-1 fw-medium" href="#">Pritam Job Portal Web App</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item">
					<a class="nav-link" href="home">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="viewAllJobs">All Jobs</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="contact">Contact</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div class="container">
		<div class="row">
			<div class="contact-left">
				<h2 class="sub-title">Contact</h2>
				<p><i class="fa-solid fa-envelope"></i>karpritam194@gmail.com</p>
			</div>
			<div class="contact-right">
				<form name="submit-to-google-sheet">
					<input type="text" name="Name" placeholder="Your Name" required/>
					<input type="email" name="Email" placeholder="Your Email" required/>
					<textarea name="Message" rows="6" placeholder="Your Message"></textarea>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
				<span id="msg"></span>
			</div>
		</div>
</div>

<script>
  const scriptURL = 'https://script.google.com/macros/s/AKfycbxcqVVECNgWTwgfQlKPnbH0Ibxl4woKeP6qNr-G6d-spBoL7XVxibFfLvV8Q5z2v0gFaA/exec'
  const form = document.forms['submit-to-google-sheet']

  form.addEventListener('submit', e => {
    e.preventDefault()
    fetch(scriptURL, { method: 'POST', body: new FormData(form)})
      .then(response => {
            msg.innerHTML="Message Sent Successfully"
            setTimeout(function(){
                msg.innerHTML="";
            },5000);
            form.reset();
      })
      .catch(error => console.error('Error!', error.message))
  })
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>