class Brokerage

attr_accessor :name, :clients

  def initialize(options={})
    @name = options[:name]
    @clients = options[:clients] || {}
  end

end