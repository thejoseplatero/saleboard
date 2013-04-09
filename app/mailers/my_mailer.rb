class MyMailer < ActionMailer::Base
  default :from => "notifications@example.com"
  def comment_email(user, comment)
    @user = user
    @comment = comment
    mail(from: 'joseplatero@gmail.com', 
          to: user.email,
          subject: 'someone has posted a comment on your product')
  end
end

  