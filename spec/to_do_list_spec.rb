require 'rspec'
require 'pg'
require 'list'
require 'spec_helper'

DB = PG.connect({:dbname => 'to_do_trial'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe List do
  it 'is initialized with a name' do
    list = List.new('Assignments', 1)
    expect(list).to be_an_instance_of List
  end

  it 'tells you its name' do
    list = List.new('Assignments', 1)
    expect(list.name).to eq 'Assignments'
    expect(list.id).to eq 1
  end

  it 'is the same list if it has the same name' do
    list1 = List.new('Assignments', 1)
    list2 = List.new('Assignments', 1)
    expect(list1).to eq list2
  end

  it 'can be initlialized with its database ID' do
    list = List.new('Assignments', 1)
    expect(list).to be_an_instance_of List
  end
  it 'starts off with no lists' do
    expect(List.all).to eq []
  end
  it 'lets you save lists to the database' do
    list = List.new('Assignments',1)
    list.save
    expect(List.all).to eq [list]
  end
  it 'sets its ID when you save it' do
    list = List.new('Assignments')
    list.save
    expect(list.id).to be_an_instance_of Fixnum
  end
end
