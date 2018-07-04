Scenario: Application
    Given the website is running
    When a REST request is made on /health
    Then the response has status code of "200" 
    And the response text contains exactly "OK"
