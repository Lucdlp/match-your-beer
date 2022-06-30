class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @beers = Beer.all
    @recipes = Recipe.all

    @random_beer = Beer.all.sample
    @tag = @random_beer.tag_list.sample
    @recipe = Recipe.tagged_with(@tag, any: true).sample
  end
end
