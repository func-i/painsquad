class ChoicesController < ApplicationController
  skip_before_action :restrict_access
  before_action :set_choice, only: [:edit, :update]

  def edit
  end

  def update
    if @choice.update(choice_params)
      redirect_to @choice.question, notice: "Choice: '#{@choice.content}' was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:content, :value)
  end

end
