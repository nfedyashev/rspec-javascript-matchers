# encoding: UTF-8
require 'spec_helper'

require 'pry'

RSpec.describe 'be_valid_javascript' do
  context 'given valid javascript output' do
    let(:input) do
      <<~HEREDOC
        var sum=function sum (x,y) {
          return x+y
        };

        sum(1,1);
      HEREDOC
    end

    example do
      expect(input).to be_valid_javascript
    end
  end

  context 'given invalid javascript output' do
    let(:input) do
      <<~HEREDOC
        var sum=function sum (x,y) {
          return x+y
        };
        var foo = / 'bar'
      HEREDOC
    end

    example do
      expect(input).to be_valid_javascript, "failure mess"
    end
  end
end