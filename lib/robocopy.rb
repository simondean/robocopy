class Robocopy
  def self.mirror source, destination, options = {}
    command = "robocopy \"#{source}\" \"#{destination}\" /MIR"
    command += get_options_string(options)
    sh command
  end

  private
  def unknown_options? options
    options.each_key do |key|
    end
  end

  def self.get_options_string options
    str = ""
    str += " /XF \"#{options[:exclude_files]}\"" if options[:exclude_files]
    str
  end
end