# frozen_string_literal: true

# Factory to create or return test objects
class TestFactory
  def self.test_arm
    @test_arm ||= Arm.find_or_create_by! name: AppConstants::TEST_ARM, \
                                         schedule: test_schedule, number: 1 || FactoryBot.create(:test_arm)
  end 

  def self.test_arm2
    @test_arm2 ||= Arm.find_or_create_by! name: AppConstants::TEST_ARM2, \
                                          schedule: test_schedule, number: 2 || FactoryBot.create(:test_arm2)
  end 

  def self.test_folder
    @test_folder ||= FactoryBot.create(:test_folder)
  end

  def self.test_hipaa_identifier
    @test_hipaa_identifier ||= FactoryBot.create(:test_hipaa_identifier)
  end 
  
  def self.test_participant
    @test_participant ||= FactoryBot.create(:test_participant)
  end

  def self.test_project
    @test_project ||= FactoryBot.create(:test_project)
  end

  def self.test_project2
    @test_project2 ||= FactoryBot.create(:test_project2)
  end
 
  def self.test_response_scale
    @test_response_scale ||= FactoryBot.create(:test_response_scale)
  end 

  def self.test_schedule
    @test_schedule ||= FactoryBot.create(:test_schedule)
  end 
 
  def self.test_study
    @test_study ||= Study.find_or_create_by! name: AppConstants::TEST_STUDY || FactoryBot.create(:test_study)
  end

  def self.test_study2
    @test_study2 ||= FactoryBot.create(:test_study2)
  end

  def self.test_study_event
    @test_study_event ||= StudyEvent.find_or_create_by! name: AppConstants::TEST_STUDY_EVENT, \
                                                        arm: test_arm || FactoryBot.create(:test_study_event)
  end 

  def self.test_survey
    @test_survey ||= FactoryBot.create(:test_survey)
  end

  def self.test_user
    @test_user ||= FactoryBot.create(:test_user)
  end

  def self.test_visit
    @test_visit ||= Visit.find_or_create_by! survey: test_survey, \
                                             name: AppConstants::TEST_VISIT, \
                                             user: test_user || FactoryBot.create(:test_visit)
  end
end
