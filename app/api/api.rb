# '[R] resource_name path - description' - resource
# '[E] http_method path - description' - endpoint

class Api < Grape::API

  format :json

  # [R] Zombies /zombies
  resource :zombies do

    # [E] GET /zombies - return zombies
    get do
      Zombie.all ||= nil
      #"fuck"s
    end

    # [E] POST /zombies - create zombie
    post do
      Zombie.new(params).save!
    end

    route_param :id do

      params do
        requires :id, type: Integer
      end

      # [E] GET /zombies/:id - return zombie
      get do
        Zombie.find(params[:id])
      end

      # [E] PUT /zombies/:id - update zombie
      put do
        Zombie.find(params[:id]).update!(params)
      end

      # [E] DELETE /zombies/:id - delete zombie
      delete do
        Zombie.find(params[:id]).delete
      end

    end

  end

end