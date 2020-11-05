require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、password、password_confirmation、hiragana_name_first、hiragana_name_last、katakana_name_first、katakana_name_last、date_of_birth_idが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      user = FactoryBot.build(:user)
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      user = FactoryBot.build(:user)
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@を含まなければ登録出来ないこと' do
      user = FactoryBot.build(:user)
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it 'passwordが空では登録できないこと' do
      user = FactoryBot.build(:user)
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは半角英数混合で入力が必要なこと' do
      user = FactoryBot.build(:user)
      @user.password = nil
      
      @user.valid?
      expect(@user.errors.full_messages).to include('Password need to be half-width alphanumeric mixed')
    end

    it "passwordが6文字以上でなければ登録できること" do
      user = FactoryBot.build(:user)
      @user.password_confirmation = nil
      expect(@user).to be_valid
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      user = FactoryBot.build(:user)
      @user.password = 000000
      @user.password_confirmation = 111111
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'hiragana_name_firstが全角（漢字・ひらがな・カタカナ）での入力が必要であること' do
      user = FactoryBot.build(:user)
      @user.hiragana_name_first = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Hiragana name first can't be blank")
    end

    it 'hiragana_name_lastが全角（漢字・ひらがな・カタカナ）での入力が必要であること' do
      user = FactoryBot.build(:user)
      @user.hiragana_name_last = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Hiragana name last can't be blank")
    end

    it 'katakana_name_firstが全角（カタカナ）での入力が必要であること' do
      user = FactoryBot.build(:user)
      @user.katakana_name_first = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name first can't be blank")
    end

    it 'katakana_name_lastが全角（カタカナ）での入力が必要であること' do
      user = FactoryBot.build(:user)
      @user.katakana_name_last = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name last can't be blank")
    end

    it 'date_of_birth_idが空では登録できないこと' do
      user = FactoryBot.build(:user)
      @user.date_of_birth_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end
