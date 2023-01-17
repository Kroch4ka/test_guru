first_user = User.find_or_create_by(name: 'Никита')
second_user = User.find_or_create_by(name: 'Алексей')
third_user = User.find_or_create_by(name: 'Дмитрий')

created_category = Category.find_or_create_by(name: 'Языки программирования')

first_created_test = Test.find_or_create_by(title: 'Ruby', category_id: created_category.id)
second_created_test = Test.find_or_create_by(title: 'JavaScript', category_id: created_category.id)

first_question = Question.find_or_create_by(body: 'Когда появился Ruby', test_id: created_test.id)
second_question = Question.find_or_create_by(body: 'К какому классу (функциональных, императивных, ООП) языков программирования относится Ruby', test_id: created_test.id)
third_question = Question.find_or_create_by(body: 'Кто создатель Ruby', test_id: created_test.id)
fourth_question = Question.find_or_create_by(body: 'Что такое замыкание?', test_id: second_created_test.id)

first_answer = Answer.find_or_create_by(body: '2021', question_id: first_question.id, user_id: first_user.id)
second_answer = Answer.find_or_create_by(body: 'ООП', question_id: second_question.id, user_id: second_user.id)
third_answer = Answer.find_or_create_by(body: 'Юкихиро Мацумото', question_id: third_user.id, user_id: third_user.id)