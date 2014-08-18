# ACPI specification file
# Created with sur-0.2.143
Sur::Specification.new do |s|
  s.name        = "ACPI"
  s.authors     = [ "0rax" ]
  s.contact     = "roemer.jp@gmail.com"
  s.date        = "Tue Aug  5 11:44:23 2014"
  s.description = "Display and control the volume of an ALSA device"
  s.notes       = <<NOTES
This sublet brings you ACPI to subtle.
It shows your battery state based on ACPI output.
NOTES
  s.config = [
    {
	:name        => "prefix",
	:type        => "string",
	:description => "Prefix",
	:def_value   => " "
    },
    {
	:name        => "suffix",
	:type        => "string",
	:description => "Suffix",
	:def_value   => ""
    },
    {
	:name        => "show_icon",
	:type        => "bool",
	:description => "Show icon",
	:def_value   => true
    }
  ]
  s.version     = "0.2"
  s.tags        = [ "ACPI", "Battery", "Linux", "Config" ]
  s.files       = [ "acpi.rb" ]
  s.icons       = [ "ac.xbm", "bat.xbm", "full.xbm" ]
end
