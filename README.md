sqlutil
=======

https://jdrich@github.com/jdrich/sqlutil.git

## About

The sqlutil repository currently houses only a pair of scripts, pushview and
pullview. These scripts can be run from cmd.exe or msys/cygwin (use the right
file for your shell environment). The scripts require SQL Server 2008 Management
Studio to be installed on the local machine.

## Uses

Make sure that sqlutil/bin is in your PATH.

*All parameters but `--view` are optional*\*

Pull a view from the database

    $ pullview.sh --server SOME-SERVER\instance --database some_database --path ~/database --view SomeView
    Successfully wrote ~/database/views/SomeView.sql

Pull all views from the database

    $ pullview.sh --server SOME-SERVER\instance --database some_database --path ~/database --view views-all
    Successfully wrote ~/database/views/SomeView.sql
    Successfully wrote ~/database/views/SomeOtherView.sql
    Successfully wrote ~/database/views/YetAnotherView.sql

The view will be created with a `[use some_database]` statement.

Push a single view to the database

    $ pushview.sh --server SOME-SERVER\instance --view ~/database/views/SomeView.sql
    View at /home/user/database/views/SomeView.sql successfully written to database.

\**To prevent having to pass optional parameters, create a file config.json one level above the sqlutil bin directory or where you run the script with the following format:*

    {
        "server": $connection_string,
        "database": $database_name,
        "path": $path_to_database // Must be a windows formatted path.
    }

## Purpose

sqlutil is a small collection of handy scripts useful in interacting with MSSQL
databases. Currently its limited functionality revolves around interacting with
views, however the functionality could be easily expanded to encompass any
database object.

## Author

Jonathan Rich <jdrich@gmail.com>

## Feedback

Submit bugs to https://github.com/jdrich/sqlutil/issues.

## License

Please see the file called LICENSE.
