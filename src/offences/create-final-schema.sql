-- create final offences table by joining ASGS.lga(code) with data from the staging table
CREATE TABLE boscar.offences AS
  SELECT asgs.code as lga_code, stage.offence_category, stage.offence_subcategory, stage.month, stage.year, stage.count
  FROM boscar.offences_staging stage
  JOIN boscar.asgs_lga asgs ON (stage.lga_name = asgs.name);

-- add FOREIGN KEY for ASGS.lga(code)
ALTER TABLE boscar.offences
  ADD CONSTRAINT offences_lga_fkey FOREIGN KEY (lga_code)
    REFERENCES asgs_2011.lga (code) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION;

-- can add indexes on all fields here to speed up queries which have a WHERE
-- clause on all or some fields
