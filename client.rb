class Client

attr_accessor :name, :balance, :portfolios

  def initialize(name, balance, portfolios)
    @name = name
    @balance = balance
    @portfolios = portfolios || {}
  end

end 
