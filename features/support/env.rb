require 'aruba/cucumber'
require 'fileutils'

include FileUtils

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
Before do
  @aruba_timeout_seconds = 10
  @real_home = ENV['HOME']
end

After do
  ENV['HOME'] = @real_home
end
