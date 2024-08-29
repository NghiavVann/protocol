import { L2_NETWORK, L3_NETWORK } from '../../../constants'
import { ethers } from 'ethers'
import { TransactionRecord } from '@/utils/bridge/depositERC20ArbitrumSDK'
import { arbSysABI } from '@/web3/ABI/arbSys_abi'

const arbSysAddress = '0x0000000000000000000000000000000000000064'

export const sendWithdrawTransaction = async (
  amountInNative: string,
  destination: string
): Promise<TransactionRecord> => {
  try {
    if (!window.ethereum) {
      throw new Error('no provider')
    }
    const amountInWei = ethers.utils.parseEther(amountInNative.toString())
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    await provider.send('eth_requestAccounts', [])
    const signer = provider.getSigner()

    const arbSysContract = new ethers.Contract(arbSysAddress, arbSysABI, signer)

    const txRequest = await arbSysContract.populateTransaction.withdrawEth(destination, {
      value: amountInWei
    })

    const txResponse = await signer.sendTransaction(txRequest)

    // Wait for the transaction to be mined
    await txResponse.wait()

    return {
      type: 'WITHDRAWAL',
      amount: amountInNative,
      lowNetworkChainId: L2_NETWORK.chainId,
      highNetworkChainId: L3_NETWORK.chainId,
      highNetworkHash: txResponse.hash,
      highNetworkTimestamp: Date.now() / 1000,
      challengePeriod: 60 * 60
    }
  } catch (error) {
    console.error('Transaction failed:', error)
    throw error
  }
}

export const estimateWithdrawFee = async (
  amountInNative: string,
  destination: string,
  lowNetwork: NetworkInterface
) => {
  const lowNetworkProvider = new providers.JsonRpcProvider(lowNetwork.rpcs[0])

  try {
    const amountInWei = ethers.utils.parseEther(amountInNative.toString())
    const arbSysContract = new ethers.Contract(arbSysAddress, arbSysABI, lowNetworkProvider)

    const estimatedGas = await arbSysContract.estimateGas.withdrawEth(destination, {
      value: amountInWei
    })

    const gasPrice = await lowNetworkProvider.getGasPrice()
    const estimatedFee = gasPrice.mul(estimatedGas)
    return ethers.utils.formatEther(estimatedFee)
  } catch (error) {
    console.error('Fee estimation failed:', error)
    throw error
  }
}
