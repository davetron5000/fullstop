Feature: Maintain dotfiles
  As an organized developer who has his dotfiles on github
  I want to be able to set up a new user account easily

  Scenario: Symlink my dotfiles
    Given The directory "/tmp/fullstop-testing" doesn't exist
    And The directory "/tmp/dotfiles" doesn't exist
    And I have my dotfiles at "git://github.com/davetron5000/testdotfiles.git"
    When I successfully run `fullstop --checkout /tmp/dotfiles git://github.com/davetron5000/testdotfiles.git /tmp/fullstop-testing`
    Then my dotfiles should be checked out in "/tmp/dotfiles"
    And my dotfiles should be symlinked to "/tmp/fullstop-testing"
