class QuestionsController < ApplicationController

  before_filter :find_page, :only => [:create, :new]

  def thank_you
    @page = Page.find_by_link_url("/qa/thank_you", :include => [:parts, :slugs])
  end

  def new
    @question = Question.new
    @questions = Question.with_answers.paginate({:page => params[:page]})
  end

  def create
    @question = Question.new(params[:question])
    @questions = Question.with_answers.paginate({:page => params[:page]})

    if @question.save
      if @question.ham?
        begin
          QuestionMailer.notification(@question, request).deliver
        rescue
          logger.warn "There was an error delivering an question notification.\n#{$!}\n"
        end

        begin
          QuestionMailer.confirmation(@question, request).deliver
        rescue
          logger.warn "There was an error delivering an question confirmation:\n#{$!}\n"
        end
      end

      redirect_to thank_you_questions_url
    else
      render :action => 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

protected

  def find_page
    @page = Page.find_by_link_url('/qa', :include => [:parts, :slugs])
  end

end
