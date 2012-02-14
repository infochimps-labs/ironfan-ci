World(::Cuken::Api::Aruba::Api)

When /^I examine all open ports$/ do |cmd|
  run_simple('netstat -ant | cut -f4')
end

Then /^port (\d+) should be open on (all interfaces)$/ do |port, interface|
  interface = "0.0.0.0" if interface == "all interfaces"
  assert_partial_output("#{interface}:#{port}", all_output)
end
