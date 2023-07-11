class PrefecturesController < ApplicationController
  def index
    @q = Prefecture.ransack
    @prefectures = @q.result(distinct: true)
  end

  def search
    @q = Hoge.ransack(search_params)
    @prefectures = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
