intent 'OpenTestIntent' do
  respond("I am going to ask you a few questions about #{request.slot_value('testname')}")
end
