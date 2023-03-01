Category.destroy_all
User.destroy_all

user_attrs = {
  default: {
    name: Faker::Name.name,
    email: FakerWrapper.email,
    password: '12345'
  },
  admin: {
    name: Faker::Name.name,
    email: FakerWrapper.email,
    password: '678910'
  }
}

admin = FactoryBot.create(:admin, user_attrs[:default])
user = FactoryBot.create(:user, user_attrs[:admin])

questions = [
  {
    body: 'Национальное блюдо Франции',
    answers: [
      {
        body: 'Эскарго',
        correct: true
      },
      {
        body: 'Энчилада',
        correct: false
      },
      {
        body: 'Борщ',
        correct: false
      }
    ]
  },
  {
    body: 'Национальное блюдо России',
    answers: [
      {
        body: 'Щи',
        correct: true
      },
      {
        body: 'Пицца',
        correct: false
      },
      {
        body: 'Окрошка',
        correct: true
      }
    ]
  },
]

def generate_answers(question, answers)
  answers.each do |answer|
    FactoryBot.create(:answer, question: question, body: answer[:body], correct: answer[:correct])
  end
end

def generate_questions(test, questions)
  questions.each do |question|
    FactoryBot.create(:question, body: question[:body], test: test) do |created_question|
      generate_answers(created_question, question[:answers])
    end
  end
end

FactoryBot.create(:category) do |category|
  FactoryBot.create(:test, creator: admin, category: category) do |test|
    generate_questions(test, questions)
  end
end