# macOSLAPS
LAPS solution for macOS managed with Jamf

Below is a guide for setting up LAPS for macOS on your Jamf instance. The LAPS solution creates the local admin account, randomises and encrypts the password, uploads the encrypted password to Jamf and then a self service app is used to decrypt and show the local admin password to your engineers.

v1.4 now uploaded and available. Check the Change log for changes and improvments.

# Setup

Create an Extension Attribute to store the encrypted password in the Device inventory. You can name this extension attribute whatever you wish but the name is needed in the script later on.

<img width="627" alt="Screenshot 2022-02-02 at 15 53 38" src="https://user-images.githubusercontent.com/89595349/152189069-0c40f763-a409-4e59-9f77-efcddcbfe2ab.png">

You will also need the ID of the extension Attribute which you can grab from the URL.

<img width="520" alt="Screenshot 2022-02-02 at 15 55 11" src="https://user-images.githubusercontent.com/89595349/152189629-1d2fa069-650f-4aea-a3cd-fe158f289158.png">

Repeat this process for the encrypted secret as well so you end up with 2 Extension attributes.
<img width="328" alt="Screenshot 2022-05-05 at 10 17 45" src="https://user-images.githubusercontent.com/89595349/166895082-5404fc97-0b00-4b17-9ad7-c2f66da6e516.png">

Upload both Scripts from the git repositry to your Jamf instance and give them a name to go with their function.

<img width="433" alt="Screenshot 2022-02-01 at 10 58 15" src="https://user-images.githubusercontent.com/89595349/151956472-a2c3e199-48a4-489b-a020-a3a0c7a578e7.png">

Set the parameters in each script and name each $ function to what it does. (each function can be found in the script header)

Creation and password cycle script

<img width="853" alt="Screenshot 2022-05-05 at 10 20 37" src="https://user-images.githubusercontent.com/89595349/166895529-41a14392-2d27-432a-8f45-6a98a1ee2379.png">
<img width="850" alt="Screenshot 2022-05-05 at 10 20 51" src="https://user-images.githubusercontent.com/89595349/166895537-d4f25110-2248-48eb-a599-7934ffb9e50f.png">



Decryption script

<img width="885" alt="Screenshot 2022-05-05 at 10 22 22" src="https://user-images.githubusercontent.com/89595349/166895702-52af010f-cb53-456f-8638-d6d26c925496.png">



Create 2 policies. One for Creating the admin and cycling the password and one for the self service app.

<img width="784" alt="Screenshot 2022-02-01 at 09 40 14" src="https://user-images.githubusercontent.com/89595349/151956838-624198f5-4b63-4854-a833-fce60cb132eb.png">

In each policy set the script functions with your credentials and URL.

Creation and password cycle script

<img width="766" alt="Screenshot 2022-05-05 at 10 24 21" src="https://user-images.githubusercontent.com/89595349/166896880-1f795aca-49df-4975-8625-8eac9adf4ea5.png">
<img width="767" alt="Screenshot 2022-05-05 at 10 23 54" src="https://user-images.githubusercontent.com/89595349/166896895-97e946f7-fcc7-4876-9457-c97e58437ef6.png">



Decryption script

<img width="766" alt="Screenshot 2022-05-05 at 10 24 43" src="https://user-images.githubusercontent.com/89595349/166896918-123606e1-133c-4bd8-aee8-d91f3b4571a8.png">


Make sure the Decryption script is set as a self service app. You can upload your own Icon and name it how you wish.

<img width="605" alt="Screenshot 2022-02-01 at 09 41 33" src="https://user-images.githubusercontent.com/89595349/151957228-d8765197-cfb8-49e4-98e7-79688d3fde8f.png">

Set the Creation and password cycle script as part of your build process to create the local admin at first build. An "Enrollment trigger" will do this, also set it to run "Once a month" to cycle the local admin password every 30 days. I also set a custom trigger so that it can be added to build set ups which run software such as DEPNotify.

<img width="761" alt="Screenshot 2022-02-01 at 11 06 24" src="https://user-images.githubusercontent.com/89595349/151957626-066f5371-8375-465a-a632-afdb2d3b97bf.png">

# Decryption Self Service App

The decryption self service policy can be scoped to your Engineers so they can view the local admin password.

The app works as follows:

Enter the device name of which you require the local admin password for

<img width="532" alt="Screenshot 2022-02-01 at 10 42 19" src="https://user-images.githubusercontent.com/89595349/151957941-cff876c6-af5a-4ed4-9b88-2343b2238eb0.png">


The engineer will then be presented with the password which will disapear after 10seconds

<img width="532" alt="Screenshot 2022-02-01 at 10 42 38" src="https://user-images.githubusercontent.com/89595349/151958087-8d5a40d8-0698-4078-865a-995cb2abaa5a.png">

