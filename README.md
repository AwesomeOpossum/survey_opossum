#Survey Opossum
This is an app that allows users to create a survey and track the survey results.
The author can send out a link, and anyone with the link can fill out the survey.

## Features

### Authors
* New authors can sign up (anyone can do this).
* Authors have a "my surveys" screen that lists all the surveys they have created.
* Authors can create a new survey.
* Authors can mark questions as required.
* Authors can edit their own surveys.
* Authors can delete a survey (that they authored).

####Viewing Results
* Authors can view all of the answers for any survey they have created.
  * In this view, answers are grouped by question.

####Creating Surveys
* Surveys must have:
  * Title (required)
  * Description (optional)
  * A set of questions
* Every question has:
  * Question text (required)
  * Question description (optional)
* There are three types of questions that should be supported:
  * Yes/no
  * Short answer
  * Long answer
* Questions can be reordered
* Publishing a survey works as follows:
  * By default, surveys are not published.  The author must choose to publish a survey.
  * The survey must have at least one question before it can be published.
  * When published, the author is immediately presented a link that they can send to people to take the survey.

  


###Taking a Survey
* If a taker has a link to a survey:
  * The taker can follow the link directly to the survey.
  * The taker can complete the survey in a browser.
  * Takers cannot change their answers once they have submitted a survey.
  * Takers can take the survey as many times as they want.
  * Takers cannot submit a survey until the required fields have been filled in.
  * Authors cannot edit a survey after one or more submissions have been made for the survey.


## ERD
A link to our ERD can be found [here](https://www.lucidchart.com/invitations/accept/92992156-1bd1-436c-9582-0cc0a862dd5d)
