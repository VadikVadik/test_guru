# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Вадим")
Category.create(title: "Математика")
Test.create(title: "Таблица умножения", category_id: Category.first.id)
Question.create(body: "Сколько будет дважды два?", test_id: Test.first.id)
Answer.create([{body: "4", correct: true, question_id: Question.first.id},
               {body: "3", question_id: Question.first.id},
               {body: "5", question_id: Question.first.id}])
