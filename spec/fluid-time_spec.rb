require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FluidTime" do

  it "runs the demo" do
    FluidTime.demo.should be_nil
  end

  it "can be initialized with a Date" do
    today = Date.today
    FluidTime.new(today).to_date.should eql(today)
  end

  it "strips zeros" do
    FluidTime.new.txt('01').xz.to_s.should eql('1')
  end

  it "replaces today's date with Today" do
    FluidTime.new.date.today.to_s.should match /Today/
  end

  context 'initialization' do
    it "accepts just a time" do
      FluidTime.new('3pm HA!!!').hour.xpm.to_s.should == '3pm'
    end

    it "accepts date as a string" do
      FluidTime.new('2012/01/05').date.to_s.should == '01/05/2012'
      FluidTime.new('2012-01-05').date.to_s.should == '01/05/2012'
      FluidTime.new('01/05/2012').date.to_s.should == '01/05/2012'
      FluidTime.new('jan 5th 2012').date.to_s.should == '01/05/2012'
    end

  end


end
