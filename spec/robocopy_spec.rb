require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Robocopy", "#mirror" do
  it "should mirror a directory" do
    Robocopy.stub! :sh
    Robocopy.should_receive(:sh).with 'robocopy "test-source" "test-destination" /MIR'
    Robocopy.mirror "test-source", "test-destination"
  end

  it "should exclude files" do
    Robocopy.stub! :sh
    Robocopy.should_receive(:sh).with 'robocopy "test-source" "test-destination" /MIR /XF "test-file"'
    Robocopy.mirror "test-source", "test-destination", :exclude_files => 'test-file'
  end
end