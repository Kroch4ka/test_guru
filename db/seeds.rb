names = [
  'Никита',
  'Алексей',
  'Дмитрий'
]

categories = [
  {
    name: 'Языки программирования',
    tests: [
      {
        title: 'Ruby',
        questions: [
          {
            body: 'Когда появился Ruby',
            answers: [
              {
                body: '2021'
              }
            ],
          },
          {
            body: 'К какому классу (функциональных, императивных, ООП) языков программирования относится Ruby',
            answers: [
              {
                body: 'ООП'
              }
            ],
          },
          {
            body: 'Кто создатель Ruby',
            answers: [
              {
                body: 'Юкихиро Мацумото'
              }
            ]
          }
        ]
      }
    ]
  }
]

names.each do |name|
  User.find_or_create_by(name: name)
end

categories.each do |category|
  created_category = Category.find_or_create_by(name: category[:name])
  category[:tests].each do |test|
    created_test = Test.find_or_create_by(title: test[:title], category_id: created_category.id)
    test[:questions].each do |question|
      created_question = Question.find_or_create_by(body: question[:body], test_id: created_test.id)
      question[:answers].each do |answer|
        answered_user = User.first
        created_answer = Answer.find_or_create_by(body: answer[:body], question_id: created_question.id, user_id: answered_user.id)
      end
    end
  end
end