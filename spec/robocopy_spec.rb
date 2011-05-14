require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Robocopy", "#mirror" do
  it "should mirror a directory" do
    Robocopy.stub! :sh
    Robocopy.should_receive(:sh).with 'robocopy "test-source" "test-destination" /MIR'
    Robocopy.mirror "test-source", "test-destination" do |opt|
    end
  end

  it "should accept configuration options" do
    Robocopy.stub! :sh
    Robocopy.should_receive(:sh).with 'robocopy "test-source" "test-destination" /MIR /XF "test-file"'
    Robocopy.mirror "test-source", "test-destination" do |opt|
      opt.exclude_files = 'test-file'
    end
  end
end