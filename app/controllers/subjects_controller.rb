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
    #Instantiate a new object using form parameters 
    @subject = Subject.new(subject_params)
    #update the objectnew
    if @subject.save
      #if save succeeds, redirect to the show action
      flash[:notice] = "Subject Successfully created"
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
    @subject = Subject.find(params[:id])
    #update the object
    if @subject.update_attributes(subject_params)
      #if save succeeds, redirect to the index action
      flash[:notice] = "Subject Successfully updated"
      redirect_to(subject_path(@subject))
    else
      #if save fails, redisplay the form so user can fix problems
      render('edit')
    end  
  end 


  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' Successfully destroyed"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name,:position, :visible)
  end 
end
