require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FluidTime" do
  it "runs the demo" do
    FluidTime.demo.should_not be_nil
  end
end
