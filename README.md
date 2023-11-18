# README

## Setup
Install gems
```
  bundle install
```

Run tests
```
  rspec
```


## Soft delete functionality
I implemented the soft delete functionality by defining the soft_delete function in the Item model. This function calls the update function which is inherited from RoR's ActiveRecord. To denote that an Item is soft deleted, we update it's deleted_at value to the current Time.

