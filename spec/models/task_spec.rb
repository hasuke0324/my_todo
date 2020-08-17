require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#create' do
    context 'taskを保存できる場合' do
      it 'contentとpriorityがあれば保存できること' do
        expect(build(:task, deadline: nil)).to be_valid
      end
    end

    context 'taskを保存できない場合' do
      it 'contentが空だと保存できないこと' do
        task = build(:task, content: nil)
        task.valid?
        expect(task.errors[:content]).to include("can't be blank")
      end

      it 'contentが27文字以上だと保存できないこと' do
        task = build(:task, content: "a" * 27)
        expect(task).to be_invalid
      end
    end
  end
end
