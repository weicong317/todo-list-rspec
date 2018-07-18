require "rspec"
require "rspec-given"
require_relative "list"
require_relative "task"
require 'byebug'

describe List do

  Given(:description){ "Walk the giraffe" }

  Given(:title){ "Testing" }
  Given(:tasks){ [Task.new(description), Task.new(description)] }
  Given(:list){ List.new(title, tasks) }
  
  describe "#initialize" do
    context "takes title and tasks as argument" do
      Then {expect(list).to be_a_kind_of(List)}
    end

    context "returns the correct size of the task in the list at the beginning" do
      Then {list.tasks.size === 2}
    end
    
    context "takes only one argument" do
      Then {expect(List.new(title)).to be_a_kind_of(List)}
    end

    context "returns the correct size of the task when no argument pass in" do
      When (:list) {List.new(title)}
      Then {list.tasks.size === 0}
    end

    context "requires at least title as argument" do
      Then {expect{List.new}.to raise_error(ArgumentError)}
    end
  end
  
  describe "#add_task" do
    context "returns the correct size of the task after add new task" do
      When {list.add_task(Task.new(description))}
      Then {list.tasks.size === 3}
    end

    context "returns the correct tasks in the list after add new task" do
      When {list.add_task(Task.new(description))}
      Then {list.tasks === (tasks << Task.new(description))}
    end
  end
  
  describe "#complete_task" do
    context "returns false for incomplete tasks before running function" do
      Then {list.tasks[0].complete? === false}
    end
    
    context "returns true for completed tasks after running function" do
      When {list.complete_task(0)}
      Then {list.tasks[0].complete? == true}
    end
  end
  
  describe "#delete_task" do
    context "removes a Task object at given index" do
      When {list.delete_task(0)}
      Then {list.tasks.size === 1}
    end

    context "returns the correct the task after delete task" do
      When (:list){List.new(title, [1, 2])}
      When {list.delete_task(1)}
      Then {expect(list.tasks).to contain_exactly(1)}
    end
  end

  describe "#completed_tasks" do
    context "returns the correct completed task" do
      When (:list){List.new(title, [Task.new("haha1"), Task.new("haha2"), Task.new("haha3")])}
      When {list.complete_task(0)}
      Then {list.completed_tasks.count === 1}
    end

    context ""
  end

  describe "#incomplete_tasks" do
    context "returns the correct incompleted task" do
      When (:list){List.new(title, [Task.new("haha1"), Task.new("haha2"), Task.new("haha3")])}
      When {list.complete_task(0)}
      Then {list.incomplete_tasks.count === 2}      
    end
  end

end
