# frozen_string_literal: true

intent 'ListTests' do
  respond(Instrument.list_tests)
end
