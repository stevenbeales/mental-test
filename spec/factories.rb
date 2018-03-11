# frozen_string_literal: true

FactoryBot.define do
  factory :test_folder, class: 'Folder' do
    name AppConstants::TEST_FOLDER
  end

  factory :test_project, class: 'Project' do
    name AppConstants::TEST_PROJECT
    title AppConstants::TEST_PROJECT_TITLE
  end
  
  factory :test_project2, class: 'Project' do
    name AppConstants::TEST_PROJECT2
    title AppConstants::TEST_PROJECT_TITLE2
  end
  
  factory :test_user, class: 'User' do
    username AppConstants::TEST_USER
  end

  factory :test_study, class: 'Study' do
    name AppConstants::TEST_STUDY
  end
  
  factory :test_study2, class: 'Study' do
    name AppConstants::TEST_STUDY2
  end
  
  factory :test_survey, class: 'Survey' do
    name AppConstants::TEST_SURVEY
  end

  factory :test_schedule, class: 'Schedule' do
    name AppConstants::TEST_SCHEDULE
    association :study, factory: :test_study
  end
  
  factory :test_arm, class: 'Arm' do
    name AppConstants::TEST_ARM
    number 1
    association :schedule, factory: :test_schedule
  end

  factory :test_response_scale, class: 'ResponseScale' do
    name AppConstants::TEST_RESPONSE_SCALE
  end
  
  factory :test_hipaa_identifier, class: 'HipaaIdentifier' do
    name AppConstants::TEST_HIPAA_IDENTIFIER
  end
  
  factory :timmy, class: 'User' do
    username 'Timmy'
    access_token 'AccessToken'
  end
end
