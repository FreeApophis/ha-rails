class MyStromSwitch
  attr_reader :name, :icon

  def initialize config
    @name = config.first.first
    @ip = config.first.last['ip']
    @icon = config.first.last['icon']
  end

  def self.all   
    HA_CONF['my_strom'].select{ |device| device.first[1]['type'] == 'switch'}.map{ |config| MyStromSwitch.new config }
  end

  def power
    report['power']
  end

  def on?
    report['relay']
  end

  def report
    @report ||= begin
      response = RestClient.get("http://#{@ip}/report", {accept: :json})
      JSON.parse(response.body)  
    end
  end
end
