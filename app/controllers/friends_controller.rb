class FriendsController < ApplicationController
    before_action :authenticate_user!
    def index
        @friends = Friend.where('user_id=?',current_user.id)
    end

    def new
        @friend = Friend.new
    end

    def create
        @friend = Friend.new(friend_params)
        @friend.user_id = current_user.id

        if @friend.save
            redirect_to friends_path, :notice => "New friend #{@friend.first_name} has been saved!"
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(current_user.id)
        @friend = @user.friends.find(params[:id])
    end

    def update
        @user = User.find(current_user.id)
        @friend = @user.friends.find(params[:id])

        if @friend.update_attributes(friend_params)
            redirect_to friends_path, :notice => 'Your friend was updated successfully!'
        else
            render 'edit'
        end
    end

    def show
        @user = User.find(current_user.id)
        @friend = @user.friends.find(params[:id])
    end

    def destroy
        @friend = Friend.find(params[:id])
        if @friend.destroy
            redirect_to friends_path, :notice => 'Your friend was removed successfully'
        end
    end

    private

    def friend_params
        params.require(:friend).permit(:first_name, :last_name, :user_id,:email, :address, :contact)
    end
end
