# Caisse du jour [Laravel 9]
* La base de données se trouve dans la racine du projet : __caisse_db.sql__  
* current branch __main__  
## Accès :
Login : user@gmail.com  
Password : 123456  

## Procédure d'Installation

###### Requirement
PHP 8.1
###### Cloner dépôt
git clone git@github.com:hariony/caisse.git

## Backend
composer install

###### Configuration bdd
cp .env.example .env

###### Key
php artisan key:generate


###### Migration tables
php artisan migrate

###### Seeder bdd
php artisan db:seed  
php artisan db:seed --class=createUserSeeder  
php artisan db:seed --class=TypeOperationSeeder  

## Frontend
npm install  
npm run dev  


## Run project
php -S localhost:8000 -t public/  
php artisan serve  