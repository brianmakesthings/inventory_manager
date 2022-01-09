# Inventory Manager

Currently running on https://arcane-ocean-20485.herokuapp.com/

## Start Up
### With Docker (Preferred)
Ensure you have [Docker](https://www.docker.com/) installed.

```
$ cd $projectDirectory
$ docker-compose up
```

Visit localhost:3000 in a web browser

## Documentation
### Functions
- Create inventory items
- Edit Them
- Delete Them
- View a list of them
- Ability to create warehouses/locations and assign inventory to specific locations

### Extensibility
Currently two models: items and locations, each item must belong to some location.
In the future, migrations could be written to transfer location information to a seperate table in order to list location history and timestamps
