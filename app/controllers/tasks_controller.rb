class TasksController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy unfinished complete]
  def index
    @task = Task.new
    @room = Room.find(params[:room_id])
    # @tasks = @room.tasks.includes(:user)
    @q = @room.tasks.ransack(params[:q])
    @tasks = @q.result.includes(:user)
  end

  def create
    # binding.pry
    @room = Room.find(params[:room_id])
    @task = @room.tasks.new(task_params)
    if @task.save
      redirect_to room_tasks_path(@room.id)
    else
      @task = @room.tasks.includes(:user)
      render :index
    end
  end

  def show
    @owner = Owner.where(room_id: @room.id).first
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to room_tasks_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to room_tasks_path(@room.id)
  end

  def unfinished
    @task.update(is_completed: true)
    redirect_to room_tasks_path(@room.id)
  end

  def complete
    @task.update(is_completed: false)
    redirect_to room_tasks_path(@room.id)
  end

  def search
    @q = Task.ransack(params[:q])
    @tasks = @q.result
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :content, :start_time, :is_completed,
                                 :category_id).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
    @task = @room.tasks.find(params[:id])
  end
end
