<%@page import="roles.Role"%>
<%@page import="domain.Player"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="utf-8">

    <title>Admin - Create new quiz</title>
    <meta name="description" content="Admin - Create new quiz">



    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="style.css">


    <style>

        .color-option {
            margin-right: 10px;
            margin-top: 20px;
        }

        .color-option-button {
            pointer-events: none;
            margin-left: 10px;
        }

        #questions-h4 {
            margin: 70px 0 40px 0;
        }

        .questions-list-item {
            margin: 50px 0px;
        }

        .questions-divider {
            margin-bottom: 15px;
        }

        .questions-close-button {
            cursor: pointer;
        }
    </style>


</head>

<body>
	<a href="/rwa-z2-mirza-hasanovic/quiz/admin/login?logout=true" class="btn white black-text btn-flat right log-out-button">Log out</a>
	<a href="all_users" class="btn white black-text btn-flat right log-out-button">All users</a>
	<a href="add_user" class="btn white black-text btn-flat right log-out-button">Add user</a>
	<a href="all_quizzes" class="btn white black-text btn-flat right log-out-button">All quizzes</a>
	<a href="add_quiz" class="btn white black-text btn-flat right log-out-button">Add quiz</a>
	
    <div class="divider"></div>

    <div class="row container">
        <h3>Create new quiz</h3>
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

            <p>
                <label>
                    <input type="checkbox" id="is_active_checkbox" />
                    <span>Is active</span>
                </label>
            </p>

            <h4 id="questions-h4">Questions</h4>
            <i class="material-icons left">info</i>
            <span>You can change the order of questions by drag and drop</span>
            <ul id="questions">
                <li class="questions-list-item">
                    <div class="divider questions-divider"></div>
                    <div>
                        <a onclick="deleteListItem(this)"><i
                                class="material-icons right questions-close-button">close</i></a>
                        <i class="material-icons right">swap_vert</i>
                    </div>
                    <div class="row">
                        <div class="input-field col s9 ">

                            <input id="question1_text" type="text" class="validate" required>
                            <label for="question1_text">Question text</label>

                        </div>

                        <div class="input-field col s2 ">

                            <input id="question1_points" type="number" class="validate" min="0" required>
                            <label for="question1_points">Points</label>

                        </div>
                        <div class="input-field col s12 m4">
                            <input type="number" id="question1_time" class="validate" max="60" min="1" required>
                            <label for="question1_time">Time</label>
                        </div>
                        <div class="input-field col s12 m4">
                            <input id="question1_answer1" type="text" class="validate" required>
                            <label for="question1_answer1">Answer 1</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                        <div class="input-field col s12 m4">
                            <input id="question1_answer2" type="text" class="validate">
                            <label for="question1_answer2">Answer 2</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                        <div class="input-field col s12 m4">
                            <input id="question1_answer3" type="text" class="validate">
                            <label for="question1_answer3">Answer 3</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                        <div class="input-field col s12 m4">
                            <input id="question1_answer4" type="text" class="validate">
                            <label for="question1_answer4">Answer 4</label>
                            <span class="right">
                                <label>
                                    <input type="checkbox" />
                                    <span>Correct</span>
                                </label>
                            </span>
                        </div>
                        <div class="input-field col s12 m4">
                            <input id="question1_answer5" type="text" class="validate">
                            <label for="question1_answer5">Answer 5</label>
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
                <a class="btn" onclick="addListItem()"><i class="material-icons right">add</i>Add question</a>

                <!-- <button class="btn waves-effect waves-light right" type="submit" name="action" value="save">Save
                    <i class="material-icons right">save</i>
                </button> -->
                <a class="btn waves-effect waves-light right" onclick="submit()">Save
                    <i class="material-icons right">save</i>
                </a>
            </div>
        </form>
    </div>



    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


    <!-- Material dialog-->
    <script src="material-dialog/material-dialog.min.js" type="text/javascript"></script>



    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });

        $(function () {
            $("#questions").sortable();
            $("#questions").disableSelection();
        });

        function addListItem() {
            var random = Math.random();
            $('#questions').append(
                '<li class="questions-list-item"> <div class="divider questions-divider"></div> <div> <a onclick="deleteListItem(this)"><i class="material-icons right questions-close-button">close</i></a> <i class="material-icons right">swap_vert</i> </div> <div class="row"> <div class="input-field col s9 "> <input id="question'
                + random + '_text" type="text" class="validate"> <label for="question'
                + random + '_text">Question text</label> </div> <div class="input-field col s2 "> <input id="question'
                + random + '_points" type="number" class="validate" min="0"> <label for="question'
                + random + '_points">Points</label> </div> <div class="input-field col s12 m4"> <input type="number" id="question'
                + random + '_time" class="validate" max="60" min="1"> <label for="question'
                + random + '_time">Time</label> </div> <div class="input-field col s12 m4"> <input id="question'
                + random + '_answer1" type="text" class="validate"> <label for="question'
                + random + '_answer1">Answer 1</label> <span class="right"> <label> <input type="checkbox" /> <span>Correct</span> </label> </span> </div> <div class="input-field col s12 m4"> <input id="question'
                + random + '_answer2" type="text" class="validate"> <label for="question'
                + random + '_answer2">Answer 2</label> <span class="right"> <label> <input type="checkbox" /> <span>Correct</span> </label> </span> </div> <div class="input-field col s12 m4"> <input id="question'
                + random + '_answer3" type="text" class="validate"> <label for="question'
                + random + '_answer3">Answer 3</label> <span class="right"> <label> <input type="checkbox" /> <span>Correct</span> </label> </span> </div> <div class="input-field col s12 m4"> <input id="question'
                + random + '_answer4" type="text" class="validate"> <label for="question'
                + random + '_answer4">Answer 4</label> <span class="right"> <label> <input type="checkbox" /> <span>Correct</span> </label> </span> </div> <div class="input-field col s12 m4"> <input id="question'
                + random + '_answer5" type="text" class="validate"> <label for="question'
                + random + '_answer5">Answer 5</label> <span class="right"> <label> <input type="checkbox" /> <span>Correct</span> </label> </span> </div> </div> </li> '
            );
        }

        function deleteListItem(closeButton) {
            closeButton.parentElement.parentElement.remove();
        }


        function getListItemInfo() {
        }

        function submit() {
            var quiz = {};
            quiz.title = $("#title").val();
            quiz.description = $("#description").val();
            quiz.imageUrl = $("#image_url").val();
            quiz.active = $("#is_active_checkbox").is(":checked");

            quiz.questions = getQuestions();

            if (quiz.title == "" || quiz.description == "" || quiz.imageUrl == "" || quiz.questions.length == 0 
                || quiz.questions == null || quiz.questions[0] == null) {
                console.log(false);
                return;
            }

            console.log("str" + JSON.stringify(quiz));
            $.ajax({
                url: 'add_quiz',  
                type: 'POST',    
                data: {'quiz':JSON.stringify(quiz)},
                success: function(result) {
                     window.location.href = "/rwa-z2-mirza-hasanovic/admin/all_quizzes";
                }
            });

        }

        function getQuestions() {
            var questions = [];

            $('#questions li').each(function (index) {
                questions.push(getQuestionInfo(this));
            });

            if (questions === undefined || questions.length == 0) {
                return null;
            }

            for (var q in questions) {
                if (q == null) {
                    questions.remove(q);
                }
            }

            for (var i = 0; i<questions.length; i++) {
                if (questions[i] === null) questions.splice(i, 1);
            }

            return questions;
        }

        function getQuestionInfo(question) {
            var questionToReturn = {};

            var questionItems = $(question).children();
            var questionFields = questionItems[2];
            var questionText = $($(questionFields).children()[0]).children()[0];
            var questionPoints = $($(questionFields).children()[1]).children()[0];
            var questionTime = $($(questionFields).children()[2]).children()[0];

            var questionAnswer1 = $($(questionFields).children()[3]).children()[0];
            var questionAnswer1Checkbox = $($($($(questionFields).children()[3]).children()[2]).children()[0]).children()[0];

            var questionAnswer2 = $($(questionFields).children()[4]).children()[0];
            var questionAnswer2Checkbox = $($($($(questionFields).children()[4]).children()[2]).children()[0]).children()[0];

            var questionAnswer3 = $($(questionFields).children()[5]).children()[0];
            var questionAnswer3Checkbox = $($($($(questionFields).children()[5]).children()[2]).children()[0]).children()[0];

            var questionAnswer4 = $($(questionFields).children()[6]).children()[0];
            var questionAnswer4Checkbox = $($($($(questionFields).children()[6]).children()[2]).children()[0]).children()[0];

            var questionAnswer5 = $($(questionFields).children()[7]).children()[0];
            var questionAnswer5Checkbox = $($($($(questionFields).children()[7]).children()[2]).children()[0]).children()[0];


            questionToReturn.text = $(questionText).val();
            questionToReturn.points = $(questionPoints).val();
            questionToReturn.time = $(questionTime).val();

            questionToReturn.answer1 = $(questionAnswer1).val();
            questionToReturn.answer1Correct = $(questionAnswer1Checkbox).is(":checked");

            questionToReturn.answer2 = $(questionAnswer2).val();
            questionToReturn.answer2Correct = $(questionAnswer2Checkbox).is(":checked");

            questionToReturn.answer3 = $(questionAnswer3).val();
            questionToReturn.answer3Correct = $(questionAnswer3Checkbox).is(":checked");

            questionToReturn.answer4 = $(questionAnswer4).val();
            questionToReturn.answer4Correct = $(questionAnswer4Checkbox).is(":checked");

            questionToReturn.answer5 = $(questionAnswer5).val();
            questionToReturn.answer5Correct = $(questionAnswer5Checkbox).is(":checked");

            questionToReturn.answers = [];

            var answer1 = {};
            answer1.text = $(questionAnswer1).val();
            answer1.isCorrect = $(questionAnswer1Checkbox).is(":checked");
            questionToReturn.answers.push(answer1);
            
            var answer2 = {};
            answer2.text = $(questionAnswer2).val();
            answer2.isCorrect = $(questionAnswer2Checkbox).is(":checked");
            questionToReturn.answers.push(answer2);
            
            var answer3 = {};
            answer3.text = $(questionAnswer3).val();
            answer3.isCorrect = $(questionAnswer3Checkbox).is(":checked");
            questionToReturn.answers.push(answer3);
            
            var answer4 = {};
            answer4.text = $(questionAnswer4).val();
            answer4.isCorrect = $(questionAnswer4Checkbox).is(":checked");
            questionToReturn.answers.push(answer4);
            
            var answer5 = {};
            answer5.text = $(questionAnswer5).val();
            answer5.isCorrect = $(questionAnswer5Checkbox).is(":checked");
            questionToReturn.answers.push(answer5);

            if (questionToReturn.text == "" || questionToReturn.points == 0 || questionToReturn.time == 0) {
                return null;
            }

            if (!(questionToReturn.answer1Correct || questionToReturn.answer2Correct || questionToReturn.answer3Correct
                || questionToReturn.answer4Correct || questionToReturn.answer5Correct)) {
                return null;
            }


            // atleast one answer has to be correct one
            if ((questionToReturn.answer1 == "" || questionToReturn.answer1Correct == false) &&
                (questionToReturn.answer2 == "" || questionToReturn.answer2Correct == false) &&
                (questionToReturn.answer3 == "" || questionToReturn.answer3Correct == false) &&
                (questionToReturn.answer4 == "" || questionToReturn.answer4Correct == false) &&
                (questionToReturn.answer5 == "" || questionToReturn.answer5Correct == false)) {
                return null;
            }

            return questionToReturn;
        }

    </script>

</body>

</html>