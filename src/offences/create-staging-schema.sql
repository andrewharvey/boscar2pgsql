CREATE TABLE boscar.offences_staging
(
  lga_name text,
  offence_category boscar.offence_category,
  offence_subcategory boscar.offence_subcategory,
  month month,
  year year,
  count smallint
);

