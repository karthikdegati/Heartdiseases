 create or replace storage integration s3_int
type = external_stage
storage_provider = s3
enabled = true
storage_aws_role_arn = 'arn:aws:iam::627741535532:role/akhil_booleandata_role'
storage_allowed_locations = ('s3://akhilpbooleandata/Heart_2020_cleaned.csv');



DESC INTEGRATION s3_int;

