# macOSLAPS


**Sections**
>- [Initial Setup](https://github.com/PezzaD84/macOSLAPS#setup)
>- [Decryption App Setup](https://github.com/PezzaD84/macOSLAPS#decryption-self-service-app)
>- [Inventory View](https://github.com/PezzaD84/macOSLAPS#computer-inventory-display)
>- [Slack Intergration](https://github.com/PezzaD84/macOSLAPS#slack-integration)
>- [Troubleshooting](https://github.com/PezzaD84/macOSLAPS#Troubleshooting)

---
LAPS solution for macOS managed with Jamf

Below is a guide for setting up LAPS for macOS on your Jamf instance. The LAPS solution creates the local admin account, randomises and encrypts the password, uploads the encrypted password to Jamf and then a self service app is used to decrypt and show the local admin password to your engineers.

The LAPS Script also includes the ability to redirect notifications to Slack using the WebHooks app. (Thanks Martijn for the idea https://github.com/ons-mart)

To help encode your API credentials there is a small script in this git [Encode API Credentials](https://github.com/PezzaD84/macOSLAPS/blob/main/Encode%20API%20Credentials)

v2.2.1 now uploaded and available. Check the Change log for changes and improvments.

LAPS v2 uses Swift Dialog the original project can be found here [Swift Dialog](https://github.com/bartreardon/swiftDialog)
All credit for swift Dialog goes to the owner and creator please support their project.

If you are liking the work then help me stay awake to carry on writing by buying me a coffee ☕️ https://www.buymeacoffee.com/pezza

---
# Setup

Create an Extension Attribute to store the encrypted password in the Device inventory. Name this extension attribute "LAPS CryptKey".

<img width="627" alt="Screenshot 2022-02-02 at 15 53 38" src="https://user-images.githubusercontent.com/89595349/152189069-0c40f763-a409-4e59-9f77-efcddcbfe2ab.png">

Repeat this process for the encrypted secret calling it "LAPS Secret" and password reset called "LAPS Reset Password". You will end up with 3 Extension attributes.

![Screenshot 2022-11-29 at 09 41 02](https://user-images.githubusercontent.com/89595349/204494276-47121ac0-c28e-4ae1-92b3-dee0a891e7de.png)

Upload both Scripts from the git repositry to your Jamf instance and give them a name to go with their function.

<img width="433" alt="Screenshot 2022-02-01 at 10 58 15" src="https://user-images.githubusercontent.com/89595349/151956472-a2c3e199-48a4-489b-a020-a3a0c7a578e7.png">

Upload the LAPS pkg file to your JAMF Instance.

<img width="372" alt="Screenshot 2022-09-28 at 16 23 09" src="https://user-images.githubusercontent.com/89595349/204495051-6f836e57-3571-4eff-bfd3-9fa011685627.png">

Set the parameters in each script and name each $ function to what it does. (each function can be found in the script header)

Creation and password cycle script

<img width="853" alt="Screenshot 2022-09-28 at 16 15 05" src="https://user-images.githubusercontent.com/89595349/192817682-9e6c43b1-3630-4e39-810e-3037e0534af8.png">

Decryption script

<img width="860" alt="Screenshot 2022-09-28 at 16 16 25" src="https://user-images.githubusercontent.com/89595349/192817875-02d04ec0-0945-4568-87f8-61c0e0153fe2.png">


Create 4 policies.
- One for Creating the admin and cycling the password. Create this with a trigger of "Ongoing" and a custom trigger "CreateLAPS". Add the Script and pkg.
- One for Running the LAPS Script Monthly using the custom trigger. Enable the "Files and Processes" Payload and then in the "Execute command" option enter "jamf policy -event CreateLAPS"
- One for the self service Decryption app.
- One for cycling the password once its viewed.

![Screenshot 2022-11-29 at 09 46 54](https://user-images.githubusercontent.com/89595349/204496107-98058cd2-a86f-4116-b570-8e036b9d7ef1.png)

In each policy set the script functions with your credentials and URL.

Creation and password cycle script

<img width="770" alt="Screenshot 2022-09-28 at 16 25 26" src="https://user-images.githubusercontent.com/89595349/192820654-4929ebd1-0b39-4890-8593-4e27c105c3e2.png">

Decryption script

<img width="764" alt="Screenshot 2022-09-28 at 16 28 10" src="https://user-images.githubusercontent.com/89595349/192820995-5650be3d-1d32-43b1-8941-525f96d56612.png">

Make sure the Decryption script is set as a self service app. You can upload your own Icon and name it how you wish.

<img width="605" alt="Screenshot 2022-02-01 at 09 41 33" src="https://user-images.githubusercontent.com/89595349/151957228-d8765197-cfb8-49e4-98e7-79688d3fde8f.png">

Create a smart Group called "LAPS Reset Password" and set the criteria as below. Scope the "Reset Password" Policy to ONLY this group.

![Screenshot 2022-11-29 at 09 51 53](https://user-images.githubusercontent.com/89595349/204496891-59437751-94f8-470c-b520-deaf1324d7af.png)

---
# Decryption Self Service App

The decryption self service policy can be scoped to your Engineers so they can view the local admin password.

The app works as follows:

Enter the device name of which you require the local admin password for

<img width="727" alt="Screenshot 2022-09-28 at 16 31 52 copy" src="https://user-images.githubusercontent.com/89595349/204497692-63c50604-7d21-4e00-a213-fe4b609b0632.png">

The engineer will then be presented with the password which will disapear after 10seconds

<img width="727" alt="Screenshot 2022-09-28 at 16 32 05 copy" src="https://user-images.githubusercontent.com/89595349/204497771-623d1a81-65f7-41b2-8688-846d5b1b2487.png">

---
# Computer Inventory Display

If all is working ok then in the computer inventory record you should see the Extension attributes populated as below. Please note, none of these are the local admin passwords and will not do anything if just copied and pasted.

![Screenshot 2022-11-29 at 10 08 04](https://user-images.githubusercontent.com/89595349/204500891-def63602-61d4-452d-9232-d179d0bb52fb.png)

---
# Slack integration

The LAPS Script includes a feature to push notifications to a Slack Channel by using a webhook. To enable these features you will need to create a new app in your slack tenent which you can do [here](https://slack.com/intl/en-gb/help/articles/115005265063-Incoming-webhooks-for-Slack) by following the step by step guide.

Once the app is created make a note of the webhook URL as you will need to use this in a Jamf variable.

![Screenshot 2023-02-01 at 10 45 11](https://user-images.githubusercontent.com/89595349/216022180-ea5843ed-1a21-474b-bbb7-f1f1d8187074.png)

You will need to add a few extra details to your scripts.

For the creation script Parameter 9 should be set up as below.

Script Option

![Screenshot 2023-02-01 at 10 37 57](https://user-images.githubusercontent.com/89595349/216022373-1c3c1253-e7a9-4ab6-9c83-87a6e2ffe51e.png)

Policy configuration

![Screenshot 2023-02-01 at 10 37 18](https://user-images.githubusercontent.com/89595349/216022559-9fbec16b-b5b7-4291-89d6-cfa697be3f53.png)


The decryption script should be set up as below. You can optionally add your service desk to parameter 8 which will enable the "Challenge Request" Button. 

Script Options

![Screenshot 2023-02-01 at 10 38 12](https://user-images.githubusercontent.com/89595349/216022655-a296e72c-d895-4032-9640-bd8d393843ac.png)

Policy configuration

![Screenshot 2023-02-01 at 10 37 38](https://user-images.githubusercontent.com/89595349/216022705-6eaf612d-4619-49eb-a6c9-ce07ea325ba0.png)


If everything is configured correctly you should see the follow notifications in your chosen Slack channel.

<img width="675" alt="Screenshot 2023-01-24 at 15 30 12" src="https://user-images.githubusercontent.com/89595349/216022860-01f53217-d198-45ce-be71-8ee117657ca7.png">

---
# Troubleshooting

### Account Duplication
If a local account with the same name as the LAPS account exists then the setup process will fail.
<img width="532" alt="Screenshot 2023-02-23 at 09 37 03" src="https://user-images.githubusercontent.com/89595349/220871577-f748744e-05d5-48de-a798-ac287393358b.png">

In this case it is best practice to remove any local accounts with the existing name or choose a new name for the LAPS account being created.
<br>
<br>
<br>
### Authentication issues
You might start noticing the decrytped password is not working or the logs show errors such as the following.
>2023-02-17 15:15:32.094 sysadminctl[13006:77173] Operation is not permitted without secure token unlock.
<dscl_cmd> DS Error: -14090 (eDSAuthFailed)
Authentication for node /Local/Default failed. (-14090, eDSAuthFailed)

This could be a number of issues, for example, the encoded credentials are incorrect or for some reason they did not escrow to Jamf and have been overwritten with an incorrect password.<br>In this case it is recommended to reset the existing LAPS configuration using the reset script here https://github.com/PezzaD84/macOSLAPS/blob/main/LAPS%20Reset%20Script
