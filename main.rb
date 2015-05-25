require 'pry'
require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

aapl = Stock.new({
  name: :aapl,
  no_of_shares: 818,
  share_price: 132.5})
goog = Stock.new({
  name: :goog,
  no_of_shares: 613,
  share_price: 540.1})
amzn = Stock.new({
  name: :amzn,
  no_of_shares: 436,
  share_price: 427.6})
technology = Portfolio.new({
  name:'Technology', 
  stocks:{aapl.name => aapl, goog.name => goog, amzn.name=> amzn}
})
bny_melllon = Stock.new({
  name: :bny_melllon,
  no_of_shares: 378,
  share_price: 43.5})
td_bank = Stock.new({
  name: :td_bank,
  no_of_shares: 382,
  share_price: 56.1})
bofa = Stock.new({
  name: :bofa,
  no_of_shares: 963,
  share_price: 16.7})
finance = Portfolio.new({
  name: 'Finance',
  stocks:{bny_melllon.name => bny_melllon, td_bank.name => td_bank, bofa.name => bofa}
})
ge = Stock.new({
  name: :ge,
  no_of_shares: 941,
  share_price: 25.1})
solarwind = Stock.new({
  name: :solarwind,
  no_of_shares: 644,
  share_price: 48.9})
sunpower = Stock.new({
  name: :sunpower,
  no_of_shares: 202,
  share_price: 32.7})
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
  puts '4 - List a client and their balance'
  puts "5 - List a client's portfolios and associated values"
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
      print "Number of Shares to Buy: "
      buy_shares = gets.chomp.to_f
      stock.no_of_shares += buy_shares
      client.balance += stock.share_price*buy_shares
      puts "The new balance of #{client.name} is $#{client.balance} and now has #{stock.no_of_shares} shares in #{stock.name} and an associated value of $#{stock.share_price*stock.no_of_shares}"
    elsif answer == 's'
      print "Number of Shares to Sell: "
      sell_shares = gets.chomp.to_f
      stock.no_of_shares -= sell_shares
      client.balance += stock.share_price*sell_shares
      puts "The new balance of #{client.name} is $#{client.balance} and now has #{stock.no_of_shares} shares in #{stock.name} and an associated value of $#{stock.share_price*stock.no_of_shares}"
    end
    gets
  when '4'
    puts "Who's your client?\n#{ga_brokers.clients.keys.join(' ')}"
    client = ga_brokers.clients[gets.chomp]
    puts "The balance of #{client.name} is $#{client.balance}"
    gets
  when '5'
    puts "Who's your client?\n#{ga_brokers.clients.keys.join(' ')}"
    client = ga_brokers.clients[gets.chomp]
    portfolio = client.portfolios.keys[0]
    stocks = client.portfolios[client.portfolios.keys[0]].stocks
    binding.pry
    client.portfolios.keys.each_with_index do |client|
      puts "#{client}"
    end
  end
  response = menu
end