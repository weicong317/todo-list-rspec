require "rspec"
require "rspec-given"
require_relative "task"

describe Task do

  Given(:description) { "Walk the giraffe" }
  Given(:task) { Task.new(description) }

  describe "#initialize" do
    context "takes a description for its first argument" do
      When {Task.new(description)}
      Then {Task.new(description)).to be_a_kind_of(Task)}
    end
    
    context "requires one argument" do
      When {Task.new}
      Then {expect{ Task.new }.to raise_error(ArgumentError)}  # noticed we used {Task.new} instead of (Task.new)? With () is to test the return value, {} is to test the behavior
    end
  end
  
  describe "#description" do
    context "returns the correct description for the task" do
      When {task.description}
      Then {task.description == description}  # Rspec matcher version: expect(task.description).to eq description
    end
  end
  
  descibe "#complete?" do
    context "returns false for incomplete tasks" do
      Given {(task).not_to be_complete}
      When {task.complete?}
      Then {task.complete? == false}  # Rspec matcher version: expect(task.complete?).to be(false)
    end
    
    context "returns true for completed tasks" do
      Given {(task).to be_complete}
      When {task.complete?}
      Then {task.complete? == true}
    end
  end
  
  describe "#complete!" do
    context "changes the task from incomplete to completed" do
    When {task.complete!}
    Then {task.complete? == true}
  end
    
end
