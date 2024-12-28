// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TestToken {
    // Metadata
    string public constant NAME = "TestToken";
    string public constant SYMBOL = "TTK";
    uint8 public constant DECIMALS = 18;

    // State variables
    uint256 public totalSupply;
    mapping(address user => uint256 balance) public balanceOf;
    mapping(address owner => mapping(address spender => uint256 amount)) public allowance;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event TokenDeployed(address owner, uint256 initialSupply);

    // Errors
    error IsZeroAddress(address account);
    error DecreasedAllowanceBelowZero(
        address owner,
        address spender, 
        uint256 currentAllowance, 
        uint256 subtractedValue
    );
    error InsufficientBalance(address account, uint256 balance, uint256 value);
    error AllowanceExceeded(address owner, address spender, uint256 allowance, uint256 value);

    // Constructor
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * 10 ** uint256(DECIMALS);
        balanceOf[msg.sender] = totalSupply;
        emit TokenDeployed(msg.sender, totalSupply);
    }

    // Internal transfer function
    function _transfer(address from, address to, uint256 value) internal {
        if (to == address(0)) {
            revert IsZeroAddress(to);
        }
        if (balanceOf[from] < value) {
            revert InsufficientBalance(from, balanceOf[from], value);
        }

        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
    }

    // Public ERC-20 functions
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        if (spender == address(0)) {
            revert IsZeroAddress(spender);
        }
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        if (allowance[from][msg.sender] < value) {
            revert AllowanceExceeded(from, msg.sender, allowance[from][msg.sender], value);
        }
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        if (spender == address(0)) {
            revert IsZeroAddress(spender);
        }
        allowance[msg.sender][spender] += addedValue;
        emit Approval(msg.sender, spender, allowance[msg.sender][spender]);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        uint256 currentAllowance = allowance[msg.sender][spender];
        if (spender == address(0)) {
            revert IsZeroAddress(spender);
        }
        if (currentAllowance < subtractedValue) {
            revert DecreasedAllowanceBelowZero(msg.sender, spender, currentAllowance, subtractedValue);
        }
        allowance[msg.sender][spender] = currentAllowance - subtractedValue;
        emit Approval(msg.sender, spender, allowance[msg.sender][spender]);
        return true;
    }
}