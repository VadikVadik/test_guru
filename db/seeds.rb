# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.find(1)

Badge.create(title: "Прохождение теста с первой попытки", file: "first-try.jpg")
Badge.create(title: "Прохождение всех тестов 1 уровня", file: "level-1.jpg", criteria: "1")
Badge.create(title: "Прохождение всех тестов 2 уровня", file: "level-2.jpg", criteria: "2")
Badge.create(title: "Прохождение всех тестов 3 уровня", file: "level-3.jpg", criteria: "3")
Badge.create(title: "Прохождение всех тестов из категории Кино", file: "all-movies.jpg", criteria: "Кино")
Badge.create(title: "Прохождение всех тестов из категории Сериалы", file: "all-series.jpg", criteria: "Сериалы")
Badge.create(title: "Прохождение всех тестов из категории Мультфильмы", file: "all-cartoons.jpg", criteria: "Мультфильмы")

category_movie = Category.create(title: "Кино")
category_series = Category.create(title: "Сериалы")
category_cartoons = Category.create(title: "Мультфильмы")

movie_test = admin.created_tests.create(title: "Крепкий орешек", category_id: category_movie.id, level: 1)
series_test = admin.created_tests.create(title: "Сыны Анархии", category_id: category_series.id, level: 1)
cartoon_test = admin.created_tests.create(title: "Рик и Морти", category_id: category_cartoons.id, level: 1)

movie_question = movie_test.questions.create(body: "Как звали главного героя?")
movie_question.answers.create([{body: "Джон Маклейн", correct: true},
                               {body: "Рик Санчес"},
                               {body: "Гарри Поттер"}])

movie_question_two = movie_test.questions.create(body: "В каком году вышла первая часть фильма?")
movie_question_two.answers.create([{body: "1988", correct: true},
                                   {body: "1990",},
                                   {body: "1993"}])

movie_question_three = movie_test.questions.create(body: "Где развернулись события второй части фильма?")
movie_question_three.answers.create([{body: "В аэропорту", correct: true},
                                     {body: "На вокзале"},
                                     {body: "В торговом центре"}])

series_question = series_test.questions.create(body: "Как звали главного героя сериала?")
series_question.answers.create([{body: "Джекс Теллер", correct: true},
                                {body: "Клэй Морроу"},
                                {body: "Тиг Треджер"}])

series_question_two = series_test.questions.create(body: "Создатель и режиссер сериала")
series_question_two.answers.create([{body: "Курт Саттер", correct: true},
                                    {body: "Рики Мартин"},
                                    {body: "Квентин Тарантино"}])

series_question_three = series_test.questions.create(body: "Кем были герои сериала?")
series_question_three.answers.create([{body: "Викинги"},
                                      {body: "Байкеры", correct: true},
                                      {body: "Военные"}])

cartoon_question = cartoon_test.questions.create(body: "Кем Рик приходится Морти?")
cartoon_question.answers.create([{body: "Дедом", correct: true},
                                 {body: "Отцом"},
                                 {body: "Дядей"}])

cartoon_question_two = cartoon_test.questions.create(body: "Изначально мультфильм был пародией на этот фильм")
cartoon_question_two.answers.create([{body: "Назад в будущее", correct: true},
                                     {body: "Бегущий по лезвию"},
                                     {body: "Вспомнить все"}])

cartoon_question_three = cartoon_test.questions.create(body: "Боевой овощ Рика")
cartoon_question_three.answers.create([{body: "Огурчик", correct: true},
                                       {body: "Помидорчик"},
                                       {body: "Бананчик"}])
