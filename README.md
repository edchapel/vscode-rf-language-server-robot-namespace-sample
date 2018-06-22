# Sample Robot files with duplicated keywords
The Robot files demonstrate a workspace where two or more `.robot` files contain the same keyword.

According to the [Robot user documentation](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#handling-keywords-with-same-names):

> ### 2.8.1   Handling keywords with same names
> Keywords that are used with Robot Framework are either library keywords or user keywords. The former come from standard libraries or external libraries, and the latter are either created in the same file where they are used or then imported from resource files. When many keywords are in use, it is quite common that some of them have the same name, and this section describes how to handle possible conflicts in these situations.

Version 2.0.0 of [vscode-rf-language-server](https://github.com/tomi/vscode-rf-language-server) does not support declaring test case steps using the explicit keyword notation where the Resource file is the namespace.

For example:

```
Page1.robot

*** Keywords ***
Should Be Loaded
```

```
Page2.robot

*** Keywords ***
Should Be Loaded
```

```
Tests.robot

*** Settings ***
Resource  lib/Page1.robot
Resource  lib/Page2.robot

*** Test Cases ***
Should show intellisense for and navigate to Page1.robot
  Page1.Should Be Loaded

Should show intellisense for and navigate to Page2.robot
  Page2.Should Be Loaded
```

Here the intellisense fails to locate the keywords in the `Page1` and `Page2` resource files.
