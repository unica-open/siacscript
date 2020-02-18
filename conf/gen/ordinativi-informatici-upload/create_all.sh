echo "Creating ordinativi informatici upload (entrate)"
./create.sh params.upload.csv template.upload-entrate.xml import-entrate out/ordinativi-informatici-upload/entrata
echo "Creating ordinativi informatici upload (spese)"
./create.sh params.upload.csv template.upload-spese.xml import-spese out/ordinativi-informatici-upload/spesa