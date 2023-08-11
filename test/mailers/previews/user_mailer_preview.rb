# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def welcome_email(user)
	    @user = user #This is Params From User Controller
      UserMailer.welcome_email(User.new(name: 'Maurício Ackermann', email: 'eu@mauricioackermann.com.br'))
  end
end
