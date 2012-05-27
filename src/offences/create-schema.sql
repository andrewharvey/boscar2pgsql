CREATE SCHEMA boscar;

CREATE DOMAIN boscar.month AS smallint
CHECK (
  VALUE >= 0 AND VALUE < 12
);

CREATE DOMAIN boscar.year AS smallint;

-- Generate using:
--   cut -d'      ' -f3 source-data/RCI_OffenceByMonth.tsv | sort | uniq | sed "s/^/'/" | sed "s/$/',/"
CREATE TYPE boscar.offence_category AS ENUM (
  'Abduction and kidnapping',
  'Against justice procedures',
  'Arson',
  'Assault',
  'Betting and gaming offences',
  'Blackmail and extortion',
  'Disorderly conduct',
  'Drug offences',
  'Harassment, threatening behaviour and private nuisance',
  'Homicide',
  'Liquor offences',
  'Malicious damage to property',
  'Offence category',
  'Other offences',
  'Other offences against the person',
  'Pornography offences',
  'Prohibited and regulated weapons offences',
  'Prostitution offences',
  'Robbery',
  'Sexual offences',
  'Theft',
  'Transport regulatory offences'
);

CREATE TYPE boscar.offence_subcategory AS ENUM (
  'Assault Police',
  'Attempted murder',
  'Breach Apprehended Violence Order',
  'Breach bail conditions',
  'Break and enter dwelling',
  'Break and enter non-dwelling',
  'Criminal intent',
  'Cultivating cannabis',
  'Dealing, trafficking in amphetamines',
  'Dealing, trafficking in cannabis',
  'Dealing, trafficking in cocaine',
  'Dealing, trafficking in ecstasy',
  'Dealing, trafficking in narcotics',
  'Dealing, trafficking in other drugs',
  'Domestic violence related assault',
  'Escape custody',
  'Fail to appear',
  'Fraud',
  'Importing drugs',
  'Indecent assault, act of indecency and other sexual offences',
  'Manslaughter (a)',
  'Manufacture drug',
  'Motor vehicle theft',
  'Murder (a)',
  'Murder accessory, conspiracy',
  'Non-domestic violence related assault',
  'Offensive conduct',
  'Offensive language',
  'Other drug offences',
  'Other offences against justice procedures',
  'Other theft',
  'Possession and/or use of amphetamines',
  'Possession and/or use of cannabis',
  'Possession and/or use of cocaine',
  'Possession and/or use of ecstasy',
  'Possession and/or use of narcotics',
  'Possession and/or use of other drugs',
  'Receiving or handling stolen goods',
  'Resist or hinder officer',
  'Robbery with a firearm',
  'Robbery with a weapon not a firearm',
  'Robbery without a weapon',
  'Sexual assault',
  'Steal from dwelling',
  'Steal from motor vehicle',
  'Steal from person',
  'Steal from retail store',
  'Stock theft',
  'Subcategory',
  'Trespass'
);
