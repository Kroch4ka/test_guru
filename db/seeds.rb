users = %w[Никита Алексей Дмитрий]

first_user = User.find_or_create_by(name: users.first, email: 'nikita_example@mail.ru', encrypted_password: BCrypt::Password.create('123'))
second_user = User.find_or_create_by(name: users.second, email: 'alex_example@mail.ru', encrypted_password: BCrypt::Password.create('123'))
third_user = User.find_or_create_by(name: users.third, email: 'dmitry_example@mail.ru', encrypted_password: BCrypt::Password.create('123'))

categories = ['Языки программирования']

created_category = Category.find_or_create_by(name: categories.first)

tests = ['Ruby']

first_created_test = Test.find_or_create_by(title: tests.first, category_id: created_category.id,
                                            creator_id: first_user.id)

first_test_questions = ['Когда появился Ruby?', 'Кто создатель Ruby?']

first_test_question = Question.find_or_create_by(body: first_test_questions.first, test_id: first_created_test.id)
second_test_question = Question.find_or_create_by(body: first_test_questions.second, test_id: first_created_test.id)

first_question_answers = %w[2021 2003 хз 1995]
second_question_answers = ['Гвидо Ван Россум', 'ВЕЛИКИЙ МАТЦ', 'Джеймс Гослинг', 'Райан Гослинг']

first_question_first_answer = Answer.find_or_create_by(body: first_question_answers.first,
                                                       question_id: first_test_question.id)
first_question_second_answer = Answer.find_or_create_by(body: first_question_answers.second,
                                                        question_id: first_test_question.id)
first_question_third_answer = Answer.find_or_create_by(body: first_question_answers.third,
                                                       question_id: first_test_question.id)
first_question_fourth_answer = Answer.find_or_create_by(body: first_question_answers.fourth,
                                                        question_id: first_test_question.id, correct: true)

second_question_first_answer = Answer.find_or_create_by(body: second_question_answers.first,
                                                        question_id: second_test_question.id)
second_question_second_answer = Answer.find_or_create_by(body: second_question_answers.second,
                                                         question_id: second_test_question.id, correct: true)
second_question_third_answer = Answer.find_or_create_by(body: second_question_answers.third,
                                                        question_id: second_test_question.id)
second_question_fourth_answer = Answer.find_or_create_by(body: second_question_answers.fourth,
                                                         question_id: second_test_question.id)
