# TokenStaking
[Git Source](${GIT_REPOSITORY}/blob/5c7c01e4ab5d1ba3d7ea47c48016c1005945844e/foundry/src/TokenStaking.sol)


## State Variables
### name

```solidity
string public name = "Yield Farming / Token dApp";
```


### testToken

```solidity
TestToken public testToken;
```


### owner

```solidity
address public owner;
```


### defaultAPY

```solidity
uint256 public defaultAPY = 100;
```


### customAPY

```solidity
uint256 public customAPY = 137;
```


### totalStaked

```solidity
uint256 public totalStaked;
```


### customTotalStaked

```solidity
uint256 public customTotalStaked;
```


### stakingBalance

```solidity
mapping(address => uint256) public stakingBalance;
```


### customStakingBalance

```solidity
mapping(address => uint256) public customStakingBalance;
```


### hasStaked

```solidity
mapping(address => bool) public hasStaked;
```


### customHasStaked

```solidity
mapping(address => bool) public customHasStaked;
```


### isStakingAtm

```solidity
mapping(address => bool) public isStakingAtm;
```


### customIsStakingAtm

```solidity
mapping(address => bool) public customIsStakingAtm;
```


### stakers

```solidity
address[] public stakers;
```


### customStakers

```solidity
address[] public customStakers;
```


## Functions
### constructor


```solidity
constructor(TestToken _testToken) public payable;
```

### stakeTokens


```solidity
function stakeTokens(uint256 _amount) public;
```

### unstakeTokens


```solidity
function unstakeTokens() public;
```

### customStaking


```solidity
function customStaking(uint256 _amount) public;
```

### customUnstake


```solidity
function customUnstake() public;
```

### redistributeRewards


```solidity
function redistributeRewards() public;
```

### customRewards


```solidity
function customRewards() public;
```

### changeAPY


```solidity
function changeAPY(uint256 _value) public;
```

### claimTst


```solidity
function claimTst() public;
```

