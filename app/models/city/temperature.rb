class City::Temperature

  class << self
    def from_fahrenheit(fahrenheit)
      City::Temperature.new(fahrenheit: fahrenheit)
    end

    def from_celsius(celsius)
      City::Temperature.new(celsius: celsius)
    end
  end

  def initialize(celsius: nil, fahrenheit: nil)
    @fahrenheit = fahrenheit
    @celsius = celsius
  end

  def fahrenheit
    @fahrenheit ||= (@celsius * (9.0 / 5.0)) + 32
  end

  def celsius
    @celsius ||= (@fahrenheit - 32) * 5.0 / 9.0
  end
end