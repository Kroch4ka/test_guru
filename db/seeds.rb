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
        valid: true
      },
      {
        body: 'Энчилада',
        valid: false
      },
      {
        body: 'Борщ',
        valid: false
      }
    ]
  },
  {
    body: 'Национальное блюдо России',
    answers: [
      {
        body: 'Щи',
        valid: true
      },
      {
        body: 'Пицца',
        valid: false
      },
      {
        body: 'Окрошка',
        valid: true
      }
    ]
  },
]

def generate_answers(question, answers)
  answers.each do |answer|
    FactoryBot.create(:answer, question: question, body: answer[:body])
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