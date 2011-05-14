class Robocopy
  def self.mirror source, destination, options = {}
    option_names = [:exclude_files]
    options.each_key do |key|
      raise ArgumentError.new "#{key} is an unknown option" unless option_names.include?(key)
    end

    command = "robocopy \"#{source}\" \"#{destination}\" /MIR"
    command += get_optional_arguments(options)
    system command
  end

  private
  def check_options options
    options.each_key do |key|
    end
  end

  def self.get_optional_arguments options
    str = ""
    str += " /XF \"#{options[:exclude_files]}\"" if options[:exclude_files]
    str
  end
end