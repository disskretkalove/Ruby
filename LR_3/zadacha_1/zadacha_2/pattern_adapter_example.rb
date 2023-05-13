# Адаптируемый класс
class FahrenheitSensor
  def get_temperature
    rand(50..120)
  end
end

# Целевой интерфейс
class CelsiusSensor
  def get_temperature
    rand(-10..50)
  end
end

# Адаптер
class FahrenheitToCelsiusAdapter
  def initialize(fahrenheit_sensor)
    @fahrenheit_sensor = fahrenheit_sensor
  end

  def get_temperature
    fahrenheit_temperature = @fahrenheit_sensor.get_temperature
    (fahrenheit_temperature - 32) * 5 / 9
  end
end


fahrenheit_sensor = FahrenheitSensor.new
celsius_sensor = CelsiusSensor.new
adapter = FahrenheitToCelsiusAdapter.new(fahrenheit_sensor)

puts "Celsius temperature: #{celsius_sensor.get_temperature}C" # "Celsius temperature: -4C"
puts "Celsius temperature: #{adapter.get_temperature}C" # "Celsius temperature: 24C"
