require 'spec_helper'

Dir[File.expand_path('../../../features/support/factories.rb', __FILE__)].each {|f| require f}

describe Question do
  describe "validations" do
    before(:each) do
      @attr = {
        :name => "rspec",
        :email => "rspec@refinery.com",
        :message => "test"
      }
    end

    it "rejects empty name" do
      Question.new(@attr.merge(:name => "")).should_not be_valid
    end

    it "rejects empty message" do
      Question.new(@attr.merge(:message => "")).should_not be_valid
    end

    it "rejects invalid email format" do
      ["", "@refinerycms.com", "refinery@cms", "refinery@cms.123"].each do |email|
        Question.new(@attr.merge(:email => email)).should_not be_valid
      end
    end
  end

  describe "default scope" do
    it "orders by created_at in desc" do
      question1 = Factory(:question, :created_at => 1.hour.ago)
      question2 = Factory(:question, :created_at => 2.hours.ago)
      questions = Question.all
      questions.first.should == question1
      questions.second.should == question2
    end
  end

  describe ".latest" do
    it "returns latest 7 non-spam questions by default" do
      8.times { Factory(:question) }
      Question.last.toggle!(:spam)
      Question.latest.length.should == 7
    end

    it "returns latest 7 questions including spam ones" do
      4.times { Factory(:question) }
      3.times { Factory(:question) }
      Question.all[0..2].each { |question| question.toggle!(:spam) }
      Question.latest(7, true).length.should == 7
    end

    it "returns latest n questions" do
      4.times { Factory(:question) }
      Question.latest(3).length.should == 3
    end
  end
end
