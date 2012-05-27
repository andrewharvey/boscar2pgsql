# This script is licensed CC0 by Andrew Harvey <andrew.harvey4@gmail.com>
#
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/

download :
	mkdir -p ../../source-data
	wget --directory-prefix=../../source-data 'http://www.bocsar.nsw.gov.au/lawlink/bocsar/ll_bocsar.nsf/vwFiles/RCI_OffenceByMonth.xls/$$file/RCI_OffenceByMonth.xls'
	echo "Now manually open up the dowloaded .xls file in LibreOffice and select the"
	echo "extents of the document and do a copy paste into a text editor and save that as"
	echo "../../source-data/RCI_OffenceByMonth.tsv"

load :
	# clear any existing schema and create the schema fresh
	psql -c "DROP SCHEMA IF EXISTS boscar CASCADE;"
	psql -f create-schema.sql
	psql -f create-staging-schema.sql
	
	# produce the copy file from the source tab seperated file
	./load.pl ../../source-data/RCI_OffenceByMonth.tsv > staging.copy
	# echo the record count of the copy file (it should match the number reported when we create the final schema)
	wc -l staging.copy
	# load the copy file into the staging table
	psql -c "COPY boscar.offences_staging FROM STDIN;" < staging.copy
	psql -c "CREATE INDEX staging_lga_name_idx ON boscar.offences_staging(lga_name);"
	
	# create a materialized and indexed asgs.lga table (to make the JOIN fast)
	psql -f materialise_lga_name.sql
	
	# now do the join to make the final schema
	psql -f create-final-schema.sql
	
	psql -c "DROP TABLE boscar.offences_staging CASCADE;"
	psql -c "DROP TABLE boscar.asgs_lga CASCADE;"
	rm -f staging.copy
