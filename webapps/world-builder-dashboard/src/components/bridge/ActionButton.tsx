import React, {useState} from 'react';
import styles from "./ActionButton.module.css";
import { ethers } from "ethers";
import {ChainInterface, useBlockchainContext} from "@/components/bridge/BlockchainContext";
import {L3NetworkConfiguration} from "@/components/bridge/l3Networks";
import {useMutation, useQueryClient} from "react-query";
import {sendDepositTransaction} from "@/components/bridge/depositERC20";
import {Icon} from "summon-ui";
import {L2_CHAIN} from "../../../constants";
import {sendWithdrawTransaction} from "@/components/bridge/withdrawNativeToken";


interface ActionButtonProps {
    direction: "DEPOSIT" | "WITHDRAW";
    l3Network: L3NetworkConfiguration;
    amount: string;
}
const ActionButton: React.FC<ActionButtonProps> = ({direction, amount, l3Network}) => {
    const [isConnecting, setIsConnecting] = useState(false);
    const {connectedAccount, walletProvider, checkConnection, switchChain } = useBlockchainContext();

    const getLabel = (): String | undefined => {
        if (isConnecting || deposit.isLoading) { return undefined }
        if (!connectedAccount || !walletProvider) {
            return 'Connect wallet'
        }
        return direction.toLowerCase();
    }

    // Function to request connection to a MetaMask wallet
    const connectWallet = async () => {
        if (typeof window.ethereum !== 'undefined') {
            try {
                setIsConnecting(true);
                const provider = new ethers.providers.Web3Provider(window.ethereum);
                await provider.send("eth_requestAccounts", []);
                const signer = provider.getSigner();
                console.log('Connected account:', await signer.getAddress());
            } catch (error) {
                console.error('Error connecting to wallet:', error);
            } finally {
                setIsConnecting(false);
            }
        } else {
            alert("Wallet is not installed. Please install it to use this feature.");
        }
    };

    const handleClick = async () => {

        if (connectedAccount && walletProvider) {
            const accounts = await walletProvider.listAccounts();
            if (accounts.length === 0) {
                await connectWallet();
            }
            if (direction === 'DEPOSIT') {
                if (window.ethereum) {
                    const provider = new ethers.providers.Web3Provider(window.ethereum);
                    const currentChain = await provider.getNetwork()
                    if (currentChain.chainId !== L2_CHAIN.chainId) {
                        try {
                            await switchChain(L2_CHAIN);
                            deposit.mutate();
                        } catch (error) {
                            console.log(error);
                        }
                    } else {
                        deposit.mutate();
                    }
                }
            }
            if (direction === 'WITHDRAW') {
                if (window.ethereum) {
                    const provider = new ethers.providers.Web3Provider(window.ethereum);
                    const currentChain = await provider.getNetwork()
                    if (currentChain.chainId !== l3Network.chainInfo.chainId) {
                        try {
                            const chainToSwitch: ChainInterface = {
                                name: l3Network.chainInfo.chainName,
                                chainId: l3Network.chainInfo.chainId,
                                rpcs: l3Network.chainInfo.rpcs,

                            }
                            await switchChain(chainToSwitch);
                            withdraw.mutate();
                        } catch (error) {
                            console.log(error);
                        }
                    } else {
                        withdraw.mutate();
                    }
                }
            }
            return;
        }
        if (typeof window.ethereum !== 'undefined') {
            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const accounts = await provider.listAccounts();
            if (accounts.length === 0) {
                await connectWallet();
            } else {
                checkConnection();
                console.log('Wallet already connected');
            }
        } else {
            alert("Wallet is not installed. Please install it to use this feature.");
        }
    };

    const queryClient = useQueryClient();
    const deposit = useMutation(
        () => {
            if (!(connectedAccount && walletProvider)) {
                throw new Error("Wallet isn't connected");
            }
            if (window.ethereum) {
                const provider = new ethers.providers.Web3Provider(window.ethereum); //can't use provider from the context because of 'underlying network changed' error after switch
                return sendDepositTransaction(amount, connectedAccount, l3Network, provider);
            }
            throw new Error('no window.ethereum');
        },
        {
            onSuccess: (receipt: ethers.providers.TransactionReceipt) => {
                queryClient.refetchQueries("l2Balance")
                console.log(receipt);
            }
        }
    );
    const withdraw = useMutation(
        () => {
            if (!(connectedAccount && walletProvider)) {
                throw new Error("Wallet isn't connected");
            }
            return sendWithdrawTransaction(amount, connectedAccount);
            throw new Error('no window.ethereum');
        },
        {
            onSuccess: (receipt: ethers.providers.TransactionReceipt) => {
                queryClient.refetchQueries("l3balance")
                console.log(receipt);
            }
        }
    );


  return (
      <button className={styles.container} onClick={handleClick} disabled={isConnecting}>
          {getLabel() ?? <Icon name={"Loading01"} color={'white'} className={styles.rotatable} /> }
      </button>
  );
};

export default ActionButton;
