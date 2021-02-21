// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity >=0.5.0;

import './SafeERC20Namer.sol';

// produces names for pairs of tokens using Infinity's naming scheme
library InfinityNamer {
    string private constant TOKEN_PREFIX = 'Infinity (';
    string private constant TOKEN_SUFFIX = ')';
    string private constant TOKEN_SYMBOL_PREFIX = '♾️';
    string private constant TOKEN_SEPARATOR = '-';

    // produces a pair descriptor in the format of `${prefix}${symbol0}-${symbol1}${suffix}`
    function pairName(
        address token0,
        address token1
    ) internal view returns (string memory) {
        return
            string(
                abi.encodePacked(
                    TOKEN_PREFIX,
                    SafeERC20Namer.tokenSymbol(token0),
                    TOKEN_SEPARATOR,
                    SafeERC20Namer.tokenSymbol(token1),
                    TOKEN_SUFFIX
                )
            );
    }

    // produces a pair symbol in the format of `♾️${symbol0}-${symbol1}`
    function pairSymbol(
        address token0,
        address token1
    ) internal view returns (string memory) {
        return
            string(
                abi.encodePacked(
                    TOKEN_SYMBOL_PREFIX,
                    SafeERC20Namer.tokenSymbol(token0),
                    TOKEN_SEPARATOR,
                    SafeERC20Namer.tokenSymbol(token1)
                )
            );
    }
}