
# frozen_string_literal: true

RSpec.describe 'Launch Intent', type: :request do
  it 'accepts alexa launch request object' do
    sample_request = JSON.parse(File.read('./db/fixtures/LaunchRequest.json'))
    expect(sample_request['request']['type']).to eq('LaunchRequest') 
  end
  
  it do
    expect do
      Ralyxa::Skill.intent 'LaunchRequest' do
        ask(AlexaService.launch_response)
      end
    end.not_to raise_error
  end 
end
