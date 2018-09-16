require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items/"
      new_item = req.path.split("/items/").last #turn /items/itemname into itemname
         found_item = @@item.find{|item| item.title == new_item}
         binding.pry
           if found_item.nil?
             resp.write "Item not found"
             resp.status = 404
           else
            resp.write "#{item.price}"
          end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
