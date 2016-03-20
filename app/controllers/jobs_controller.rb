class JobsController < ApplicationController
  def index
    @jobs = Job.page(params[:page]).per(25)
    if params[:search]
      @jobs = Job.search(params[:search]).order("created_at DESC")
    else
      @jobs = Job.all.order('created_at DESC')
    end
  end

  def new
    @job = Job.new    # @job means send the new job to HTML to we can use it. Job.new means created a new instance of Job model.

  end

  def create
    @job = Job.new(params.require(:job).permit(:title, :company, :url, :details))
    
    if @job.save
      redirect_to root_path
    else
      render "new"
    end
  end

end
