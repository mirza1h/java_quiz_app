<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/login.css" />

    <title>Quiz App</title>
  </head>
  <body>
    <div class="container-fluid" align="center">
      <div class="container" id="quiz">
              <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/">
              <img src="./resources/quiz_icon.png" width="45" height="30" alt="">
            </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/quiz/admin/login">Login</a>
              </li>
            </ul>
          </div>
        </nav>
        <img src="../../resources/quiz_icon.png" alt="logo" width="200" >
        <h1 class="display-2">Quiz App</h1>
        <hr/>
        <div class="container" id="login" align="center">
          <form action="login" method="post">
            <h2 class="text-center display-4">Log in</h2>       
            <div class="form-group">
                <input id="username" name="username" type="text" class="form-control" placeholder="Username" required="required">
            </div>
            <div class="form-group">
              
                <input id="password" name="password" type="password" class="form-control" placeholder="Password" required="required">
            </div>
            <div class="form-group">
                <button type="submit" value="login" class="btn btn-primary btn-block">Log in</button>
            </div>       
          </form>
        </div>
      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>