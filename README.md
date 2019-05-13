# trupti-salvi
N26 Project Repo

Please refer pdf file for Readme
ReadMe:

Automation Set up :
Have implemented automation test set using robotframework with httpLibrary  for Api Automation testing Appimlibrary for Android automation testing.
Have used single framework for both automation.

Prerequisite:(open source)
require python 2.7 or 3.6 +
pip 
robotframework                         3.1.1   
robotframework-appiumlibrary           1.5.0.3 
robotframework-httplibrary             0.4.2    
robotframework-jsonlibrary             0.2     
robotframework-ride                    1.7.3  
Download Appium server      latest version

Installation commands:
pip install robotframework
pip install robotframework-appiumlibrary
pip install robotframework-httplibrary  
pip install robotframework-jsonlibrary 
pip install robotframework-ride (editor for robot test cases / skip this to prefer intelliJ as current RIDE is bit buggy)

Steps to execute:
Clone it from git(here)
Open using ide ride/ intelliJ with robot plugin
Cd Testsuite/ApiTest
      Command: 
python -m robot.run ProductsApi.robot (to execute entire testsuite)
python -m robot.run -t testcasename  ProductsApi.robot (to execute particular test case)
python -m robot.run  ProductsApi.robot --includes <tagName>(can be executed using tags like ‘smoke’/’service’/’products’)
----------------------------------------------------------------------------------------------------------------------------
Api Automation:
Have automated Products Api with different scenarios like 200, 210,400, 500 with validations along with version and health check api.
Some more test cases can be added for detailed testing
All the other apis can also be automated in same manner.

Results/Reports/logs:
Reports attached in results folder
Result files to be referred are Logs and Report files.
Find the sample of detailed report for products Api


----------------------------------------------------------------------------------------------------------------------------
Android Automation:
Have automated only launch application and one single flow just for demo purpose
More test cases can be added for detailed testing
All the other cases can also be automated in same manner.

Steps to follow
Connect the android device with system 

USB execution:
Check the device is connected
$ adb devices
List of devices attached
xxxxxxxxxx  device

Wireless execution:

1.Both your adb host computer and Android device are on the same Wifi network.
2.Connect the Android device with the computer using your USB cable.\ You can check the attached devices with adb devices whereas ensure that adb is running in the USB mode by executing adb usb
$ adb usb
restarting in USB mode
3.Restart adb in tcpip mode with this command: 
$ adb tcpip 5556
Output: restarting in TCP mode port: 5556
4.Find out the IP address of the Android device. There are several ways to do that:
Go to Settings -> About phone/tablet -> Status -> IP address.
Go to the list of Wi-fi networks available. The one to which you’re connected, tap on that and get to know your IP.
$ adb connect 192.168.0.102:5556
already connected to 192.168.0.102:5556
$ adb devices
List of devices attached
xxxxxxxxxx  device
192.168.0.102:5556  device

5.Remove the USB cable and you should be connected to your device. If you don’t see it in adb devices then just reconnect using the previous step’s command:

$ adb connect 192.168.0.102:5556
connected to 192.168.0.102:5556
$ adb devices
List of devices attached
192.168.0.102:5556  device



Steps to execute Android Automation.
Cd Testsuite/GnuCashtest
      Command: 
python -m robot.run GnuCashtest.robot (to execute entire testsuite)
python -m robot.run -t testcasename  GnuCashtest.robot (to execute particular test case)
python -m robot.run  ProductsApi.robot --includes <tagName>(can be executed using tags like ‘smoke’/’Android’)

Results/Reports/logs:
Reports attached in results folder
Result files to be referred are Logs and Report files.
Find the sample of detailed report for Android Automation.

