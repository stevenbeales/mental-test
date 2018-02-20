# frozen_string_literal: true

intent 'StartTest' do
  testname = request.slot_value('testname')
  respond("I am going to ask you a few questions about #{testname}")
end
