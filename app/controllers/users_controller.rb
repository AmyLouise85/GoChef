class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
    @skills = Skill.all

    if params[:name] != '' && params[:name] != nil
      name = params[:name].downcase
      @users = User.where('lower(name) LIKE ?', "%#{name}%")
    end

    if params[:skills]
      output = []
      params[:skills][:ids][1..-1].each do |skill_id|
        skill = Skill.find(skill_id.to_i)
        @users.each do |user|
          if user.skills.include?(skill)
            output << user
          end
        end
        @users = output
      end
    end

    if params[:location] != '' && params[:location] != nil
      location = params[:location] << ', UK'
      output = []
      @users.each do |user|
        if user.distance_to(location).to_i <= user.distance_to_travel.to_i
          output << user
        end
      end
      @users = output
    end

    if request.xhr?
      render status: 200, json: {
            user: @users
      }.to_json
    end
  end

  def show
    @user = User.find(params[:id])
    @review = Review.new
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @photo = Photo.new
    else
      redirect_to '/'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if params[:user][:skill_ids] 
        params[:user][:skill_ids][1..-1].each do |skill|
          a = Skill.find(skill.to_i)
          if !@user.skills.include?(a)
            @user.skills << Skill.find(skill.to_i)
          end
        end
      end
      redirect_to :action => "show", :id => @user.id
    else
      p @user
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :bio, :location_lat, :location_lon, :avatar, :photos, :skills, :role, :distance_to_travel, :banner)
    end
end
