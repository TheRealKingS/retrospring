class Ajax::BlockController < ApplicationController
  def create
    params.require :screen_name

    target_user = User.find_by_screen_name(params[:screen_name])

    begin
      current_user.block target_user
    rescue
      @status = :fail
      @message = "You are already blocking that user."
      @success = false
      return
    end

    @status = :okay
    @message = "Successfully blocked user."
    @success = true
  end

  def destroy
    params.require :screen_name

    target_user = User.find_by_screen_name(params[:screen_name])

    begin
      current_user.unblock target_user
    rescue
      @status = :fail
      @message = "You are not blocking that user."
      @success = false
      return
    end

    @status = :okay
    @message = "Successfully unblocked user."
    @success = true
  end
end