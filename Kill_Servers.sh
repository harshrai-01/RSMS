#!/bin/sh
#///////////////////////////////////////////////////////////////////////////////////////////////////////
#   FILE : Kill_Servers.sh
#   AUTHOR : Pranav Sehgal
#   DESCRIPTION :   CLEARS Terminal history (Currently Disabled)
#                   CLEARS Angualar Cache
#                   CLEARS cli-ngcc Cache
#                   CLOSES all Terminal windows with name containing Run_Servers.sh
#                   CLOSES all Terminal windows with name containing marked_for_deletion 
#					KILLS  all Postgres processes
#                   KILLS  all Terminal windows with name containing Kill_Servers.sh 
#///////////////////////////////////////////////////////////////////////////////////////////////////////

a=1;

#history -c;
cd Desktop/P3F/Skeleton_Server_SQL/Project_UI/angular-workspace/

rm -r .angular/cache;
echo “\nAngular cache removed {Current Session} ”

sleep 0.5;
rm -r .cli-ngcc/;
echo “\ncli-ngcc cache removed {Current Session}”

source ~/.bashrc;
title marked_for_deletion;

osascript -e 'tell application "Terminal" to close (every window whose name contains "Run_Servers.sh")' &
osascript -e 'tell application "Terminal" to close (every window whose name contains "marked_for_deletion")' &
osascript -e 'tell application "Terminal" to close (every window whose name contains "marked_for_deletion")' &

killall Postgres

osascript -e 'tell application "Terminal" to close (every window whose name contains "Kill_Servers.sh")' &

sleep 20
killall Terminal