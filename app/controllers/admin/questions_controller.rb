class Admin::QuestionsController < Admin::BaseController

  crudify :question, :title_attribute => "name", :order => "created_at DESC"
  helper_method :group_by_date

  before_filter :find_all_ham, :only => [:index]
  before_filter :find_all_spam, :only => [:spam]
  before_filter :get_spam_count, :only => [:index, :spam]

  def index
    @questions = @questions.with_query(params[:search]) if searching?
    @questions = @questions.paginate({:page => params[:page]})
  end

  def spam
    self.index
    render :action => 'index'
  end

  def toggle_spam
    find_question
    @question.toggle!(:spam)

    redirect_to :back
  end

  def add_answer
    find_question
    @question.answer = params[:question][:answer]
    @question.save
    render :action => 'show'
  end
protected

  def find_all_ham
    @questions = Question.ham
  end

  def find_all_spam
    @questions = Question.spam
  end

  def get_spam_count
    @spam_count = Question.count(:conditions => {:spam => true})
  end

end
