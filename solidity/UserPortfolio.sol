// SPDX-License-Identifier: MIT
// Submitted by Sukanya Parashar
pragma solidity ^0.8.6;

interface ERC20Token {
    function transfer(address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function totalSupply() external view returns (uint256);
    function balanceOf(address) external view returns (uint256);
    function allowance(address, address) external view returns (uint256);
}

contract PortfolioContract {
    
    struct ERC20Tokens {
        address tokenAddress;
        string tokenName;
        string tokenSymbol;
        bool exists;
    }
    
    struct UserWallet {
        uint256 amount;
    }
    
    struct TokenBalance {
        string token;
        uint256 amount; 
    }
    
    mapping(address => mapping(string => UserWallet)) public userWallet;
    mapping(string => ERC20Tokens) public eRC20Tokens;
    
    string[] public tokenSymbols;

    function addToken(address _tokenAddress, string memory _tokenName, string memory _tokenSymbol) public {
        if (!eRC20Tokens[_tokenSymbol].exists) {
            eRC20Tokens[_tokenSymbol].exists = true;
            eRC20Tokens[_tokenSymbol].tokenAddress = _tokenAddress;
            eRC20Tokens[_tokenSymbol].tokenName = _tokenName;
            eRC20Tokens[_tokenSymbol].tokenSymbol = _tokenSymbol;
            tokenSymbols.push(_tokenSymbol);
        }
    }
    
    //NOTE: The smart contract should be approved by the Token contract before the deposit function is called
    function deposit(string memory _tokenSymbol, uint256 _amount) public {
        address tokenAddress = eRC20Tokens[_tokenSymbol].tokenAddress;
        ERC20Token token = ERC20Token(tokenAddress);
        address from = msg.sender;
        address to = address(this);
        token.transferFrom(from, to, _amount);
        userWallet[msg.sender][_tokenSymbol].amount += _amount;
    }
    
    function withdraw(string memory _tokenSymbol, uint256 _amount) public {
        address tokenAddress = eRC20Tokens[_tokenSymbol].tokenAddress;
        ERC20Token token = ERC20Token(tokenAddress);
        require(token.balanceOf(address(this)) >= _amount, "Insufficient balance");
        token.transfer(msg.sender, _amount);
        userWallet[msg.sender][_tokenSymbol].amount -= _amount;
    }
    
    function withdrawAll(string memory _tokenSymbol) public {
        address tokenAddress = eRC20Tokens[_tokenSymbol].tokenAddress;
        ERC20Token token = ERC20Token(tokenAddress);
        for (uint256 i = 0; i < tokenSymbols.length; i++) {
            require(token.balanceOf(address(this)) >= userWallet[msg.sender][_tokenSymbol].amount, "Insufficient balance");
            token.transfer(msg.sender, userWallet[msg.sender][_tokenSymbol].amount);
            userWallet[msg.sender][_tokenSymbol].amount = 0;
        }
    }
    
    function listAllTokensAndBalances() public returns(TokenBalance[] memory) {
        TokenBalance[] memory tokenBalance = new TokenBalance[](tokenSymbols.length);
        for (uint256 i = 0; i < tokenSymbols.length; i++) {
            tokenBalance[i].token = tokenSymbols[i];
            tokenBalance[i].amount = userWallet[msg.sender][tokenSymbols[i]].amount;
        }
        return (tokenBalance);
    }
    
    function transferTokens(address _toAddress, string memory _tokenSymbol, uint256 _amount) public {
        address tokenAddress = eRC20Tokens[_tokenSymbol].tokenAddress;
        ERC20Token token = ERC20Token(tokenAddress);
        require(token.balanceOf(address(this)) >= _amount, "Insufficient balance");
        userWallet[msg.sender][_tokenSymbol].amount -= _amount;
        userWallet[_toAddress][_tokenSymbol].amount += _amount;
    }
}