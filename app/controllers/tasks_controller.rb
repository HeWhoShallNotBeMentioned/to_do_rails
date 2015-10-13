class TasksController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    redirect_to list_path(@task.list)
  end

 def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    render :edit
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task successfully updated!"
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    list_id = params[:list_id]
    flash[:notice] = "Task successfully deleted!"
    @task.destroy
    redirect_to list_path(list_id)
  end

private
  def task_params
    params.require(:task).permit(:description, :done)
  end
end
