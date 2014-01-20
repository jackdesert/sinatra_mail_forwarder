# encoding: UTF-8
require 'sinatra'
require 'pry'
require 'padrino-mailer'

set :port, 8852

class ApplicationWithMail < Sinatra::Base
  config_file = File.expand_path('config/email.yml', File.dirname(__FILE__))
  PASSWORD = YAML.load_file(config_file)['password']
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
  manual(new_subject, body)
end

def manual(subject, body)
  puts "Sending email with subject \"#{subject}\" and body \"#{body}\""
  ApplicationWithMail.email(:from => ApplicationWithMail::FROM, 
                            :to => ApplicationWithMail::TO, 
                            :subject => subject, 
                            :body=>body)
                            #:charset => 'UTF-8')
end

