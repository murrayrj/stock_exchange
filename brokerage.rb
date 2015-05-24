class Brokerage

attr_accessor :name, :clients

  def initialize(name, clients)
    @name = :name
    @clients = :clients || {}
  end

end