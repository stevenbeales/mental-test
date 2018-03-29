# frozen_string_literal: true

# Factory to create or return test objects
class TestFactory
  def self.test_arm
    @test_arm ||= FactoryBot.create(:test_arm)
  end 

  def self.test_assessment
    @test_assessment ||= FactoryBot.create(:test_assessment)
  end

  def self.test_assessment2
    @test_assessment2 ||= FactoryBot.create(:test_assessment2)
  end

  def self.test_assessment_instrument
    @test_assessment_instrument ||= 
      FactoryBot.create(:test_assessment_instrument)
  end

  def self.test_choice
    @test_choice ||= FactoryBot.create(:test_choice)
  end

  def self.test_hipaa_identifier
    @test_hipaa_identifier ||= FactoryBot.create(:test_hipaa_identifier)
  end 
  
  def self.test_participant
    @test_participant ||= FactoryBot.create(:test_participant)
  end

  def self.test_schedule
    @test_schedule ||= FactoryBot.create(:test_schedule)
  end 
 
  def self.test_study
    @test_study ||= FactoryBot.create(:test_study)
  end

  def self.test_study2
    @test_study2 ||= FactoryBot.create(:test_study2)
  end

  def self.test_study_event
    @test_study_event ||= FactoryBot.create(:test_study_event)
  end 
  
  def self.test_study_participant
    @test_study_participant ||= FactoryBot.create(:test_study_participant)
  end 

  def self.test_survey_participant
    @test_survey_participant ||= FactoryBot.create(:test_survey_participant)
  end 
    
  def self.test_study_event_instrument
    @test_study_event_instrument ||= 
      FactoryBot.create(:test_study_event_instrument)
  end

  def self.test_journal
    @test_journal ||= FactoryBot.create(:test_journal)
  end

  def self.test_journal_entry
    @test_journal_entry ||= FactoryBot.create(:test_journal_entry)
  end

  def self.test_survey
    @test_survey ||= FactoryBot.create(:test_survey)
  end

  def self.test_user
    @test_user ||= FactoryBot.create(:test_user)
  end

  def self.test_visit
    @test_visit ||= FactoryBot.create(:test_visit)
  end
end

# Factory to create or return instrument related test objects
class InstrumentTestFactory
  def self.test_instrument
    @test_instrument ||= 
      Instrument.find_by(name: TestConstants::TEST_INSTRUMENT) 
  end
  
  def self.test_response_scale
    @test_response_scale ||= FactoryBot.create(:test_response_scale)
  end 
end

# Factory to create or return project related test objects
class ProjectTestFactory
  def self.test_folder
    @test_folder ||= FactoryBot.create(:test_folder)
  end
  
  def self.test_project
    @test_project ||= FactoryBot.create(:test_project)
  end

  def self.test_project2
    @test_project2 ||= FactoryBot.create(:test_project2)
  end
end
