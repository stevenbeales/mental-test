# frozen_string_literal: true

RSpec.describe Folder, type: :model do
  subject { ProjectTestFactory.test_folder }
  let!(:project1) { ProjectTestFactory.test_project }
  let!(:project2) { ProjectTestFactory.test_project2 } 
  
  it 'is an instance of Folder' do
    expect(subject).to be_a Folder
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    include_context 'shared attributes'
    
    context '#name' do
      it { expect(attribute?(:name)).to be_truthy }
    end
    context '#projects' do
      it { expect(attribute?(:projects)).to be_truthy }
    end
    context 'common attributes' do
      it { expect(timestamps?).to be_truthy }
    end 
  end

  describe '#name' do
    after(:each) do
      subject.restore_attributes
    end

    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end

  describe '.create!' do
    context 'without a name' do
      it do
        expect { described_class.create! }.to raise_error \
          ActiveRecord::RecordInvalid
      end
    end  

    context 'with 1 character name' do
      it do
        expect { described_class.create! name: 'a' }.to raise_error \
          ActiveRecord::RecordInvalid
      end
    end
    
    context 'with 2+ character name' do
      it do
        expect do
          described_class.find_or_create_by! name: 'as' 
        end.to_not raise_error
      end
    end

    context 'with unique name' do
      it do
        rs = described_class.create! name: 'a12'
        expect { described_class.create! name: 'a12' }.to \
          raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end
  end

  describe '#destroy!' do
    context 'with projects' do 
      it do
        folder = described_class.create! name: 'a13'
        folder.projects.concat [project1, project2]
        folder.destroy! 
        expect(project1).not_to be_nil 
      end
    end
  end
  
  describe '#to_s' do
    it { expect(subject.to_s).to eq TestConstants::TEST_FOLDER }
  end

  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
