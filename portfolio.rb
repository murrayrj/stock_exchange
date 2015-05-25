class Portfolio

  attr_accessor :name, :stocks

  def initialize(options={})
    @name = options[:name]
    @stocks = options[:stocks] || {}
  end

end 
