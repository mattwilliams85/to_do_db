require 'rspec'
require 'task'
require 'pg'
require 'spec_helper'

DB = PG.connect({:dbname => 'to_do_test'})



describe Task do
  it 'is initialized with a name and a list ID' do
    test_task = Task.new("homework", 1)
    expect(test_task).to be_an_instance_of Task
  end

  it 'tells you its name' do
    test_task = Task.new("homework", 1)
    expect(test_task.name).to eq "homework"
  end

  it 'starts with no saved tasks' do
    expect(Task.all).to eq []
  end

  it 'let you save tasks to the database' do
    test_task = Task.new('homework', 1)
    test_task.save
    expect(Task.all).to eq [test_task]
  end

  it 'is the same task if it had the same name' do
    task1 = Task.new('homework', 1)
    task2 = Task.new('homework', 1)
    expect(task1).to eq task2
  end
end
