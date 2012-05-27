-- create a materialised ASGS.lga table to speed up the JOIN

CREATE TABLE boscar.asgs_lga AS
SELECT code, asgs_2011.shorten_lga_name(name) AS name, state
FROM asgs_2011.lga;

CREATE INDEX lga_name_idx
  ON boscar.asgs_lga(name);
