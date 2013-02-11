require 'toy_robot_simulator'

describe ToyRobotSimulator do
  context "when starts in top right edge" do
    it 'should not obey command to go left or up' do
      subject.move(:left)
      subject.robot_position.should == [0, 0, :right]
      subject.move(:right)
      subject.robot_position.should == [1, 0, :right]
      subject.move(:down)
      subject.robot_position.should == [1, 0, :right]
      subject.move(:up)
      subject.robot_position.should == [1, 1, :right]
    end

    it 'should handle movements of current direction' do
      subject.move
      subject.robot_position.should == [1, 0, :right]
      subject.move
      subject.robot_position.should == [2, 0, :right]
      subject.rotate_left
      subject.robot_position.should == [2, 0, :up]
      subject.move
      subject.robot_position.should == [2, 1, :up]
    end
  end

  context "when starts in bottom right edge" do
    subject { ToyRobotSimulator.new(Position.new(4, 4, :right)) }

    it 'should not obey command to go right or down' do
      subject.move(:right)
      subject.robot_position.should == [4, 4, :right]
      subject.move(:left)
      subject.robot_position.should == [3, 4, :right]
      subject.move(:up)
      subject.robot_position.should == [3, 4, :right]
      subject.move(:down)
      subject.robot_position.should == [3, 3, :right]
    end
  end
end
