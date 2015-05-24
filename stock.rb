class Stock

  attr_accessor :name, :no_of_shares, :share_price

  def initialize(name, no_of_shares, share_price)
    @name = name
    @no_of_shares = no_of_shares
    @share_price = share_price
  end

end
