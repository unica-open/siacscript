echo 'Creating jobs : export-entrata'
mkdir -p out/oil/entrata
./create.sh params.export-entrata.csv template.export-entrata.xml oil/entrata/export-entrata

echo 'Creating jobs : export-spesa'
mkdir -p out/oil/spesa
./create.sh params.export-spesa.csv template.export-spesa.xml oil/spesa/export-spesa

echo 'Creating jobs : import-oil-firme'
mkdir -p out/oil/ritorni/firme
./create.sh params.import-oil-firme.csv template.import-oil-firme.xml oil/ritorni/firme/import-oil-firme

echo 'Creating jobs : import-oil-provvisori'
mkdir -p out/oil/ritorni/provvisori
./create.sh params.import-oil-provvisori.csv template.import-oil-provvisori.xml oil/ritorni/provvisori/import-oil-provvisori

echo 'Creating jobs : import-oil-quietanze'
mkdir -p out/oil/ritorni/quietanze
./create.sh params.import-oil-quietanze.csv template.import-oil-quietanze.xml oil/ritorni/quietanze/import-oil-quietanze
