#!/bin/sh
#///////////////////////////////////////////////////////////////////////////////////////////////////////
#   FILE : Run_Servers.sh
#   AUTHOR : Pranav Sehgal
#   DESCRIPTION :   OPENS Postgress via Terminal so you can start DB
#                   OPENS a Terminal window and launches backend using mvn compile exec:java;
#					CLEARS Angular Cache from previous session
#                   OPENS a Terminal window and launches fronted using ng serve --open;
#///////////////////////////////////////////////////////////////////////////////////////////////////////

a=1;

open  -a "Postgres"

osascript -e 'tell application "Terminal" to do script "cd Desktop/P3/Skeleton_Server_SQL/Project_API;
source ~/.bashrc;
title backend_marked_for_deletion;
mvn compile exec:java;mvn compile exec:java;"'

sleep 5;
cd Desktop/P3F/Skeleton_Server_SQL/Project_UI/angular-workspace/

rm -r .angular/cache;
echo “\nAngular cache removed {Previous Session} ”

rm -r .cli-ngcc/;
echo “\ncli-ngcc cache removed {Previous Session} ”

osascript -e 'tell application "Terminal" to do script "cd Desktop/P3/Skeleton_Server_SQL/Project_UI/angular-workspace; 
source ~/.bashrc;
title frontend_marked_for_deletion;
ng serve --open;"'
