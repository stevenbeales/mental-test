# frozen_string_literal: true

# Factory to create or return test objects
class TestFactory
  def self.test_study
    @study ||= Study.find_or_create_by! name: AppConstants::TEST_STUDY || create(:test_study)
  end

  def self.test_user
    @user ||= User.find_or_create_by! username: AppConstants::TEST_USER || create(:test_user)
  end

  def self.test_survey
    @survey ||= Survey.find_or_create_by! name: AppConstants::TEST_SURVEY || create(:test_survey)
  end

  def self.test_response_scale
    @scale ||= ResponseScale.find_or_create_by! name: AppConstants::TEST_RESPONSE_SCALE || create(:test_response_scale)
  end 
end
