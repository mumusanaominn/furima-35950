require 'rails_helper'

RSpec.describe User, type: :model do
  describe '会員情報入力' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'last_nameが全角日本語でないと保存できないこと' do
        @user.last_name = 'susunoki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameis invalid. Input full-width characters.')
      end
      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'susunoki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameis invalid. Input full-width characters.')
      end
      it 'kata_nameが全角カタカナでないと保存できないこと' do
        @user.kata_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kata nameis invalid. Input full-width katakana characters.')
      end
      it 'kana_nameが全角カタカナでないと保存できないこと' do
        @user.kana_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana nameis invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
      it 'emailが空では保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では保存できないこと' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードis invalid. Input half-width characters.")
      end
      it '重複したemailが存在する場合保存できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが半角英数混合でないと保存できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードis invalid. Input half-width characters.')
      end
      it 'last_nameが空では保存できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last nameを入力してください", "Last nameis invalid. Input full-width characters.")
      end
      it 'first_nameが空では保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください", "First nameis invalid. Input full-width characters.")
      end
      it 'kata_nameが空では保存できないこと' do
        @user.kata_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kata nameを入力してください", "Kata nameis invalid. Input full-width katakana characters.")
      end
      it 'kana_nameが空では保存できないこと' do
        @user.kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana nameを入力してください", "Kana nameis invalid. Input full-width katakana characters.")
      end
      it 'passwordが5文字以下では保存できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードis invalid. Input half-width characters.")
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードis invalid. Input half-width characters.')
      end
      it 'passwordが存在してもpassword_confirmationが空では保存できない' do
        @user.password = '000000aaaa'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'birthdayが英数字でないと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
      it 'passwordが数字だけでは保存できないこと' do
        @user.password = '0000000000'
        @user.password_confirmation = '0000000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードis invalid. Input half-width characters.')
      end
      it 'passwordが英字だけでは保存できないこと' do
        @user.password = 'aaaaaaaaa'
        @user.password_confirmation = 'aaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードis invalid. Input half-width characters.')
      end
      it 'passwordが全角文字が含まれている場合は保存できないこと' do
        @user.password = '111あああ'
        @user.password_confirmation = '111あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードis invalid. Input half-width characters.')
      end
      it 'メールアドレスに@がないと保存できないこと' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
    end
  end
end
