require 'rails_helper'

RSpec.describe TaskStep, type: :model do
  describe 'duration' do
    let(:task_time) { Time.local(1990) }

    before do
      Timecop.freeze(task_time)
    end

    after do
      Timecop.return
    end

    context 'stopped' do

      it 'does not change duration when time passes' do
        ts = create(:task_step, started: task_time, stopped: task_time + 1.days)

        before_duration = ts.duration
        Timecop.travel(task_time + 2.days)
        expect(ts.duration).to eq before_duration
      end
    end

    context 'not stopped' do
      it 'changes duration when time passes' do
        ts = create(:task_step, started: task_time, stopped: nil)

        expect((Time.now - task_time).to_i).to eq ts.duration.to_i
        Timecop.travel(task_time + 2.hours)
        expect((Time.now - task_time).to_i).to eq ts.duration.to_i
      end
    end
  end
end
