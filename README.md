On windows machine:
* use task scheduler to set the script to run periodically.

On master computer:
* use git to increment the number in index.html. Commit and push.
* the windows slave will poll the github.io site hosting index.html and restart if the number changes. Won't restart if the number is 0.
