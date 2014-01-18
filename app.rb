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
  body = "(from #{original_from})\n"
  body += params['plain']
  subject = params['headers']['Subject']
  ApplicationWithMail.email(:from => ApplicationWithMail::FROM, 
                            :to => ApplicationWithMail::TO, 
                            :subject => subject, 
                            :body=>body)
end

def manual(subject, body)
  ApplicationWithMail.email(:from => ApplicationWithMail::FROM, 
                            :to => ApplicationWithMail::TO, 
                            :subject => subject, 
                            :body=>body)
end

