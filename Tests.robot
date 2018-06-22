*** Settings ***
[Documentation]  Demonstrates duplicate keyword resolution.
Resource  lib/Page1.robot
Resource  lib/Page2.robot

*** Keywords ***
Should Be Loaded
  [Documentation]  Asserts something about the current test loading state.

Load Page
  [Documentation]  Navigates to the specified page
  [Arguments]  ${page}

*** Test Cases ***
Should show intellisense for and navigate to Page1.robot
  Page1.Should Be Loaded
  Page1.Should Be Visible
  Has Profile Link         # Not duplicated
  Page1.Has Profile Link

Should show intellisense for and navigate to Page2.robot
  Page2.Should Be Loaded
  Page2.Should Be Visible
  Click Account Details Button        # Not duplicated
  Page2.Click Account Details Button

Should prefer the local keyword
  Should Be Loaded   # Duplicated, but without namespace, stays in this file.
  Load Page  Page 1

Indeterminant behavior
  # Currently vscode-rf-language-server picks the first it encounters.
  # Should ideally:
  # 1) error due to ambiguous match
  # 2) show both namespace options with help by changing the declaration to an explicit keyword.
  Should Be Visible  