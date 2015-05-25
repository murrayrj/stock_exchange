class Stock

  attr_accessor :name, :no_of_shares, :share_price

  def initialize(options={})
    @name = options[:name]
    @no_of_shares = options[:no_of_shares]
    @share_price = options[:share_price]
  end

end
