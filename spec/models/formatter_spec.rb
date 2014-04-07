require 'spec_helper'

describe Formatter do
  describe 'no_double_arrow' do
    subject { described_class.no_double_arrows(input) }
    context 'normal text' do
      let(:input) { "Hi, Johnny\nHow are you?" }
      it { should == input }
    end

    context 'single arrow' do
      let(:input) { "Pancakes\n>What's for breakfast?\n--Johnny" }
      it { should == input }
    end

    context 'double arrow' do
      let(:input) { ">> Something\n>>For Nothing" }
      it { should == '' }
    end

    context 'mixed input' do
      let(:input) { "Real Text\n> Single Arrow\n>> Double Arrow\n>>> Triple Arrow\n\nMore Real Text" }
      it { should == "Real Text\n> Single Arrow\n\nMore Real Text" }
    end
  end
end
