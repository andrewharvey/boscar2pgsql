# About

These scripts are designed to load the [New South Wales Bureau of Crime
Statistics and Research](http://www.bocsar.nsw.gov.au/) published statistics
into a PostgreSQL database.

Unfortunately the license of this data has been made available under an
Attribution NonCommercial NoDerivs style license (see
http://www.bocsar.nsw.gov.au/lawlink/Corporate/ll_corporate.nsf/pages/LL_Homepage_disclaimer#Copyright)
meaning I can't publish a database dump produced using these scripts and the
source data in a plain text format.

# Copyright
All the files within this boscar2pgsql repository are released under the
[CC0](http://creativecommons.org/publicdomain/zero/1.0/) license by
Andrew Harvey <andrew.harvey4@gmail.com>.

    To the extent possible under law, the person who associated CC0
    with this work has waived all copyright and related or neighboring
    rights to this work.
    http://creativecommons.org/publicdomain/zero/1.0/

# Requirements
## Software Dependencies
Debian Dependencies: `postgresql-client-9.1 | postgresql-client-8.4 |
postgresql-client-9.2, libtext-csv-perl, wget`

## PostgreSQL
The scripts assume you have a PostgreSQL database up and running.

You need to set up and export some PG environment variables otherwise the
PostgreSQL defaults will be used. For example,

    export PGHOST=localhost
    export PGDATABASE=yourdatabase
    export PGUSER=yourdbuser

Refer to the [PostgreSQL documentation](http://www.postgresql.org/docs/current/static/libpq-envars.html)
for details on the environment variables which you can set.

## ASGS 2011
The latter part of the scripts require that you have loaded into the same
database the ASGS_2011 PostgreSQL schema from [asgs2pgsql](https://github.com/andrewharvey/asgs2pgsql).

You can still load the BOSCAR data without the ASGS schema, but it won't
reference the LGAs from the ASGS. The tables will still have their _staging
prefix without the ASGS schema.

# Running the Scripts
## Offences
To load the offences dataset you need to `cd src/offences`. Next run
`make download`. This will download the original source .xls file.
Follow the instructions printed in the terminal to produce your .tsv file.

I have formally requested permission from BOSCAR to redistribute this modified
.tsv file and hopefully I will soon be able to publish it.

Once you have your .tsv file, it is just a matter of running `make load`.
