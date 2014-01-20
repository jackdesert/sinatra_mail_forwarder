# encoding: UTF-8
require 'spec_helper'
require 'rack/test'
require_relative '../../app'

class ApplicationWithMail < Sinatra::Base;end

def valid_params
  { plain: "some fäncy inpüts",
    headers: { Subject: 'söme subject',
               From: 'Julia Chḯld <child@child.net>'}
  }
end

describe 'the controller' do
  let(:browser) { Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application)) }
  it 'returns 200' do
    mock(ApplicationWithMail).email(from: ApplicationWithMail::FROM, 
                                    to: ApplicationWithMail::TO, 
                                    :subject=>"From: Julia Chḯld <child@child.net>", 
                                    body: "söme subject / some fäncy inpüts")
    browser.post '/messages', valid_params
  end
end
