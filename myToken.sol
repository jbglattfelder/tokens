// See http://j-node.blogspot.ch/2017/08/how-to-ico.html
pragma solidity ^0.4.10;

// Interface
contract ERC20PartialInterface {
    function totalSupply() constant returns (uint);
    function balanceOf(address _owner) constant returns (uint);
    function transfer(address _to, uint _value) returns (bool);
    event Transfer(address indexed _from, address indexed _to, uint _value);
}

// Implementation
contract MyToken is ERC20PartialInterface {
    
    string public constant name = "J-COIN";
    string public constant symbol = "JCN";
    
    uint private sppl = 123456789;
    
    address private owner;
    mapping (address => uint) accounts;
    
    // Constructor
    function MyToken() {
        owner = msg.sender;
        accounts[owner] = sppl;
        Message("Initial balance");
    }
    
    function totalSupply() constant returns (uint) {
         return sppl;
    }
    
    function balanceOf(address _owner) constant returns (uint) {
         return accounts[_owner];
    }
    
    function transfer(address _to, uint _value) returns (bool) {
        require(owner == msg.sender);
        if (accounts[msg.sender] >= _value && _value > 0 ){
            accounts[msg.sender] -= _value;
            accounts[_to] += _value;
            Transfer(msg.sender, _to, _value);
            Message("Funds transferred");
            return true;
        }
        else {
            return false;
        }
    }
    
    // Message
    event Message(string mymsg);
}
