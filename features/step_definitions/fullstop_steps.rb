Given /^I have my dotfiles at "([^"]*)"$/ do |url|
  @dotfiles_path = url
end

Then /^my dotfiles should be symlinked to "([^"]*)"$/ do |dir|
  ['.bashrc', '.inputrc', '.vimrc'].map { |file| File.join(dir,file) }.each do |file|
    file.should exist
  end
end

Given /^the directory "([^"]*)" doesn't exist$/ do |dir|
  rm_rf dir,:verbose => false, :secure => true if Dir.exists? dir
end

Then /^my dotfiles should be checked out in "([^"]*)"$/ do |path|
  File.expand_path(path).should exist
end

Given /^my dotfiles are checked out in "([^"]*)"$/ do |dir|
  Given("the directory \"#{dir}\" doesn't exist")
  mkdir_p dir, :verbose => false
  ['.bashrc', '.inputrc', '.vimrc'].map { |file| File.join(dir,file) }.each { |file| touch file, :verbose => false }
  @dotfiles_dir = dir
end

Given /^my dotfiles are symlinked in "([^"]*)"$/ do |dir|
  Given("the directory \"#{dir}\" doesn't exist")
  mkdir_p dir, :verbose => false
  chdir dir, :verbose => false
  ['.bashrc', '.inputrc', '.vimrc'].map { |file| File.join(@dotfiles_dir,file) }.each { |file| ln file,'.', :verbose => false }
end

RSpec::Matchers.define :exist do
  match do |actual|
    File.exist? actual
  end
  failure_message_for_should do |actual|
    "expected that #{actual} would exist as a File"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not exist as a File"
  end

  description do
    "exist as a File"
  end
end
