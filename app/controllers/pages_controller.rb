class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @articles = Article.all
  end

  def contact
  end

  def about
  end
end
