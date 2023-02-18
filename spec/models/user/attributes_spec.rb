require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build(:user)
  end

  describe 'general validations' do
    it 'not valid without require attributes' do
      expect(@user).to_not be_valid
    end

    it 'valid with require attributes' do
      @user.name = 'Nikita'
      @user.email = 'nekitgo80@gmail.com'
      @user.password = 123

      expect(@user).to be_valid
    end
  end

  describe 'name attribute validations' do
    it 'not valid without presence' do
      @user.email = 'nekitgo80@gmail.com'
      @user.password = 123

      expect(@user).to_not be_valid
      expect(@user.errors[:name].join).to match(/пуст|empt/)
    end

    it 'valid with presence' do
      @user.email = 'nekitgo80@gmail.com'
      @user.name = 'Никита'
      @user.password = 123

      expect(@user).to be_valid
    end
  end

  describe 'email attribute validations' do
    it 'not valid without presence' do
      @user.name = 'Никита'
      @user.password = 123

      expect(@user).to_not be_valid
      expect(@user.errors[:email].join).to match(/пуст|empt/)
    end

    it 'valid with presence' do
      @user.email = 'nekitgo80@gmail.com'
      @user.name = 'Никита'
      @user.password = 123

      expect(@user).to be_valid
    end

    it 'not valid because is not unique' do
      first_user = build(:user, name: 'Никита', email: 'nekitgo80@gmail.com')
      first_user.password = 123
      first_user.save

      second_user = build(:user, name: 'Никита', email: 'nekitgo80@gmail.com')
      second_user.password = 123

      expect(second_user).to_not be_valid
      expect(second_user.errors[:email].join).to match(/суще|exi/)
    end

    it 'valid because is unique' do
      first_user = build(:user, name: 'Никита', email: 'nekitgo80@gmail.com')
      first_user.password = 123
      first_user.save

      second_user = build(:user, name: 'Никита', email: 'nekitgo0280@gmail.com')
      second_user.password = 123

      expect(second_user).to be_valid
    end

    it 'not valid with wrong email format' do
      @user.email = 'ewq'
      @user.name = 'Nikita'
      @user.password = 123

      expect(@user).to_not be_valid
      expect(@user.errors[:email].join).to match(/знач|val/)
    end

    it 'valid with correct email format' do
      @user.email = 'nekitgo80@gmail.com'
      @user.name = 'nikita'
      @user.password = 123

      expect(@user).to be_valid
    end
  end

  describe 'encrypted_password attribute validation' do

    it 'not valid without presence' do
      @user.password = nil
      @user.email = 'nekitgo80@gmail.com'
      @user.name = 'nikita'

      expect(@user).to_not be_valid
      expect(@user.errors[:encrypted_password].join).to match(/пуст|empt/)
    end

    it 'valid with presence' do
      @user.name = 'nikita'
      @user.email = 'nekitgo80@gmail.com'
      @user.password = 123

      expect(@user).to be_valid
    end
  end
end
