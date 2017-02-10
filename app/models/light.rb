class Light
  def self.all
    client = Hue::Client.new
    client.lights
  end

  def self.find id
    client = Hue::Client.new
    lights = client.lights.select{ |l| l.id == id }
    lights.first
  end
end
