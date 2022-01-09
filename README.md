# Inventory Manager

Currently running on https://arcane-ocean-20485.herokuapp.com/

## Start Up
`$projectDirectory` is used to refer to where the root of the project located. Typically this will be `inventory_manager`

### With Docker (Preferred)
Ensure you have [Docker](https://www.docker.com/) and that it is running. Note, at this time MacOS has been untested please use caution (especially if using ARM-based chips).

#### For Windows Users Before Proceeding
Run the following command to clone the project or download the zip. This is to ensure that the `entrypoint.sh` is using LF file endings.
```
$ git clone https://github.com/brianmakesthings/inventory_manager.git --config core.autocrlf=input
```

#### For Linux Users
Run the following command to ensure files can be executed

```
$ sudo chown -R $USER:$USER .
$ cd $projectDirectory/bin
$ chmod +x rails
```
#### For All Users

```
$ cd $projectDirectory
$ docker-compose up
```
and in another terminal window
```
$ cd $projectDirectory
$ docker-compose run web rake db:create
$ docker-compose run web rake db:migrate
```

Visit localhost:3000 in a web browser

## Documentation
### Functions
- Create inventory items
- Edit items
- Delete items
- View a list of items
- Ability to create warehouses/locations and assign inventory to specific locations

## Tests
To run
```
$ cd $projectDirectory
$ docker-compose run web bin/rails test
```

### Extensibility
Currently two models: items and locations, each item must belong to some location.
In the future, migrations could be written to transfer location information to a seperate table in order to list location history and timestamps
