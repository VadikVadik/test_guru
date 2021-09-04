# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jax = User.create(name: "Jax", email: "jax@mail.com")
clay = User.create(name: "Clay", email: "clay@mail.com")
bobby = User.create(name: "Bobby", email: "bobby@mail.com")
chibs = User.create(name: "Chibs", email: "chibs@mail.com")
opie = User.create(name: "Opie", email: "opie@mail.com")

category_movie = Category.create(title: "Movie")
category_series = Category.create(title: "TV Series")
category_cartoons = Category.create(title: "Cartoons")

movie_test = Test.create(title: "Die Hard", category_id: category_movie.id, level: 1, author_id: opie.id)
series_test = Test.create(title: "Sons of Anarchy", category_id: category_series.id, level: 2, author_id: jax.id)
cartoon_test = Test.create(title: "Rick and Morty", category_id: category_cartoons.id, level: 2, author_id: bobby.id)

movie_question = Question.create(body: "The name of the main character", test_id: movie_test.id)
Answer.create([{body: "John McClane", correct: true, question_id: movie_question.id},
               {body: "Rick Sanches", question_id: movie_question.id},
               {body: "Harry Potter", question_id: movie_question.id}])

movie_question_two = Question.create(body: "The year of release of the first part of the film", test_id: movie_test.id)
Answer.create([{body: "1988", correct: true, question_id: movie_question_two.id},
               {body: "1990", question_id: movie_question_two.id},
               {body: "1993", question_id: movie_question_two.id}])

movie_question_three = Question.create(body: "The location of the second part of the film", test_id: movie_test.id)
Answer.create([{body: "Airport", correct: true, question_id: movie_question_three.id},
               {body: "Railway station", question_id: movie_question_three.id},
               {body: "Port", question_id: movie_question_three.id}])

series_question = Question.create(body: "The name of the main character", test_id: series_test.id)
Answer.create([{body: "Jax Teller", correct: true, question_id: series_question.id},
               {body: "Clay Morroy", question_id: series_question.id},
               {body: "Tig Trager", question_id: series_question.id}])

series_question_two = Question.create(body: "Creator and director of the series", test_id: series_test.id)
Answer.create([{body: "Kurt Sutter", correct: true, question_id: series_question_two.id},
               {body: "Ricky Martin", question_id: series_question_two.id},
               {body: "Quentin Tarantino", question_id: series_question_two.id}])

series_question_three = Question.create(body: "Number of seasons of the series", test_id: series_test.id)
Answer.create([{body: "7", correct: true, question_id: series_question_three.id},
               {body: "9", question_id: series_question_three.id},
               {body: "5", question_id: series_question_three.id}])

cartoon_question = Question.create(body: "Who is Rick to Morty", test_id: cartoon_test.id)
Answer.create([{body: "Grandfather", correct: true, question_id: cartoon_question.id},
               {body: "Dad", question_id: cartoon_question.id},
               {body: "Uncle", question_id: cartoon_question.id}])

cartoon_question_two = Question.create(body: "The series was originally a parody of this film", test_id: cartoon_test.id)
Answer.create([{body: "Back to future", correct: true, question_id: cartoon_question_two.id},
               {body: "Blade Runner", question_id: cartoon_question_two.id},
               {body: "Total recall", question_id: cartoon_question_two.id}])

cartoon_question_three = Question.create(body: "Rick's favorite vegetable", test_id: cartoon_test.id)
Answer.create([{body: "Cucumber", correct: true, question_id: cartoon_question_three.id},
               {body: "Tomato", question_id: cartoon_question_three.id},
               {body: "Banana", question_id: cartoon_question_three.id}])
