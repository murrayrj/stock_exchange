require 'pry'
require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

aapl = Stock.new({
  name: :aapl,
  no_shares: 818,
  price: 132.5})
goog = Stock.new({
  name: :goog,
  no_shares: 613,
  price: 540.1})
amzn = Stock.new({
  name: :amzn,
  no_shares: 436,
  price: 427.6})
technology = Portfolio.new({
  name:'Technology', 
  stocks:{aapl.name => aapl, goog.name => goog, amzn.name=> amzn}
})
bny_melllon = Stock.new({
  name: :bny_melllon,
  no_shares: 378,
  price: 43.5})
td_bank = Stock.new({
  name: :td_bank,
  no_shares: 382,
  price: 56.1})
bofa = Stock.new({
  name: :bofa,
  no_shares: 963,
  price: 16.7})
finance = Portfolio.new({
  name: 'Finance',
  stocks:{bny_melllon.name => bny_melllon, td_bank.name => td_bank, bofa.name => bofa}
})
ge = Stock.new({
  name: :ge,
  no_shares: 941,
  price: 25.1})
solarwind = Stock.new({
  name: :solarwind,
  no_shares: 644,
  price: 48.9})
sunpower = Stock.new({
  name: :sunpower,
  no_shares: 202,
  price: 32.7})
energy = Portfolio.new({
  name: 'Energy',
  stocks:{ge.name => ge, solarwind.name => solarwind, sunpower.name => sunpower}
})
bob = Client.new name:"Bob", balance: 750000, portfolios:
{technology.name => technology, finance.name => finance, energy.name => energy}

ga_brokers = Brokerage.new(name: 'GA Broke', clients:{bob.name => bob})

def menu
  puts `clear`
  puts '*** GASE ***'
  puts '1 - Create a client'
  puts '2 - Create a portfolio'
  puts '3 - Buy/Sell Stocks'
  puts '4 - List all clients and their balances'
  puts "5 - List a client's portfolios and associated values"
  puts "6 - List all stocks in a portfolio and associated values"
  puts 'q - Quit program'
  print "--> "
  gets.chomp.downcase
end

response = menu
while response != 'q'
  case response
  when '1'
    puts "Create a new client"
    print "Name: "
    name = gets.chomp
    print "Balance: "
    balance = gets.chomp.to_f
    client = Client.new({
      name: name,
      balance: balance
    })
    puts "Enter any key to continue"
    gets
  when '2'
    puts "Create a new portfolio"
    puts "Who's your client?\n#{ga_brokers.clients.keys.join(' ')}"
    client = ga_brokers.clients[gets.chomp]
    print "Portfolio Name: "
    name = gets.chomp
    portfolio = Portfolio.new({name: name})
    portfolio = client.portfolios[name]
  when '3'
    puts "Who's your client?\n#{ga_brokers.clients.keys.join(' ')}"
    client = ga_brokers.clients[gets.chomp]
    puts "Portfolio:\n#{client.portfolios.keys.join(' ')}"
    portfolio = client.portfolios[gets.chomp]
    puts "Stock:\n#{portfolio.stocks.keys.join(' ')}"
    stock = portfolio.stocks[gets.chomp.to_sym]
    puts "(B)uy or (S)ell a stock"
    answer = gets.chomp.downcase
    if answer == 'b'
    print "Number of Shares to Purcahse: "
    buy_shares = gets.chomp.to_f
    elsif answer == 's'
    print "Number of Shares to Sell: "
    sell_shares = gets.chomp.to_f
    end
  when '5'
  when '6'
  when '7'
  end
  response = menu
end