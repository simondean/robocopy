require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Robocopy", "#mirror" do
  it "should mirror a directory" do
    Robocopy.stub! :system
    Robocopy.should_receive(:system).with 'robocopy "test-source" "test-destination" /MIR'
    Robocopy.mirror "test-source", "test-destination"
  end

  it "should exclude files" do
    Robocopy.stub! :system
    Robocopy.should_receive(:system).with 'robocopy "test-source" "test-destination" /MIR /XF "test-file"'
    Robocopy.mirror "test-source", "test-destination", :exclude_files => 'test-file'
  end

  it "should reject unknown options" do
      lambda {Robocopy.mirror "test-source", "test-destination", :test_option => 'test-value'}.should raise_error ArgumentError, "test_option is an unknown option"
  end
end