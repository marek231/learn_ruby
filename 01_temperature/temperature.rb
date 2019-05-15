WATER_FREEZING_POINT_FAHRENHEIT = 32

def ftoc(degrees)
  (degrees - WATER_FREEZING_POINT_FAHRENHEIT) * (5.0 / 9.0)
end

def ctof(degrees)
  degrees * (9.0 / 5.0) + WATER_FREEZING_POINT_FAHRENHEIT
end