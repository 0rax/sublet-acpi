# ACPI sublet file
# Created with sur-0.1
configure :acpi do |s| # {{{
  s.interval = s.config[:interval]      || 5
  s.prefix   = s.config[:prefix]        || " "
  s.suffix   = s.config[:suffix]        || ""
  s.show_icon= s.config[:show_icon]     || true
  s.bat      = Subtlext::Icon.new("bat.xbm")
  s.full     = Subtlext::Icon.new("full.xbm")
  s.ac       = Subtlext::Icon.new("ac.xbm")
end # }}}

helper do

  def display_state(batt)
    case batt["state"]
      when "Charging" then "+"
      when "Discharging" then "-"
      else"="
    end
  end

  def display_state_ico(batt)
    case batt["state"]
      when "Charging" then self.ac
      when "Discharging" then self.bat
      when "Full" then self.full
      else self.bat
    end
  end

  def display_battery()
    bat = `acpi`.match(/Battery \d: (?<state>.+), (?<percent>\d+)%/)
    bstr = display_state(bat) + "%3i%" % bat["percent"]
    if self.show_icon == true
      self.data = display_state_ico(bat) + self.prefix + bstr + self.suffix
    else
      self.data = self.prefix + bstr + self.suffix
    end
  end

  def display_remaining()
    bat = `acpi`.match(/Battery \d: (?<state>.+), \d+%, (?<remaining>\d{2}:\d{2}):\d{2}/)
    if not bat
      return
    end
    if self.show_icon == true
      self.data = display_state_ico(bat) + self.prefix + bat["remaining"] + self.suffix
    else
      self.data = self.prefix + bat["remaining"] + self.suffix
    end
  end
  
end

on :mouse_down do |s, x, y, button| # {{{
  display_remaining
end # }}}



on :run do |s| # {{{
  display_battery
end # }}}
