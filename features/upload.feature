Feature: A standard usage uploading 2 files

  Background: A visitor visits the main page
    Given I visit the upload page.

  Scenario: Uploading 2 files
    Given I upload the fixed files "small_file_1.txt" and "small_file_2.txt"
    Then I see the content "This is a small file"
    Then I see the content "This is another small file"
