class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end

  def create 
    #Find an object using form parameters 
    @subject = Subject.find(params[:id])
    #update the object
    if @subject.update_attributes(subject_params)
      #if save succeeds, redirect to the show action
      redirect_to(subjects_path)
    else
      #if save fails, redisplay the form so user can fix problems
      render('new')
    end 
  end 

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #Instantiate a new object using form parameters 
    @subject = Subject.new(subject_params)
    #update the object
    if @subject.save
      #if save succeeds, redirect to the index action
      redirect_to(subject_path(@subject))
    else
      #if save fails, redisplay the form so user can fix problems
      render('edit')
    end  
  end 


  def delete
  end

  def destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:name,:position, :visible)
  end 
end
