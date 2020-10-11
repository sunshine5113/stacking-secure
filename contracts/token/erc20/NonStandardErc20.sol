/* SPDX-License-Identifier: MIT */
pragma solidity ^0.7.3;

/**
 * @title NonStandardErc20
 * @author Paul Razvan Berg
 * @notice An implementation of Erc20 that does not return a boolean on `transfer` and `transferFrom`.
 * @dev Strictly for test purposes. Do not use in production.
 * https://medium.com/coinmonks/missing-return-value-bug-at-least-130-tokens-affected-d67bf08521ca
 */
contract NonStandardErc20 {
    uint8 public decimals;

    string public name;

    string public symbol;

    uint256 public totalSupply;

    mapping(address => mapping(address => uint256)) internal allowances;

    mapping(address => uint256) internal balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) {
        name = name_;
        symbol = symbol_;
        decimals = decimals_;
    }

    function allowance(address owner, address spender) external view returns (uint256) {
        return allowances[owner][spender];
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        approveInternal(msg.sender, spender, amount);
        return true;
    }

    /**
     * @dev This function does not return a value, in violation of the Erc20 specification.
     */
    function transfer(address recipient, uint256 amount) external {
        transferInternal(msg.sender, recipient, amount);
    }

    /**
     * @dev This function does not return a value, in violation of the Erc20 specification.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external {
        transferInternal(sender, recipient, amount);
        approveInternal(sender, msg.sender, allowances[sender][msg.sender] - amount);
    }

    function transferInternal(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        balances[sender] = balances[sender] - amount;
        balances[recipient] = balances[recipient] + amount;
        emit Transfer(sender, recipient, amount);
    }

    function approveInternal(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}
