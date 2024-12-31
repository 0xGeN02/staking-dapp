# TestToken
[Git Source](${GIT_REPOSITORY}/blob/5c7c01e4ab5d1ba3d7ea47c48016c1005945844e/foundry/src/TestToken.sol)


## State Variables
### NAME

```solidity
string public constant NAME = "TestToken";
```


### SYMBOL

```solidity
string public constant SYMBOL = "TTK";
```


### DECIMALS

```solidity
uint8 public constant DECIMALS = 18;
```


### totalSupply

```solidity
uint256 public totalSupply;
```


### balanceOf

```solidity
mapping(address user => uint256 balance) public balanceOf;
```


### allowance

```solidity
mapping(address owner => mapping(address spender => uint256 amount)) public allowance;
```


## Functions
### constructor


```solidity
constructor(uint256 _initialSupply);
```

### _transfer


```solidity
function _transfer(address from, address to, uint256 value) internal;
```

### transfer


```solidity
function transfer(address to, uint256 value) public returns (bool);
```

### approve


```solidity
function approve(address spender, uint256 value) public returns (bool);
```

### transferFrom


```solidity
function transferFrom(address from, address to, uint256 value) public returns (bool);
```

### increaseAllowance


```solidity
function increaseAllowance(address spender, uint256 addedValue) public returns (bool);
```

### decreaseAllowance


```solidity
function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool);
```

## Events
### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 value);
```

### Approval

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value);
```

### TokenDeployed

```solidity
event TokenDeployed(address owner, uint256 initialSupply);
```

## Errors
### IsZeroAddress

```solidity
error IsZeroAddress(address account);
```

### DecreasedAllowanceBelowZero

```solidity
error DecreasedAllowanceBelowZero(address owner, address spender, uint256 currentAllowance, uint256 subtractedValue);
```

### InsufficientBalance

```solidity
error InsufficientBalance(address account, uint256 balance, uint256 value);
```

### AllowanceExceeded

```solidity
error AllowanceExceeded(address owner, address spender, uint256 allowance, uint256 value);
```

