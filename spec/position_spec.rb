require 'position'

describe Position do
  subject { Position.new(0, 0) }
  it 'should be able to add in a direction' do
    subject.plus(:right).x.should == 1
    subject.plus(:left).x.should == -1
    subject.plus(:up).y.should == 1
    subject.plus(:down).y.should == -1
  end
end

