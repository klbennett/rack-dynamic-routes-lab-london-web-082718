class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      new_item = req.path.split("/items/").last #turn /items/itemname into itemname
         found_item = @@items.find{|item| item.name == new_item}
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
