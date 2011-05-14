class Robocopy
  def self.mirror source, destination
    options = Options.new
    yield options

    command = "robocopy \"#{source}\" \"#{destination}\" /MIR"
    command += options.to_s
    sh command
  end

  class Options
    attr_accessor :exclude_files

    def to_s
      str = ""
      str += " /XF \"#{@exclude_files}\"" if @exclude_files
      str
    end
  end
end