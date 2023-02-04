class AuthenticateUser
  include Interactor

  def call
    email, password = context.email, context.password
    user = User.find_by(email: email)
    context.fail!(error: 'Пользователь с таким email не найден') if user.blank?
    context.fail!(error: 'Неверный email или пароль') unless user&.authenticate(password)

    context.user_id = user.id
  end
end
