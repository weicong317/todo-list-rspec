require "rspec"
require "rspec-given"
require_relative "task"

describe Task do

  Given(:description) { "Walk the giraffe" }
  Given(:task) { Task.new(description) }

  describe "#initialize" do
    context "takes a description for its first argument" do
      When {Task.new(description)}
      Then {output.to be_a_kind_of(Task)}
    end
    
    context "requires one argument" do
      When {Task.new}
      Then {output.to raise_error(ArgumentError)}
    end
  end
  
  describe "#description" do
    context "returns the correct description for the task" do
      When {task.description}
      Then {task.description == description}
    end
  end
  
  descibe "#complete?" do
    context "returns false for incomplete tasks" do
      Given {(task).not_to be_complete}
      When {task.complete?}
      Then {task.complete? == false}
    end
    
    context "returns true for completed tasks" do
      Given {(task).to be_complete}
      When {task.complete!}
      Then {task.complete? == true}
    end
  end
  
  describe "#complete!" do
    context "changes the task from incomplete to completed" do
    When {task.complete!}
    Then {task.complete? == true}
  end
    
end
