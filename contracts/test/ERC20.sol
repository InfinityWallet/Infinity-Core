pragma solidity =0.5.16;

import '../InfinityERC20.sol';

contract ERC20 is InfinityERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}
