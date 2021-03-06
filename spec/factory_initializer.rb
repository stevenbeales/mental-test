# frozen_string_literal: true

# Passes find_or_create associations to Factory bot
class FactoryInitializer
  def self.test_arm
    Arm.find_or_create_by!(name: TestConstants::TEST_ARM, schedule: test_schedule, number: 1)
  end

  def self.test_assessment
    Assessment.find_or_create_by! visit: test_visit
  end
  
  def self.test_instrument
    Instrument.find_by name: TestConstants::TEST_INSTRUMENT 
  end

  def self.test_journal
    Journal.find_or_create_by! name: TestConstants::TEST_JOURNAL
  end

  def self.test_participant
    Participant.find_or_create_by! email: TestConstants::TEST_PARTICIPANT_EMAIL
  end

  def self.test_response_scale
    ResponseScale.find_or_create_by! name: TestConstants::TEST_RESPONSE_SCALE
  end 

  def self.test_schedule
    Schedule.find_or_create_by!(name: TestConstants::TEST_SCHEDULE, study: test_study)
  end

  def self.test_study
    Study.find_or_create_by! name: TestConstants::TEST_STUDY
  end
  
  def self.test_study_event
    StudyEvent.find_or_create_by! name: TestConstants::TEST_STUDY_EVENT, arm: test_arm
  end
  
  def self.test_survey
    Survey.find_or_create_by! name: TestConstants::TEST_SURVEY 
  end    
    
  def self.test_user
    User.find_or_create_by! username: TestConstants::TEST_USER 
  end    

  def self.test_visit
    Visit.find_or_create_by!(name: TestConstants::TEST_VISIT, survey: test_survey, user: test_user)
  end
end
