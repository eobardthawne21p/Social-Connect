Feature: Searching for posts

As a user, I want to search for posts so I can find specific content.

Scenario: As an Original Poster, I want to search for posts
    Given There is a user, Jack
    And I sign in as Jack
    And there are multiple posts with various keywords
    And The following posts exist:
      | title                         | description                                        | location       | timeDate                           |
      | Test1                         | This is a test for searching.                     | Pittsburgh, PA | Wed Feb 21 2023 01:03:25 GMT-0500 |
      | Test2                         | This is yet another test for searching.           | Miami, FL      | Wed Jan 10 2005 01:03:25 GMT-0500 |
      | UEFA Champions League Final   | Manchester United face off against Real Madrid.   | Dallas, TX     | Wed Dec 19 2012 01:03:25 GMT-0500 |
    When I enter a search query for 'searching'
    Then I should see the following posts:
    | Test1 |
    | Test2 |
  And I should not see the following posts:
    | UEFA Champions League Final |

Scenario: As an Original Poster, I want to Search for a specific post
    Given There is a user, Jack
    And I sign in as Jack
    And The following posts exist:
      | title                         | description                                        | location       | timeDate                           |
      | Test1                         | This is a test for searching.                     | Pittsburgh, PA | Wed Feb 21 2023 01:03:25 GMT-0500 |
      | Test2                         | This is yet another test for searching.           | Miami, FL      | Wed Jan 10 2005 01:03:25 GMT-0500 |
      | UEFA Champions League Final   | Manchester United face off against Real Madrid.   | Dallas, TX     | Wed Dec 19 2012 01:03:25 GMT-0500 |
    When I enter a search query for "Dallas, TX"
    Then I should see the following posts:
        | UEFA Champions League Final |
     And I should not see the following posts:
        | Test1 | 
        | Test2 |

Scenario: As a logged-in user, I want to see a search bar
    Given There is a user, Jack
    And I sign in as Jack
    When I view the timeline and can view posts on the timeline
    Then I should see the search bar
