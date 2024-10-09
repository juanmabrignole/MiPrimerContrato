// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

//Importaciones

import "./Storage.sol";

contract Balances is Storage {
    address public owner;
    mapping (address user => uint balances) public balances;

    //Eventos
    event Suma (address user, uint value, uint newBalance);

    constructor(){
        owner = msg.sender;
    }

    function suma(uint value) public {
        store(balances[msg.sender]);
        balances[msg.sender] += value;
        //Emito el evento
        emit Suma (msg.sender, value, balances[msg.sender]);
    }

    function resta(uint value) public view returns (uint){
        //Requisito para ser ejecutada, que el valor a restar no sea mayor a lo que tengo como balance
        require(value <= balances[msg.sender]);
        return balances [msg.sender] - value;
    }

}
