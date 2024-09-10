import { ethers } from 'ethers';
import { TokenSenderABI } from '../abis/TokenSenderABI';
import { GAME7_TESTNET_RPC_URL, KMS_CREDENTIALS, TOKEN_SENDER_ADDRESS } from '../config';
import { AwsKmsSigner } from '../utils/ethers-aws-kms-signer';

export class FaucetService {
  tokenSender: ethers.Contract;
  constructor() {
    const provider = new ethers.JsonRpcProvider(GAME7_TESTNET_RPC_URL);
    const signer = new AwsKmsSigner(KMS_CREDENTIALS).connect(provider)
    this.tokenSender = new ethers.Contract(
      TOKEN_SENDER_ADDRESS,
      TokenSenderABI,
      signer
    );
  }

  async requestFaucet(recipientAddress: string) {
      const tx = await this.tokenSender.send(recipientAddress);
      await tx.wait();
      return tx.hash
  }
}
