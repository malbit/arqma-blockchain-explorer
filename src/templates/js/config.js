var config = {
    testnet: false, // this is adjusted page.h if needed. dont need to change manually
    coinUnitPlaces: 9,
    txMinConfirms: 10,         // corresponds to CRYPTONOTE_DEFAULT_TX_SPENDABLE_AGE in Monero
    txCoinbaseMinConfirms: 60, // corresponds to CRYPTONOTE_MINED_MONEY_UNLOCK_WINDOW in Monero
    coinSymbol: 'EDL',
    openAliasPrefix: "edl",
    coinName: 'eDollar',
    coinUriPrefix: 'edollar:',
    addressPrefix: 0xe1,
    integratedAddressPrefix: 0xe2,
    subAddressPrefix: 0x2ee2,
    addressPrefixTestnet: 0x3c62,
    integratedAddressPrefixTestnet: 0x501,
    subAddressPrefixTestnet: 0x55e2,
    feePerKB: new JSBigInt('2000000'),//20^10 - for testnet its not used, as fee is dynamic.
    dustThreshold: new JSBigInt('2000000'),//10^10 used for choosing outputs/change - we decompose all the way down if the receiver wants now regardless of threshold
    txChargeRatio: 0.5,
    defaultMixin: 4, // minimum mixin for hardfork v5
    txChargeAddress: '',
    idleTimeout: 30,
    idleWarningDuration: 20,
    maxBlockNumber: 500000000,
    avgBlockTime: 120,
    debugMode: false
};
