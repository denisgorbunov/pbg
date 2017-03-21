class SorceryMailer < ApplicationMailer
  default from: "pbg@nodomain.me"

  def reset_password(user_id)
    @user = user_id
    mail(to: @user.email, subject: 'PBG - Reset Password')
  end


end
