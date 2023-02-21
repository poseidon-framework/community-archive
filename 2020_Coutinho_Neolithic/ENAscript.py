#!/usr/bin/env python3

import argparse
import sys
import urllib.request

parser = argparse.ArgumentParser(
    prog = 'get_ena_table',
    description = 'This script downloads a table with '
                  'links to the raw data and metadata provided by '
                  'ENA for a given project accession ID')

parser.add_argument('accession_id', help="Example: PRJEB39316")
parser.add_argument('-o', '--output_file', required=True, help="The name of the output file")

args = parser.parse_args()

ena_cols = [
    "sample_accession", 
    "study_accession", 
    "run_accession", 
    "sample_alias", 
    "secondary_sample_accession", 
    "first_public", 
    "last_updated", 
    "instrument_model", 
    "library_layout", 
    "library_source", 
    "instrument_platform", 
    "library_name", 
    "library_strategy", 
    "fastq_aspera", 
    "fastq_bytes", 
    "fastq_md5", 
    "fastq_ftp", 
    "read_count", 
    "submitted_ftp"]

ena_col_str = ",".join(ena_cols)

url = f"https://www.ebi.ac.uk/ena/portal/api/filereport?accession={args.accession_id}&\
result=read_run&fields={ena_col_str}&format=tsv&limit=0"

# print(url)
print(f"I am now attempting to download the ENA table using the following URL: {url}", file=sys.stderr)

result = urllib.request.urlopen(url)
with result:
    l = result.readlines()

with open(args.output_file, "wb") as f:
    f.writelines(l)
