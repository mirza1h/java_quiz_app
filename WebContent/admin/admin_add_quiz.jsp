<%@page import="roles.Role"%>
<%@page import="domain.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Admin - Create a new quiz</title>
    <meta name="description" content="Create a new quiz">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<a href="<%=request.getContextPath()%>/quiz/admin/login?logout=true" class="btn white black-text btn-flat right log-out-button">Log out</a>
	<a href="all_users" class="btn white black-text btn-flat right log-out-button">All users</a>
	<a href="add_user" class="btn white black-text btn-flat right log-out-button">Add user</a>
	<a href="all_quizzes" class="btn white black-text btn-flat right log-out-button">All quizzes</a>
	<a href="add_quiz" class="btn white black-text btn-flat right log-out-button">Add quiz</a>
	
    <div class="divider"></div>
    <div class="row container">
        <h3>Create a new quiz</h3>
        <form class="col s12" method="post">
            <div class="row">
                <div class="input-field col s12 ">
                    <input id="title" type="text" class="validate">
                    <label for="title">Title</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <textarea id="description" class="materialize-textarea"></textarea>
                    <label for="description">Description</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <input id="image_url" type="text" class="validate">
                    <label for="image_url">Image URL</label>
                </div>
            </div>

            <h4 id="questions-h4">Question list</h4>
            <ul id="questions">
                <li id="idQuestionList" class="questions-list-item">
                    <div class="divider questions-divider"></div>
                    <div>
                    	<Button id="idRemoveBtn" class="btn right red">X</Button>
                    </div>
                    <div class="row">
                        <div class="input-field col s9 ">
                            <input id="question1_text" type="text" class="validate" required>
                            <label for="question1_text">Question text</label>
                        </div>

                        <div class="input-field col s12 m4">
                            <input type="number" id="question1_time" class="validate" max="30" min="5" required>
                            <label for="question1_time">Time</label>
                        </div>
                        <div class="input-field col s2 ">
                            <input id="question1_points" type="number" class="validate" min="1" max="10" required>
                            <label for="question1_points">Points</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m4">
                            <input type="text" class="validate" required>
                            <label >Answer 1</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                        <div class="input-field col s12 m4">
                            <input type="text" class="validate">
                            <label>Answer 2</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                        <div class="input-field col s12 m4">
                            <input type="text" class="validate">
                            <label >Answer 3</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                        <div class="input-field col s12 m4">
                            <input type="text" class="validate">
                            <label >Answer 4</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                    </div>
                </li>
            </ul>

            <div>
                <a id="idAddQuestionBtn" class="btn">Add question</a>
                <a id="idSubmitBtn" class="btn waves-effect waves-light right">Save quiz</a>
            </div>
        </form>
    </div>
   	<span id="pathSpan" style="display:none"> <%=request.getContextPath()%> </span>
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script type="text/javascript" src="js/adm_add_quiz.js"></script>
</body>

</html>