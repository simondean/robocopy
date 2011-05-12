require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Robocopy", "#mirror" do
  it "should mirror a directory" do
    Robocopy.stub! :sh
    Robocopy.should_receive(:sh).with "robocopy /MIR test-source test-destination"
    Robocopy.mirror "test-source", "test-destination"
  end
end
