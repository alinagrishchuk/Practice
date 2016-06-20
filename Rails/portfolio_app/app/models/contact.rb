class Contact <  MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true


  def headers
    {
      :to => "alina.grishchuk91@gmail.com",
      :subject => "Contact form",
      :from => %("#{name} <#{email}")
    }
  end
end