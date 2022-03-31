# Caisse du jour [Laravel 9]
* La base de données se trouve dans la racine du projet : __caisse_db.sql__  
* current branch __main__  
## Accès :
Login : user@gmail.com  
Password : 123456  

## Requirement
PHP 8.1

## Procédure d'Installation

###### Cloner dépôt
git clone git@github.com:hariony/caisse.git

###### package installation
Composer install
###### Key
php artisan key:generate
###### Configuration
cp .env.example .env
## Database Configuration
### Option 1

mysql -u username -p caisse_db < caisse_db.sql

### Option 2

###### Run Migration tables
php artisan migrate
###### Run Seeder bdd
php artisan db:seed  
php artisan db:seed --class=createUserSeeder  
php artisan db:seed --class=TypeOperationSeeder  

## Rebuild project
npm install  
npm run dev  

## Run project
php -S localhost:8000 -t public/  
php artisan serve  