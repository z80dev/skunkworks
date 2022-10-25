// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "utils/VyperDeployer.sol";

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.
    SimpleStore public simpleStore;
    SimpleStore public vyperStore;
    VyperDeployer vyperDeployer = new VyperDeployer();


    /// @dev Setup the testing environment.
    function setUp() public {
        simpleStore = SimpleStore(HuffDeployer.deploy("SimpleStore"));
        vyperStore = SimpleStore(vyperDeployer.deployContract("SimpleStore"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue(uint256 value) public {
        simpleStore.setValue(value);
        vyperStore.setValue(value);
        console.log(value);
        console.log(simpleStore.getValue());
        console.log(vyperStore.getValue());
        assertEq(value, simpleStore.getValue());
        assertEq(simpleStore.getValue(), vyperStore.getValue());
    }
}

interface SimpleStore {
    function setValue(uint256) external;
    function getValue() external returns (uint256);
}
