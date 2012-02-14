
When /^I examine all open ports$/ do
  run_simple('netstat -ant | cut -f4')
end

Then /^port (\d+) should be open on (all interfaces)$/ do |port, interface|
  interface = "*" if interface == "all interfaces" # 0.0.0.0
  assert_partial_output("#{interface}\.#{port}", all_output)
end
