Feature: Delete Booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json' }

  Scenario: Delete booking by valid ID successfully
    # First create a booking to ensure we have a valid ID
    Given path 'booking'
    And request
      """
      {
        "firstname": "Test",
        "lastname": "User",
        "totalprice": 150,
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
    * def createdBookingId = response.bookingid
    * def expectedBooking = response.booking

    # Then request Auth to Create Token
    Given path 'auth'
    And request
    """{
      "username": "admin",
      "password": "password123"
    }"""
    When method POST
    Then status 200
    * def tokenAuth = response.token

    # Third Delete a booking successfully
    Given path 'booking', createdBookingId
    And header Cookie = "token="+tokenAuth
    When method DELETE
    Then status 201