intent 'OpenTestIntent' do
  testname = request.session_attribute('testname')
  ask(testname)
end
