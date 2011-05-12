class Robocopy
  def self.mirror source, destination
    sh "robocopy /MIR \"#{source}\" \"#{destination}\""
  end
end