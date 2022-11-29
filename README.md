# macOSLAPS
LAPS solution for macOS managed with Jamf

Below is a guide for setting up LAPS for macOS on your Jamf instance. The LAPS solution creates the local admin account, randomises and encrypts the password, uploads the encrypted password to Jamf and then a self service app is used to decrypt and show the local admin password to your engineers.

v2.1 now uploaded and available. Check the Change log for changes and improvments.

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

# Decryption Self Service App

The decryption self service policy can be scoped to your Engineers so they can view the local admin password.

The app works as follows:

Enter the device name of which you require the local admin password for

<img width="727" alt="Screenshot 2022-09-28 at 16 31 52" src="https://user-images.githubusercontent.com/89595349/192821933-757267f3-204e-4b36-a30a-c76193236daf.png">

The engineer will then be presented with the password which will disapear after 10seconds

<img width="727" alt="Screenshot 2022-09-28 at 16 32 05" src="https://user-images.githubusercontent.com/89595349/192822036-f9e6a968-3e84-4887-a5af-0a100ca0e077.png">

