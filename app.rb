require 'sinatra'
require 'pry'
require 'padrino-mailer'

set :port, 8852

class ApplicationWithMail < Sinatra::Base
  PASSWORD = YAML.load_file('config/email.yml')['password']
  TO = '2083666059@tmomail.net'
  FROM = 'loellingite@yahoo.com'

  set :delivery_method, :smtp => { 
    :address              => "smtp.mail.yahoo.com",
    :port                 => 587,
    :user_name            => FROM,
    :password             => PASSWORD,
    :authentication       => :plain,
    :enable_starttls_auto => true  
  }

  register Padrino::Mailer
end

post '/messages' do
  original_from = params['headers']['From']
  original_subject = params['headers']['Subject']
  new_subject = "From: #{original_from}"
  body = "#{original_subject} / "
  body += params['plain']
  ApplicationWithMail.email(:from => ApplicationWithMail::FROM, 
                            :to => ApplicationWithMail::TO, 
                            :subject => new_subject, 
                            :body=>body)
end

def manual(subject, body)
  ApplicationWithMail.email(:from => ApplicationWithMail::FROM, 
                            :to => ApplicationWithMail::TO, 
                            :subject => subject, 
                            :body=>body)
end

