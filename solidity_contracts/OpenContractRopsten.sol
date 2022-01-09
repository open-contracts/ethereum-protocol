pragma solidity >=0.8.0;

contract OpenContract {
    address private hub = 0xACf12733cBa963201Fdd1757b4D7A062AD096dB1;
    mapping(bytes8 => bytes32) private allowedID;
 
    function setOracle(bytes8 selector, bytes32 oracleID) internal {
        allowedID[selector] = oracleID;
    }
 
    modifier checkOracle(bytes4 selector, bytes32 oracleID) {
        require(msg.sender == hub, "Can only be called via Open Contracts Hub.");
        if (allowedID[selector] != "any") {
            require(oracleID == allowedID[selector], "Incorrect OracleID.");
        }
        _;
    }
}
