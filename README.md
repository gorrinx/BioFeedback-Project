# BioFeedback-Project
Biofeedback project for Signals and Systems class; HRV visualization tool for users and patients.

This project is the final version of my code for a HRV reading program called "Final_Script".
There are 3 images of EKG data labeled "Patient1,..." and their corresponding .csv files.

When running "Final_Script" in MATLAB, all you have to change in the editor is the address 
file it imports under the "Import the data" comment. It helps to download the project onto your
desktop and have the files imported locally. For example, in that section it reads:

tbl = readtable("C:\Users\Gorrin\Desktop\Signals and Systems Matlab\Project\Patient1.csv", opts);

So, that file address must correspond to where the file is on your desktop. Once it is changed,
then you can run the script. The output is a Poincare plot in which clustering of data 
equates to a low HRV and a spread of data equates to a high HRV, the latter being a sign of 
good health and proper breathing technique.
