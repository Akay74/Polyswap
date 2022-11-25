# Deliverables

## MUMBAI deployment addresses for contracts 

** Aiswap Token Address: ** 0x7b24dbBD7b4da5861360a90D1778Eb85a29800C2
** Biswap Token Address: ** 0xAbB63cc9Be3f24F31Fbb1c2107773c0Ed518127e
** Polyswap Contract Address: ** 0xEc6A259efA4F89ee215fC398972cEa26b6bEB417

## Pseudocode Call Sequence

1. Deploy Aiswap and Biswap tokens
2. Deploy Polyswap contract
3. Aiswap.approve(Polyswap.address, "500000000000000000000")
4. Polyswap.swapAiSwapforPolycoin(aiswap.address, "500000000000000000000")
5. Polyswap.unswapAiSwapforPolycoin(aiswap.address, "500000000000000000000")
6. Polyswap.setPolycoinPrice(2);
7. Polyswap.swapAiSwapforPolycoin(aiswap.address, "500000000000000000000")
8. Ployswap.unswapAiSwapforPolycoin(biswap.address, "5000000000000000000")
9. Biswap.approve(Polyswap.address, "500000000000000000000")
10. Polyswap.swapBiSwapforPolycoin(biswap.address, "500000000000000000000")

## Set New Price for polyswap
[Set new price transaction](https://mumbai.polygonscan.com/tx/0x9370d6af109473046350f20f7a9ccafacb11cd04f033c2b8dfa4d6363fc93f84)

## Swap with new price
[Swap with new price transaction](https://mumbai.polygonscan.com/tx/0x6c8f182dddf87085c87a7997efee741bcfad53a30bf2a05569bbe776aa436c6a)