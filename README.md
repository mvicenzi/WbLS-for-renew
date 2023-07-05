# WbLS-for-renew
Scripts and Python notebooks for the hands-on 1-ton WbLS experience at the Pathway BNL Neutrino Week summer school.

## Instructions
To avoid asking students to install Python or other required packages, these Python notebooks are meant to be run online using *Google Colab*.
The only two requirements are then an internet connection and a Google account.

1. Go to https://colab.research.google.com in your web browser.
2. Sign in using your Google account if you're not already signed in.
3. In the Colab menu, click on "File" and then select "Open Notebook".
4. In the dialog box, click on the "GitHub" tab.
5. Enter the URL of this GitHub repository. Make sure to include the full URL, including the `https://` prefix.
6. Colab will fetch the list of notebooks in the repository. Click on the notebook file you want to import.

Colab can easily access input files stored in the Google Drive associated to the account with which you sign in.
The following code must be added to a notebook to mount an access point to Google Drive:
```
from google.colab import drive
drive.mount('/content/drive')
``` 

The input data files will be made available in a Google Drive folder.

## Links
* Timetable Week 1: https://indico.cern.ch/event/1301247/

