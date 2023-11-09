# MHQ2
 Code for deriving phenotypes from the second Mental Health Questionnaire in UK Biobank

## 1. Convert fields

Extract MHQ2 fields from an unpacked `*.enc_ukb` data release file:

```sh
./scripts/MHQ-fields.sh --enc_ukb data/ukb12345.enc_ukb
```

which will output a file called `data/ukb12345.rds`

## 2. Derive MHQ fields

Run all the phenotype notebooks against the extracted fields `*.rds` file:

```sh
./scripts/MHQ2-phenotypes --rds data/ukb12345.rds
```

which will produce reports in `reports/ukb12345-*.html` and phenotype files in `outputs/ukb12345-*.tsv`