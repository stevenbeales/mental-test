# frozen_string_literal: true

# Passes find_or_create associations to Factory bot
class FactoryInitializer
  def self.test_arm
    Arm.find_or_create_by!(name: AppConstants::TEST_ARM, schedule: test_schedule, number: 1)
  end

  def self.test_arm2
    Arm.find_or_create_by!(name: AppConstants::TEST_ARM2, schedule: test_schedule, number: 2)
  end

  def self.test_assessment
    Assessment.find_or_create_by! visit: test_visit
  end

  def self.test_instrument
    Instrument.find_by name: AppConstants::TEST_INSTRUMENT 
  end

  def self.test_schedule
    Schedule.find_or_create_by!(name: AppConstants::TEST_SCHEDULE, study: test_study)
  end

  def self.test_study
    Study.find_or_create_by! name: AppConstants::TEST_STUDY
  end
  
  def self.test_study_event
    StudyEvent.find_or_create_by! name: AppConstants::TEST_STUDY_EVENT, arm: test_arm
  end

  def self.test_survey
    Survey.find_or_create_by! name: AppConstants::TEST_SURVEY 
  end    
    
  def self.test_user
    User.find_or_create_by! username: AppConstants::TEST_USER 
  end    

  def self.test_visit
    Visit.find_or_create_by!(name: AppConstants::TEST_VISIT, survey: test_survey, user: test_user)
  end
end
