echo "Creating ordinativi informatici upload (entrate)"
./create.sh params.stampe.csv template.stampe-entrate.xml import-entrate out/ordinativi-informatici-stampe/entrata
echo "Creating ordinativi informatici upload (spese)"
./create.sh params.stampe.csv template.stampe-spese.xml import-spese out/ordinativi-informatici-stampe/spesa