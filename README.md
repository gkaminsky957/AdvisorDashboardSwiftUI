**General Infrmation:**

- Application does not have dependecies on any third party libraries so running it very straightforward: just build it from XCode.
- Application is designed using MVVM architecture design pattern and SwiftUI for creating UI component.
  - each view model that requires a network call is injected with a network client that makes a network call and parses the received data into data model on behave of the view model
everything coded to protocols and all dependencies are injected so mocking is easily done for the unit testing purpose
- Application consists of four screens:
  - Landing screen contains a list of all advisors that shows advisor name and all of the custodians that are managed by a specific advisor. Custodian names are comma separated. This screen has a "Filter" button in upper right corner on navigation bar for the purpose of sorting the advisor list.
  - Upon clicking on "Filter" button, the sort screen is modally presentd with two buttons "Cancel" and "Save/Clear". Clicking on "Cancel" button dismisses the screen. If there is no filter selected, "Save/Clear" button is hidden. The two sorting options are sorting by name and number of custodians advisor manages. If any of the options are selected then "Save" button appears to commit the sorting. Pressing the "Save" button dismisses the filter screen and goes back to landing screen and advisor list is sorted based sorting option selected. "Clear" button is shown when the list was initially sorted to allow user to clear to filters. Clicking "Clear" button dismisses filter screen and advisors list is displayed in the order specified in the JSON response.
  - Clicking on any advisor cards on landing screen will navigate to account summary screen that shows all accounts managed by a selected advisor. This includes the account name, account number, and custodian name the manages that account.
  - Clicking on the specific account card will navigate to holding screen that shows all holdings that selected account has. This includes tha holding name, unit number, and unit price.
    
**Assumption made:**

- Network API layer provides two APIs: one for fetching advisor list and another for fetching accounts that an advisor manages. The assumption here is that advisor id field in advisor API response will match the repId field in account API response. Example of each API call responses can be found in
  - MockAdvisorResponse file, found in main project, that contains mock JSON response for advisor API call. This response contains two advisors.
  - MockAccountSummaryResponseRepId1 and MockAccountSummaryResponseRepId2 files, found in main project, that contain mock JSON response for account API call. Each of these responses corresponds to an advisor specified in MockAdvisorResponse.
  - these two network clients AccountSummaryClient and AdvisorSummaryClient objects read corresponding mock file and parse it out instead of making actual network call to get the response since there is no real APIs exist.
    
**TODO's to make the application production ready:**

- Change AccountSummaryClient and AdvisorSummaryClient network objects to use UrlSession object to make a real network call instead of returning mock responses. URLSession object would have been injected into both clients so it can be easily mocked during unit tests.
- Add handling of error cases should network call fail
- Add handling of an empty case where any of the two calls return an empty list (no advisor returned or no accounts returned by the network API call)
- Add application launch icons
- Have a UX/UI designer to make the screens more attractive
- Support dark mode colors, images
- Support localization
- add init tests
- add UI tests
- add CI/CD pipeline to make building/submitting the build to app store ao
