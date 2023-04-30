class RoomsController < ApplicationController
  before_action :set_room, only: %i[edit show update destroy]

  def index
    @rooms = Room.includes(:user)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      Owner.create(name: current_user.nickname, user_id: current_user.id, room_id: @room.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @owner = Owner.where(room_id: @room.id).first
  end

  def edit; end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
