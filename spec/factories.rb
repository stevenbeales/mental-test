# frozen_string_literal: true

require 'factory_initializer'

FactoryBot.define do
  factory :test_arm, class: 'Arm' do
    name TestConstants::TEST_ARM
    number 1
    association :schedule, factory: :test_schedule
    initialize_with do
      test_schedule = FactoryInitializer.test_schedule
      Arm.find_or_create_by!(name: TestConstants::TEST_ARM, schedule: test_schedule, number: 1)
    end
  end

  factory :test_arm2, class: 'Arm' do
    name TestConstants::TEST_ARM2
    number 2
    association :schedule, factory: :test_schedule
    initialize_with do
      test_schedule = FactoryInitializer.test_schedule
      Arm.find_or_create_by!(name: TestConstants::TEST_ARM2, schedule: test_schedule, number: 2)
    end
  end

  factory :test_assessment, class: 'Assessment' do
    association :visit, factory: :test_visit
    initialize_with do
      test_visit = FactoryInitializer.test_visit
      Assessment.find_or_create_by! visit: test_visit
    end
  end
  
  factory :test_assessment2, class: 'Assessment' do
    association :visit, factory: :test_visit2
    initialize_with do
      test_visit2 = FactoryInitializer.test_visit2
      Assessment.find_or_create_by! visit: test_visit2
    end
  end

  factory :test_assessment_instrument, class: 'AssessmentInstrument' do
    association :assessment, factory: :test_assessment
    association :instrument, factory: :test_instrument
    initialize_with do
      test_instrument = FactoryInitializer.test_instrument
      test_assessment = FactoryInitializer.test_assessment
      AssessmentInstrument.find_or_create_by! assessment: test_assessment, instrument: test_instrument
    end
  end

  factory :test_choice, class: 'Choice' do
    value 'val'
    description 'text'
    association :response_scale, factory: :test_response_scale
    initialize_with do
      scale = FactoryInitializer.test_response_scale
      Choice.find_or_create_by! response_scale: scale, value: 'val', description: 'text'
    end
  end

  factory :test_folder, class: 'Folder' do
    name TestConstants::TEST_FOLDER
    initialize_with { Folder.find_or_create_by! name: TestConstants::TEST_FOLDER }
  end

  factory :test_hipaa_identifier, class: 'HipaaIdentifier' do
    name TestConstants::TEST_HIPAA_IDENTIFIER
    initialize_with { HipaaIdentifier.find_or_create_by! name: TestConstants::TEST_HIPAA_IDENTIFIER }
  end

  factory :test_instrument, class: 'Instrument' do
    name TestConstants::TEST_INSTRUMENT
    initialize_with { Instrument.find_or_create_by! name: TestConstants::TEST_INSTRUMENT }
  end
  
  factory :test_journal, class: 'Journal' do
    name TestConstants::TEST_JOURNAL
    association :participant, factory: :test_participant 
    initialize_with do
      test_participant = FactoryInitializer.test_participant
      Journal.find_or_create_by! name: TestConstants::TEST_JOURNAL, participant: test_participant
    end
  end
   
  factory :test_journal_entry, class: 'JournalEntry' do
    association :journal, factory: :test_journal 
    initialize_with do
      test_journal = FactoryInitializer.test_journal
      JournalEntry.find_or_create_by! journal: test_journal
    end
  end

  factory :test_participant, class: 'Participant' do
    email TestConstants::TEST_PARTICIPANT_EMAIL
    initialize_with do 
      Participant.find_or_create_by! email: TestConstants::TEST_PARTICIPANT_EMAIL
    end
  end

  factory :test_project, class: 'Project' do
    name TestConstants::TEST_PROJECT
    title TestConstants::TEST_PROJECT_TITLE
    initialize_with do 
      Project.find_or_create_by! name: TestConstants::TEST_PROJECT, title: TestConstants::TEST_PROJECT_TITLE
    end
  end
  
  factory :test_project2, class: 'Project' do
    name TestConstants::TEST_PROJECT2
    title TestConstants::TEST_PROJECT_TITLE2
    initialize_with do
      Project.find_or_create_by! name: TestConstants::TEST_PROJECT2, title: TestConstants::TEST_PROJECT_TITLE2
    end
  end

  factory :test_response_scale, class: 'ResponseScale' do
    name TestConstants::TEST_RESPONSE_SCALE
    initialize_with { ResponseScale.find_or_create_by! name: TestConstants::TEST_RESPONSE_SCALE }
  end
  
  factory :test_schedule, class: 'Schedule' do
    name TestConstants::TEST_SCHEDULE
    association :study, factory: :test_study
    
    initialize_with do
      study = FactoryInitializer.test_study
      Schedule.find_or_create_by! name: TestConstants::TEST_SCHEDULE, study: study
    end
  end
  
  factory :test_study, class: 'Study' do
    name TestConstants::TEST_STUDY
    initialize_with { Study.find_or_create_by! name: TestConstants::TEST_STUDY }
  end
  
  factory :test_study2, class: 'Study' do
    name TestConstants::TEST_STUDY2
    initialize_with { Study.find_or_create_by! name: TestConstants::TEST_STUDY2 }
  end

  factory :test_study_event, class: 'StudyEvent' do
    name TestConstants::TEST_STUDY_EVENT
    association :arm, factory: :test_arm
    initialize_with do 
      test_arm = FactoryInitializer.test_arm
      StudyEvent.find_or_create_by!(name: TestConstants::TEST_STUDY_EVENT, arm: test_arm) 
    end
  end
  
  factory :test_study_participant, class: 'StudyParticipant' do
    association :study, factory: :test_study
    association :participant, factory: :test_participant
    initialize_with do 
      test_study = FactoryInitializer.test_study
      test_participant = FactoryInitializer.test_participant
      StudyParticipant.find_or_create_by!(study: test_study, participant: test_participant) 
    end
  end

  factory :test_survey_participant, class: 'SurveyParticipant' do
    association :survey, factory: :test_survey
    association :participant, factory: :test_participant
    initialize_with do 
      test_survey = FactoryInitializer.test_survey
      test_participant = FactoryInitializer.test_participant
      SurveyParticipant.find_or_create_by!(survey: test_survey, participant: test_participant) 
    end
  end

  factory :test_study_event_instrument, class: 'StudyEventInstrument' do
    association :study_event, factory: :test_study_event
    association :instrument, factory: :test_instrument
    initialize_with do 
      test_study_event = FactoryInitializer.test_study_event
      test_instrument = FactoryInitializer.test_instrument
      StudyEventInstrument.find_or_create_by!(study_event: test_study_event, instrument: test_instrument) 
    end
  end

  factory :test_survey, class: 'Survey' do
    name TestConstants::TEST_SURVEY
    initialize_with { Survey.find_or_create_by! name: TestConstants::TEST_SURVEY }
  end

  factory :test_user, class: 'User' do
    username TestConstants::TEST_USER
    initialize_with { User.find_or_create_by! username: TestConstants::TEST_USER }
  end

  factory :timmy, class: 'User' do
    username 'Timmy'
    access_token 'AccessToken'
    initialize_with { User.find_or_create_by! username: 'Timmy', access_token: 'AccessToken' }
  end

  factory :test_visit, class: 'Visit' do
    name TestConstants::TEST_VISIT
    association :user, factory: :test_user
    association :survey, factory: :test_survey
    initialize_with do
      survey = FactoryInitializer.test_survey
      user = FactoryInitializer.test_user
      Visit.find_or_create_by!(name: TestConstants::TEST_VISIT, survey: survey, user: user)
    end
  end
  
  factory :test_visit2, class: 'Visit' do
    name TestConstants::TEST_VISIT
    association :user, factory: :timmy
    association :survey, factory: :test_survey
    initialize_with do
      survey = FactoryInitializer.test_survey
      user2 = FactoryInitializer.test_user2
      Visit.find_or_create_by!(name: TestConstants::TEST_VISIT, survey: survey, user: user2)
    end
  end
end
