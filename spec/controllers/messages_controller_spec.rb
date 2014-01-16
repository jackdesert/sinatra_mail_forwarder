require 'spec_helper'
require 'rack/test'
require_relative '../../app'

class ApplicationWithMail < Sinatra::Base;end

def valid_params
  { plain: 'some text',
    headers: { Subject: 'some subject',
               To: 'Julia Child <child@child.net>'}
  }
end

describe 'the controller' do
  let(:browser) { Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application)) }
  it 'returns 200' do
    mock(ApplicationWithMail).email(:from=>"Julia Child <child@child.net>", 
                                    :to=>"2083666059@tmomail.net", 
                                    :subject=>"some subject", 
                                    :body=>"some text")
    browser.post '/messages', valid_params
  end
end
