uBacRest
========

Unix backup restore script collection.


Example usage
=============

This is some examples of how the script is intended to be used:


/<>\ SIMPLE BACKUP /<>\

// Lists the folder that can be backed up.
%0 backup

// Backup folder 6.5.
%0 backup 6.5

// Backup the current referenced folder with no comment.
%0 backup current

// Backup the current referenced folder with no comment.
%0 backup current "Innan test av nya funktionen 'express'"



/<>\ SIMPLE RESTORE /<>\

// Lists the folders that can be restored.
%0 restore

// Lists all backups for a specific folder with [row#, datetime, file name, comment].
%0 restore 6.5

// Restores a specific backup file.
%0 restore 6.5 sugar_6.5_2012-09-25_13-10.x

// Restores the first (oldest) backup file.
%0 restore 6.5 1

// Restores the last (latest) backup file.
%0 restore 6.5 -1

// Restores the latest backup file.
%0 restore 6.5 latest



/<>\ COMPLEX RESTORE /<>\

// Restores the latest backup file to another directory (test_folder).
%0 restore 6.5 -1 test_folder



/<>\ RESTORE FROM REMOTE SERVER /<>\

// Show help regarding restore remote functionality / show a list of possible remote servers.
%0 restore-remote

// Lists the folders that can be restored from the remote server.
%0 restore-remote prod

// Lists all backups for a specific folder with [row#, datetime, file name, comment] from the remote server.
%0 restore-remote prod 6.5

// Restores a specific backup file from the remote server to the same folder at the localhost.
%0 restore-remote prod 6.5 sugar_6.5_2012-09-25_13-10.x

// Restores the first (oldest) backup file from the remote server to the same folder at the localhost.
%0 restore-remote prod 6.5 1

// Restores the last (latest) backup file from the remote server to the same folder at the localhost.
%0 restore-remote prod 6.5 -1

// Restores the latest backup file from the remote server to the same folder at the localhost.
%0 restore-remote prod 6.5 latest
