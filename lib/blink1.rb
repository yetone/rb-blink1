require 'blink1/blink1'
require 'blink1/version'

class Blink1

  attr_accessor :millis
  attr_accessor :delay_millis

  def initialize
    @millis ||= 300
    @delay_millis ||= 500
  end

  def blink r, g, b, times
    times.times do
      self.fade_to_rgb(millis, r, g, b)
      self.class.sleep(delay_millis)
      self.fade_to_rgb(millis, 0, 0, 0)
      self.class.sleep(delay_millis)
    end
  end

  def random times
    times.times do
      r = rand(0xff)
      g = rand(0xff)
      b = rand(0xff)
      self.fade_to_rgb(millis, r, g, b)
      self.class.sleep(delay_millis)
    end
  end

  def on
    self.fade_to_rgb(millis, 0xff, 0xff, 0xff)
  end

  def off
    self.fade_to_rgb(millis, 0, 0, 0)
  end

end