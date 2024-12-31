# Migrations
[Git Source](${GIT_REPOSITORY}/blob/5c7c01e4ab5d1ba3d7ea47c48016c1005945844e/foundry/src/Migrations.sol)


## State Variables
### owner

```solidity
address public owner;
```


### last_completed_migration

```solidity
uint256 public last_completed_migration;
```


## Functions
### constructor


```solidity
constructor() public;
```

### restricted


```solidity
modifier restricted();
```

### setCompleted


```solidity
function setCompleted(uint256 completed) public restricted;
```

### upgrade


```solidity
function upgrade(address new_address) public restricted;
```

