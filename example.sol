// See http://j-node.blogspot.ch/2017/08/how-to-ico.html
pragma solidity ^0.4.10;

contract Example {
    address owner;
    struct Account {
        string addr;
        uint amount;
    }
    mapping (uint => Account) accounts;
    
    // Constructor
    function Example() {
        owner = msg.sender;
        // require(owner == msg.sender); // Check
        Message("OK");
    }

    // Setter and getter
    function set(uint _index, string _addr, uint _amount) {
        accounts[_index].addr = _addr;
        accounts[_index].amount = _amount;
    }
    
    function getAmount(uint _index) constant returns (uint) {
        return accounts[_index].amount;
    }
    
    function getAmddr(uint _index) constant returns (string) {
        return accounts[_index].addr;
    }
    
    // Message
    event Message(string mymsg);
}
