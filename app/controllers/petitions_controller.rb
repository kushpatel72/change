class PetitionsController < ApplicationController
  def new
    @petition = current_user.petitions.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end
end
