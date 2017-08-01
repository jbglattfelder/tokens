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
    
    uint private sppl;
    
    address private owner;
    mapping (address => uint) accounts;
    
    // Constructor
    function MyToken() {
        owner = msg.sender;
        require(owner == msg.sender);
        sppl = 123456789;
        Message("Supply generated");
        accounts[owner] = sppl;
        Message("Owner credited");
    }
    
    function totalSupply() constant returns (uint) {
         return sppl;
    }
    
    function balanceOf(address _owner) constant returns (uint) {
         return accounts[_owner];
    }
    
    function transfer(address _to, uint _value) returns (bool) {
        require(owner == msg.sender);
        if (accounts[owner] >= _value && _value > 0 ){
            accounts[owner] -= _value;
            accounts[_to] += _value;
            Message("Funds transferred");
        }
    }
    
    // Message
    event Message(string mymsg);
}
