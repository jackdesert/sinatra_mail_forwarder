require 'sinatra'
require 'pry'
require 'padrino-mailer'

set :port, 8852

class ApplicationWithMail < Sinatra::Base
  PASSWORD = `cat config/password`

  set :delivery_method, :smtp => { 
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => 'jackdesert@gmail.com',
    :password             => PASSWORD,
    :authentication       => :plain,
    :enable_starttls_auto => true  
  }

  register Padrino::Mailer
end

post '/messages' do
  body = params['plain']
  from = params['headers']['To']
  to = '2083666059@tmomail.net'
  subject = params['headers']['Subject']
  ApplicationWithMail.email(:from => from, :to => to, :subject => subject, :body=>body)
end
