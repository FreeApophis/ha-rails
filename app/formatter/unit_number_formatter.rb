#encoding utf-8

# Very Simple class to format the output of the numbers in Recipe Instructions. 
# Accuracy is given up for nicer output you usally get in Recipes!
class UnitNumberFormatter
  
  def initialize
    @whole_number_limit = 50
    @fraction_factor = 500
  end
   
  def format number
    integer = number.to_i
    fraction = number % 1

    if integer > @whole_number_limit # we do not need more than 2% accuracy
      return integer.to_s
    elsif integer == 0 
      # could be potentialy very small
      if fraction < 1.0 / 16 
        return number.to_s
      end
    end

    closest = closest_fraction(fraction)

    if closest
      if integer == 0
        return closest
      else
        return "#{integer}#{closest}"
      end    
    else
      return '%.1f' % number
    end
  end
  
private
  def almost_equal a, b
    magnitude = 1.0 / @fraction_factor
    difference = a - b
    
    difference.abs < magnitude.abs
  end
  
  def closest_fraction fraction
    return "" if almost_equal(0.0, fraction)
    return "⅛" if almost_equal(1.0/8, fraction)
    return "⅙" if almost_equal(1.0/6, fraction)
    return "⅕" if almost_equal(1.0/5, fraction)
    return "¼" if almost_equal(1.0/4, fraction)
    return "⅓" if almost_equal(1.0/3, fraction)
    return "⅜" if almost_equal(3.0/8, fraction)
    return "⅖" if almost_equal(2.0/5, fraction)
    return "½" if almost_equal(1.0/2, fraction)
    return "⅗" if almost_equal(3.0/5, fraction)
    return "⅝" if almost_equal(5.0/8, fraction)
    return "⅔" if almost_equal(2.0/3, fraction)
    return "¾" if almost_equal(3.0/4, fraction)
    return "⅚" if almost_equal(5.0/6, fraction)
    return "⅞" if almost_equal(7.0/8, fraction)
    return nil
  end
end
