[![Latest-Version](https://img.shields.io/badge/Latest_Version-2.3-green)](https://github.com/PezzaD84/macOSLAPS/releases) ![macOS-Versions](https://img.shields.io/badge/macOS-11+-blue) ![Script-Language](https://img.shields.io/badge/Coding_Language-Bash-blue) [![Powered-by](https://img.shields.io/badge/Powered_by-SwiftDialog-red)](https://github.com/bartreardon/swiftDialog) [![JNUC 23 Recording](https://img.shields.io/badge/JNUC_23_Session-YouTube-purple)](https://www.youtube.com/watch?v=g8CaU6ReYvE&t=1s&ab_channel=Jamf)

# macLAPS

---
LAPS solution for macOS managed with Jamf

**Check out the video recording of my JNUC 23 session all about my LAPS tool [HERE](https://www.youtube.com/watch?v=g8CaU6ReYvE&t=1s&ab_channel=Jamf)**

---
**Off the back of some great feedback from my session at JNUC 2023 in Austin, I have started to impliment some new features that were requested from the audience. All changes can be found in the change notes for v2.3 and v2.3.2 These new features include Teams integration and being able to decode the password from the serial or hostname. There are a number of other changes which can be found in the change log.**

---
v2.3 of the Creation and Cycle script has been uploaded. Check the [Change log](https://github.com/PezzaD84/macOSLAPS/blob/main/Change%20Log) for changes and improvments. <br> v2.3.2 of the Decoder script has been uploaded. Check the [Change log](https://github.com/PezzaD84/macOSLAPS/blob/main/Change%20Log) for changes and improvments.<br>**_Note:The feature to trigger the password rotation after it has been viewed currently only works if the password is viewed on the same device it's being used on. This will be rectified in a future release._**

---
Please see the [Wiki page](https://github.com/PezzaD84/macOSLAPS/wiki) for setting up LAPS for macOS on your Jamf instance. The LAPS solution creates the local admin account, randomises and encodes the password, uploads the encoded password to Jamf and then a self service app is used to decode and show the local admin password to your engineers.

---
The LAPS Script also includes the ability to redirect notifications to Slack and Teams using the WebHooks app. (Thanks Martijn for the idea https://github.com/ons-mart and thanks to https://github.com/nirvanaboi10 for the Teams code)

---
To help encode your API credentials there is a small script in this git [Encode API Credentials](https://github.com/PezzaD84/macOSLAPS/blob/main/Encode%20API%20Credentials)

---
LAPS v2 uses Swift Dialog the original project can be found here [Swift Dialog](https://github.com/bartreardon/swiftDialog)
All credit for swift Dialog goes to the owner and creator please support their project.

---
If you are liking the work then help me stay awake to carry on writing by buying me a coffee ☕️ https://www.buymeacoffee.com/pezza
<br>
<br>

---
