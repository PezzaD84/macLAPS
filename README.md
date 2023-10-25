[![Latest-Version](https://img.shields.io/badge/Latest_Version-2.3-green)](https://github.com/PezzaD84/macOSLAPS/releases) ![macOS-Versions](https://img.shields.io/badge/macOS-11+-blue) ![Script-Language](https://img.shields.io/badge/Coding_Language-Bash-blue) [![Powered-by](https://img.shields.io/badge/Powered_by-SwiftDialog-red)](https://github.com/bartreardon/swiftDialog)

# macOSLAPS

---
LAPS solution for macOS managed with Jamf

**Off the back of some great feedback from my session at JNUC 2023 in Austin, I have started to impliment some new features that were requested from the audience. All changes can be found in the change notes for v2.2.4 and v2.3. These new features include Teams integration and being able to decode the password from the serial or hostname. There are a number of other changes which can be found in the change log.**

v2.3 of the Creation and Cycle script has been uploaded. Check the [Change log](https://github.com/PezzaD84/macOSLAPS/blob/main/Change%20Log) for changes and improvments.
v2.3.1 of the Decoder script has been uploaded. Check the [Change log](https://github.com/PezzaD84/macOSLAPS/blob/main/Change%20Log) for changes and improvments.

Please see the [Wiki page](https://github.com/PezzaD84/macOSLAPS/wiki) for setting up LAPS for macOS on your Jamf instance. The LAPS solution creates the local admin account, randomises and encodes the password, uploads the encoded password to Jamf and then a self service app is used to decode and show the local admin password to your engineers.

The LAPS Script also includes the ability to redirect notifications to Slack and Teams using the WebHooks app. (Thanks Martijn for the idea https://github.com/ons-mart and thanks to https://github.com/nirvanaboi10 for the Teams code)

To help encode your API credentials there is a small script in this git [Encode API Credentials](https://github.com/PezzaD84/macOSLAPS/blob/main/Encode%20API%20Credentials)

LAPS v2 uses Swift Dialog the original project can be found here [Swift Dialog](https://github.com/bartreardon/swiftDialog)
All credit for swift Dialog goes to the owner and creator please support their project.

If you are liking the work then help me stay awake to carry on writing by buying me a coffee ☕️ https://www.buymeacoffee.com/pezza
<br>
<br>

---
