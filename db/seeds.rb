users = %w[Никита Алексей Дмитрий]

first_user = User.find_or_create_by(name: users.first, email: 'nikita_example@mail.ru', encrypted_password: BCrypt::Password.create('123'))
second_user = User.find_or_create_by(name: users.second, email: 'alex_example@mail.ru', encrypted_password: BCrypt::Password.create('123'))
third_user = User.find_or_create_by(name: users.third, email: 'dmitry_example@mail.ru', encrypted_password: BCrypt::Password.create('123'))

categories = [{
                ru: 'Языки программирования',
                en: 'Programming languages'
              }]

created_category = Category.find_or_create_by(name_ru: categories.first[:ru], name_en: categories.first[:en])

tests = ['Ruby']

first_created_test = Test.find_or_create_by(title_ru: tests.first, category_id: created_category.id,
                                            creator_id: first_user.id)

first_test_questions = [{
                          ru: 'Когда появился Ruby?',
                          en: 'When did Ruby appear?'
                        }, {
                          ru: 'Кто создатель Ruby?',
                          en: 'Who is the creator of Ruby?'
                        }]

first_test_question = Question.find_or_create_by(body_ru: first_test_questions.first[:ru], body_en: first_test_questions.first[:en], test_id: first_created_test.id)
second_test_question = Question.find_or_create_by(body_ru: first_test_questions.second[:ru], body_en: first_test_questions.second[:en] ,test_id: first_created_test.id)

first_question_answers = [ {
                             ru: '2003',
                           }, {
                             ru: 'хз',
                             en: 'Dont known'
                           },
                           {
                             ru: '2022'
                           },
                           {
                             ru: '1995'
                           }]
second_question_answers = [{
                             ru: 'Гвидо Ван Россум',
                             en: 'Guido Van Rossum'
                           }, {
                             ru: 'ВЕЛИКИЙ МАТЦ',
                             en: 'GREAT MATZ'
                           }, {
                             ru: 'Джеймс Гослинг',
                             en: 'James Gosling'
                           }, {
                             ru: 'Райан Гослинг',
                             en: 'Ryan Gosling'
                           }]

first_question_first_answer = Answer.find_or_create_by(body_ru: first_question_answers.first[:ru],
                                                       question_id: first_test_question.id)
first_question_second_answer = Answer.find_or_create_by(body_ru: first_question_answers.second[:ru],
                                                        body_en: first_question_answers.second[:en],
                                                        question_id: first_test_question.id)
first_question_third_answer = Answer.find_or_create_by(body_ru: first_question_answers.third[:ru],
                                                       question_id: first_test_question.id)
first_question_fourth_answer = Answer.find_or_create_by(body_ru: first_question_answers.fourth[:ru],
                                                        question_id: first_test_question.id, correct: true)

second_question_first_answer = Answer.find_or_create_by(body_ru: second_question_answers.first[:ru],
                                                        body_en: second_question_answers.first[:en],
                                                        question_id: second_test_question.id)
second_question_second_answer = Answer.find_or_create_by(body_ru: second_question_answers.second[:ru],
                                                         body_en: second_question_answers.second[:en],
                                                         question_id: second_test_question.id, correct: true)
second_question_third_answer = Answer.find_or_create_by(body_ru: second_question_answers.third[:ru],
                                                        body_en: second_question_answers.second[:en],
                                                        question_id: second_test_question.id)
second_question_fourth_answer = Answer.find_or_create_by(body_ru: second_question_answers.fourth[:ru],
                                                         body_en: second_question_answers.fourth[:en],
                                                         question_id: second_test_question.id)
