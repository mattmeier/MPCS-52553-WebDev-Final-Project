class HistoriesController < ApplicationController

  def destroy
    cookies.delete('user_ids')
    redirect_to root_url, notice: "Your history is history!"
  end

end