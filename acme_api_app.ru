require 'json'

class AcmeApiApp
  def call(env)
    req = Rack::Request.new(env)

    case req.path_info
    when /\A\/products\/?\z/
      return [200, { 'Content-Type' => 'application/json' }, [['dynamite', 'spikes'].to_json]]
    when /\A\/product_details\/.+\/?\z/
      return [200, { 'Content-Type' => 'application/json' }, [{ user_guide: 'Use it with care!' }.to_json]]
    else
      [404, { 'Content-Type' => 'application/json' }, []]
    end
  end
end

run AcmeApiApp.new
