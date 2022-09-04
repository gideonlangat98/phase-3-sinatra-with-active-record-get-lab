class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    # "Hello World"
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order("price DESC" )
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.all.order("price DESC").first
    baked_good.to_json
  end
end
