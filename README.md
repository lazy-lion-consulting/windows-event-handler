# Windows Event Handler

A simple native tool for handling windows events as they occur.
It is not immediately obvious how to trigger some action based on an event in the windows logging facility.

This project provides a simple example of how to achieve this (using a script that sends a simple email conatining the event information (as the "trigger email" functionality has been depricated by windows server)).

# Notes

The supplied script is not the most optimal version of what can be implemented, but should suffice in a pinch.

# Prerequisists 

- None

# Usage (send_event_info)

1. Copy the relevant script to a known directory (default is ``C:\Automation``)
2. Identify the ``event ID`` (either through documentation or if it has already occured in the Windows "Event Viewer")
3. Clone the template config ``xml`` in the templates folder of this project.
4. Edit the ``EventID`` parameter in ``Actions.Exec.Arguments`` to match your event ID
5. Edit the ``WorkingDirectory`` parameter in ``Actions.Exec.WorkingDirectory`` to match the path of your script (if not default)
6. Open ``Task Scheduler``, right click on ``Task Scheduler Library`` and select ``Import Task...`` and select your modified template file.
7. Ensure that, in the ``Triggers`` tab, when ``Edit...`` is selected, the ``Begin the task:`` is set to ``On an event`` and that the ``Log:``, ``Source:`` & ``Event ID:`` parameters are set to the relevant settings for that event (as shown in the ``Event Viewer``), and that the ``Enabled`` checkbox is set.
8. Feel free to change other settings as you see fit.
