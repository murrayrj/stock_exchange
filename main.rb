require 'pry'
require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

aapl = Stock.new{
  name: :aapl,
  no_shares: 24,
  price: 132.5}
goog = Stock.new{
  name: :goog,
  no_shares: 2,
  price: 540.1}
amzn = Stock.new{
  name: :amzn,
  no_shares: 40,
  price: 427.6}
technology = Portfolio.new{
  name:'Technology', 
  stocks:{aapl.name => aapl, goog.name => goog, amzn.name=> amzn}
}
bny_melllon = Stock.new{
  name: :bny_melllon,
  no_shares: 4,
  price: 43.5}
td_bank = Stock.new{
  name: :td_bank,
  no_shares: 34,
  price: 56.1}
bofa = Stock.new{
  name: :bofa,
  no_shares: 10,
  price: 16.7}
finance = Portfolio.new{
  name: 'Finance',
  stocks:{bny_melllon.name => bny_melllon, td_bank.name => td_bank, bofa.name => bofa}
}
ge = Stock.new{
  name: :ge,
  no_shares: 10,
  price: 25.1}
solarwind = Stock.new{
  name: :solarwind,
  no_shares: 10,
  price: 48.9}
sunpower = Stock.new{
  name: :sunpower,
  no_shares: 10,
  price: 32.7}
energy = Portfolio.new{
  name: 'Energy',
  stocks:{ge.name => ge, solarwind.name => solarwind, sunpower.name => sunpower}
}
bob = Client.new name:"Bob", balance: 750000, portfolios:
{technology.name => technology, finance.name => finance, energy.name => energy}

def menu
  puts `clear`
  puts '*** GASE ***'
  puts '1 - Create a client'
  puts '2 - Create a portfolio'
  puts '3 - Purchase Stocks'
  puts '4 - Sell Stocks'
  puts '5 - List all clients and their balances'
  puts "6 - List a client's portfolios and associated values"
  puts "7 - List all stocks in a portfolio and associated values"
  puts 'q - Quit program'
  print "--> "
  gets.chomp.downcase
end

response = menu
while response != 'q'
  case response
  when '1'
  when '2'
  when '3'
  when '4'
  when '5'
  when '6'
  when '7'
  end
  response = menu
end