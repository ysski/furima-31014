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
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@を含まなければ登録出来ないこと' do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは半角英数混合で入力が必要なこと' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password need to be half-width alphanumeric mixed')
    end

    it "passwordが6文字以上でなければ登録できないこと" do
      @user.password = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "000000"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'hiragana_name_firstが空では登録できないこと' do
      @user.hiragana_name_first = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Hiragana name first can't be blank")
    end

    it 'hiragana_name_firstが全角（漢字・ひらがな・カタカナ）での入力が必要であること' do
      @user.hiragana_name_first = "yuuta"
      @user.valid?
      expect(@user.errors.full_messages).to include("Hiragana name first need to be full-width")
    end

    it 'hiragana_name_lastが空では登録できないこと' do
      @user.hiragana_name_last = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Hiragana name last can't be blank")
    end

    it 'hiragana_name_lastが全角（漢字・ひらがな・カタカナ）での入力が必要であること' do
      @user.hiragana_name_last = "sasaki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Hiragana name last need to be full-width")
    end

    
    it 'katakana_name_firstが空では登録できないこと' do
      @user.katakana_name_first = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name first can't be blank")
    end

    it 'katakana_name_firstが全角（カタカナ）での入力が必要であること' do
      @user.katakana_name_first = "理恵"
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name first need to be full-width kana")
    end

    it 'katakana_name_lastが空では登録できないこと' do
      @user.katakana_name_last = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name last can't be blank")
    end

    it 'katakana_name_lastが全角（カタカナ）での入力が必要であること' do
      @user.katakana_name_last = "白井"
      @user.valid?
      expect(@user.errors.full_messages).to include("Katakana name last need to be full-width kana")
    end

    it 'date_of_birth_idが空では登録できないこと' do
      @user.date_of_birth_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end
