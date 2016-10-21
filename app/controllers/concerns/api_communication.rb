
module ApiCommunication
 extend ActiveSupport::Concern

  def api_record_create zombiedatum
   param = parameter zombiedatum
   begin
      RestClient::Request.execute( method: :post, url: Zombiedatum::URL ,
                                  timeout: 10 ,
                                  payload: param )
    rescue RestClient::ExceptionWithResponse => e
     e.response
    end
  end

  def api_record_update zombiedatum
   param = parameter zombiedatum
   begin
    RestClient::Request.execute( method: :put, url: Zombiedatum::URL+zombiedatum[:id].to_s,
                                timeout:10 ,
                                payload:param )
   rescue RestClient::ExceptionWithResponse => e
    e.response
   end
  end

  def api_record_delete zombiedatum
   begin
    RestClient::Request.execute(method: :delete, url: Zombiedatum::URL+zombiedatum[:id].to_s,
                                timeout:10 )
   rescue RestClient::ExceptionWithResponse => e
     e.response
   end
  end

 def api_record_find zombiedatum
   begin
     response= RestClient::Request.execute(method: :get, url:Zombiedatum::URL+zombiedatum[:q],timeout:10)
     response = response.body
     response = JSON.parse(response)
   rescue
    flash[:notice] = 'Record not found.'
    redirect_to action: "index"
   end
 end
 def parameter zombiedatum
  param = {
    id:zombiedatum['id'],
    name:zombiedatum['name'],
    age:zombiedatum['age'],
    weight:zombiedatum['weight'],
    status:zombiedatum['status']
   }
 end

end