#!/bin/bash

cd /var/www/sites

composer create-project -s dev -n sylius/sylius-standard ./sylius --repository='{"type":"vcs", "url": "https://github.com/lchrusciel/Sylius4DWorkshop.git"}' "dev-01-scenarios"

cd sylius

sed -i "s/database_password: null/database_password: vagrant/g" app/config/parameters.yml

php bin/console sylius:install --no-interaction
php bin/console sylius:fixtures:load
npm install
npm run gulp
