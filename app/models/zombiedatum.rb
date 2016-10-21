class Zombiedatum < ApplicationRecord

  validates :name, :age, :weight, :status, presence: true

  URL = 'http://localhost:3000/api/zombies/'
  STATUS = ['Inactive','Active','Cured']

  def self.data_migration
    data =  api_communication
    data.each do |element|
      if !Zombiedatum.exists?(element['id'])
        @zombiedatum = Zombiedatum.create(:id=>element['id'],:name => element['name'],:age=>element['age'],:weight=>element['weight'],:status=>element['status'])
        @zombiedatum.save!
      end
    end
  end

  def self.api_communication
    response= RestClient::Request.execute(method: :get, url: URL)
    response = response.body
    response = JSON.parse(response)
  end

end
