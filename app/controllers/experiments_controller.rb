class ExperimentsController < ApplicationController
  def new
    @exp = Experiment.new
  end

  def index
    @exp = Experiment.all
  end

  def show 
    @exp = Experiment.find(params[:id])
  end
  
  def create
    #render text: params[:post].inspect
     @exp = Experiment.new(params[:post].permit(:title, :description, :image, :source_code))
 
     if @exp.save
       redirect_to @exp
     else
       render :new
     end
  end

  def edit
    @exp = Experiment.find(params[:id])
  end

  def update
    @exp = Experiment.find(params[:id])

    if @exp.update(params[:post].permit(:title, :description, :image, :source_code))
      redirect_to @exp
    else
      render :edit
    end
  end

  def destroy
    @exp = Experiment.find(params[:id])
    @exp.destroy

    redirect_to experiments_path
  end

  private
    def post_params
      #img_name = params[:post][:image].original_filename
      params.require(:post).permit(:title, :description, :image, :source_code)
    end
end
