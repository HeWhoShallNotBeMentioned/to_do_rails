require 'rails_helper'

describe Task do
  it { should validate_presence_of :description}
  it { should belong_to :list}

  it 'should default to not done when added' do
    task = Task.create({:description => "Wash the dog"})
    expect(task.done()).to(eq(false))
  end

  it 'when done is true task should be completed' do
    task = Task.create({:description => "Wash the dog"})
    task.done = true
    task.save
    expect(task.done()).to(eq(true))
  end
end
