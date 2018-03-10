# frozen_string_literal: true

# Factory to create or return test objects
class TestFactory
  def self.test_study
    @test_study ||= Study.find_or_create_by! name: AppConstants::TEST_STUDY || create(:test_study)
  end

  def self.test_study2
    @test_study2 ||= FactoryBot::create(:test_study2)
  end

  def self.test_user
    @test_user ||= User.find_or_create_by! username: AppConstants::TEST_USER || create(:test_user)
  end

  def self.test_survey
    @test_survey ||= Survey.find_or_create_by! name: AppConstants::TEST_SURVEY || create(:test_survey)
  end

  def self.test_response_scale
    @test_response_scale ||= ResponseScale.find_or_create_by! \
      name: AppConstants::TEST_RESPONSE_SCALE || create(:test_response_scale)
  end 

  def self.test_schedule
    @test_schedule ||= Schedule.find_or_create_by! name: AppConstants::TEST_SCHEDULE, \
                                                   study: test_study || create(:test_schedule)
  end 

  def self.test_hipaa_identifier
    @test_hipaa_identifier ||= HipaaIdentifier.find_or_create_by! \
      name: AppConstants::TEST_HIPAA_IDENTIFIER || create(:test_hipaa_identifier)
  end 

  def self.test_folder
    @test_folder ||= Folder.find_or_create_by! name: AppConstants::TEST_FOLDER || create(:test_folder)
  end

  def self.test_project
    @test_project ||= Project.find_or_create_by! name: AppConstants::TEST_PROJECT || create(:test_project)
  end
end
