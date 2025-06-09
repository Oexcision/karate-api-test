Feature: Create Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Content-Type:'application/json' , Accept: 'application/json' }

  Scenario: Create Booking
    Given path 'booking'
    And request
      """
      {
        "firstname": "Andres",
        "lastname": "Wiese",
        "totalprice": 333,
        "depositpaid": true,
        "bookingdates": {
          "checkin": "2025-06-01",
          "checkout": "2025-06-10"
        },
        "additionalneeds": "Breakfast"
      }
      """
    When method POST
    Then status 200