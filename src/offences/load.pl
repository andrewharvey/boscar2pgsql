#!/usr/bin/perl -w

# This script is licensed CC0 by Andrew Harvey <andrew.harvey4@gmail.com>
#
# To the extent possible under law, the person who associated CC0
# with this work has waived all copyright and related or neighboring
# rights to this work.
# http://creativecommons.org/publicdomain/zero/1.0/


use strict;
use Text::CSV;

# destination database schema + dot, and table
my $schema = "boscar.";
my $dst_table = "offences_staging";

my $src_csv_full_filename = $ARGV[0];

# open the source csv file for reading
open (my $src_data, '<', "$src_csv_full_filename") or die $!;

my $csv = Text::CSV->new({sep_char => "\t"});

my @column_names = $csv->column_names($csv->getline($src_data));

my %month_ref = (
  "jan" => 0,
  "feb" => 1,
  "mar" => 2,
  "apr" => 3,
  "may" => 4,
  "jun" => 5,
  "jul" => 6,
  "aug" => 7,
  "sep" => 8,
  "oct" => 9,
  "nov" => 10,
  "dec" => 11
);

while (my $row_ref = $csv->getline_hr($src_data)) {
  my %row = %{$row_ref};
  my $statistical_division = delete $row{"Statistical Division or Subdivision"};
  my $lga_name = delete $row{"LGA"};
  my $offence = delete $row{"Offence category"};
  my $subcategory = delete $row{"Subcategory"};
  $subcategory = '\N' if (!defined $subcategory || $subcategory eq "");

  foreach my $key (keys %row) {
    my $value = $row{$key};
    $value = '\N' if (!defined $value || $value eq "");
      if ($key =~ /^(\w{3}) (\d{4})$/) {
        my $month = $month_ref{lc($1)};
        my $year = $2;
        print "$lga_name\t$offence\t$subcategory\t$month\t$year\t$value\n";
      }else{
          warn "Unexpected column heading $key\n";
      }
  }
}

close $src_data or warn $!;
