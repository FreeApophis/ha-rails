class LightGroup
  def self.all
    client = Hue::Client.new
    client.groups
  end

  def self.find id
    client = Hue::Client.new
    light_groups = client.groups.select{ |l| l.id == id }
    light_groups.first
  end
end
