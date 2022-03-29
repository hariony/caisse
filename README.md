# Caisse du jour [Laravel 9]
* La base de données se trouve dans la racine du projet : __caisse_db.sql__  
* current branche __main__  
## Accès :
Login : user@gmail.com  
Password : 123456  

## Procédure d'Installation

###### Cloner dépôt
git clone git@github.com:hariony/caisse.git

### Backend
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

### Frontend
npm install  
npm run dev  


###### Run on local
php artisan serve or php -S localhost:8000 -t public/