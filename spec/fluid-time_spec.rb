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

end
