# encoding: UTF-8
require 'sinatra'
require 'pry'
require 'padrino-mailer'
require File.expand_path("../models/formatter", __FILE__)

set :port, 8852

class ApplicationWithMail < Sinatra::Base
  config_file = File.expand_path('config/email.yml', File.dirname(__FILE__))
  ACCOUNT = 'yahoo'
  PASSWORD = YAML.load_file(config_file)[ACCOUNT]['password']
  FROM = YAML.load_file(config_file)[ACCOUNT]['from_email']
  SMTP_ADDRESS = YAML.load_file(config_file)[ACCOUNT]['smtp_address']
  TO = '2083666059@tmomail.net'

  set :delivery_method, :smtp => {
    :address              => SMTP_ADDRESS,
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

  successful_send = false
  100.times do |count|
    begin
      manual(new_subject, body)
      successful_send = true
      puts "Sent on #{count}th attempt"
      break
    rescue
      puts "Failed to send message with subject '#{new_subject}'"
    end
  end

  unless successful_send
    puts "UTTER FAILURE *************************************************************\n\n"
    puts 'now printing params from failure'
    puts params
    manual 'failure', "from #{original_from}"
  end
end

def manual(subject, body)
  body = Formatter.no_double_arrows(body.strip)
  body = body.slice(0,299)
  puts "Sending email with subject \"#{subject}\" and body \"#{body}\""
  ApplicationWithMail.email(:from => ApplicationWithMail::FROM,
                            :to => ApplicationWithMail::TO,
                            :subject => subject,
                            :body=>body)
end

