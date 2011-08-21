Feature: Maintain dotfiles
  As an organized developer who has his dotfiles on github
  I want to be able to set up a new user account easily

  Scenario: Symlink my dotfiles
    Given the directory "/tmp/fullstop-testing" doesn't exist
    And the directory "/tmp/dotfiles" doesn't exist
    And I have my dotfiles at "git://github.com/davetron5000/testdotfiles.git"
    When I successfully run `fullstop --checkout /tmp/dotfiles git://github.com/davetron5000/testdotfiles.git /tmp/fullstop-testing`
    Then my dotfiles should be checked out in "/tmp/dotfiles"
    And my dotfiles should be symlinked to "/tmp/fullstop-testing"

  Scenario: Dotfiles already checked out and symlinked
    Given my dotfiles are checked out in "/tmp/dotfiles"
    And my dotfiles are symlinked in "/tmp/fullstop-testing"
    When I run `fullstop --checkout /tmp/dotfiles git://github.com/davetron5000/testdotfiles.git /tmp/fullstop-testing`
    Then the exit status should not be 0
    And the stderr should contain "error: dotfiles already set up in /tmp/fullstop-testing"

  Scenario: Uses sensible defaults
    Given my home directory is in "/tmp/fake-home"
    And the directory "/tmp/fake-home/dotfiles" doesn't exist
    When I run `fullstop git://github.com/davetron5000/testdotfiles.git`
    Then the exit status should be 0
    And my dotfiles should be checked out in "/tmp/fake-home/dotfiles"
    And my dotfiles should be symlinked to "/tmp/fake-home"

  Scenario Outline: Our help doesn't suck
    When I run `fullstop <help_flag>`
    Then the exit status should be 0
    And the output should contain "Usage: fullstop [options] src_git_url [dest_dir]"
    And the output should contain "Checks out your dotfiles from src_git_url and symlinks the contents to dest_dir"
    And the "--checkout" flag should be documented

    Examples:
      |help_flag|
      | --help  |
      | -h      |
