
create or replace stage CAPTAIN.public.External_stage
url="s3://akhilpbooleandata/Heart_2020_cleaned.csv"
STORAGE_INTEGRATION=s3_int


list @captain.public.External_stage;

create or replace file format my_csv_format
type = csv field_delimiter = ',' skip_header = 1
field_optionally_enclosed_by ='"'
null_if=('NULL', 'null')
empty_field_as_null = true;
