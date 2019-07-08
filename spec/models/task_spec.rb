require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'work_time' do
    let(:task) { create(:task_with_steps) }

    it 'aggregates the durations of its steps' do
      expect(task.work_time).to eq 25 # see factory
    end
  end
end
