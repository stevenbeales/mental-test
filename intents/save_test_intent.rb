# frozen_string_literal: true

intent 'SaveTest' do
  respond("Save Test #{request.slot_value('testname')}")
end
