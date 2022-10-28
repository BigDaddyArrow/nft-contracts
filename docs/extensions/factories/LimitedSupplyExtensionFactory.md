# LimitedSupplyExtensionFactory









## Methods

### createExtension

```solidity
function createExtension(string title, address nft, uint256 price, uint256 maxPerMint, uint256 maxPerWallet, uint256 extensionSupply, bool startSale) external nonpayable returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| title | string | undefined |
| nft | address | undefined |
| price | uint256 | undefined |
| maxPerMint | uint256 | undefined |
| maxPerWallet | uint256 | undefined |
| extensionSupply | uint256 | undefined |
| startSale | bool | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### implementation

```solidity
function implementation() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |



## Events

### ContractDeployed

```solidity
event ContractDeployed(address indexed deployedAddress, address indexed nft, address indexed owner, string title)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| deployedAddress `indexed` | address | undefined |
| nft `indexed` | address | undefined |
| owner `indexed` | address | undefined |
| title  | string | undefined |



