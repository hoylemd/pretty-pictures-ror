@meta_test
Feature: Test my test helpers
  Scenario: test assertions
    Then I test my assert helper
    And I test my assert_not helper
    And I test my assert_equal helper
    And I test my assert_not_equal helper

  Scenario: test random string helper
    When I seed the rand method with "64"
    Then random_string should return "eM3M2X0Z"
    And random_string of length 14 should return "vWF4k2DiIqXEKc"
    And random_string without lower_case should return "GUP1M6KZ"
    And random_string without upper_case should return "ogs3pmos"
    And random_string without numbers should return "lADJRBRi"
    And random_string with special should return "HA 51V8VP9_H7&N0 ZHO5M3AY2SELXPY"
    And random_string without any classes should error
    And I reset the random seed to the current timestamp

