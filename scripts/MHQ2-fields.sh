## Get list of MHQ2 ("Mental well-being") fields from the showcase
## Category 1500: https://biobank.ndph.ox.ac.uk/showcase/label.cgi?id=1500

curl "https://biobank.ndph.ox.ac.uk/~bbdatan/Data_Dictionary_Showcase.tsv" | awk -F'\t' '$1 ~ /Online follow-up > Mental well-being/ {print $3}' > data/MHQ2.fields
