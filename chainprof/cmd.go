package chainprof

import (
	"encoding/hex"
	"encoding/json"
	"fmt"
	"math/big"
	"os"

	"github.com/ethereum/go-ethereum/common"
	"github.com/spf13/cobra"
)

func CreateChainprofCommand() *cobra.Command {
	chainprofCmd := &cobra.Command{
		Use:   "chainprof",
		Short: "Chain profiler",
		Long:  "Chain profiler which can be used to profile the performance of a rollup.",
		Run: func(cmd *cobra.Command, args []string) {
			cmd.Help()
		},
	}

	accountsCmd := CreateAccountsCommand()
	evaluateCmd := CreateEvaluateCommand()

	chainprofCmd.AddCommand(accountsCmd, evaluateCmd)

	return chainprofCmd
}

func CreateEvaluateCommand() *cobra.Command {
	var accountsDir, calldataRaw, outfile, rpc, toRaw, valueRaw string
	var transactionsPerAccount uint

	type profile struct {
		Accounts               []common.Address
		RPC                    string
		Calldata               string
		To                     string
		Value                  string
		TransactionsPerAccount uint
		Transactions           map[string]string
		Times                  map[string][]uint
	}

	var value *big.Int
	var to common.Address
	var calldata []byte

	var hexDecodeCalldataErr error

	evaluateCmd := &cobra.Command{
		Use:   "evaluate",
		Short: "Run an evaluation",
		PreRunE: func(cmd *cobra.Command, args []string) error {
			if calldataRaw != "" {
				calldata, hexDecodeCalldataErr = hex.DecodeString(calldataRaw)
				if hexDecodeCalldataErr != nil {
					return hexDecodeCalldataErr
				}
			}

			if !common.IsHexAddress(toRaw) {
				return fmt.Errorf("invalid \"to\" address: %s", toRaw)
			}
			to = common.HexToAddress(toRaw)

			value = new(big.Int)
			if valueRaw != "" {
				_, ok := value.SetString(valueRaw, 10)
				if !ok {
					return fmt.Errorf("invalid value: %s", valueRaw)
				}
			} else {
				value.SetInt64(0)
			}

			return nil
		},
		RunE: func(cmd *cobra.Command, args []string) error {
			result := profile{
				Accounts:               []common.Address{},
				RPC:                    rpc,
				Calldata:               string(calldata),
				To:                     to.String(),
				Value:                  value.String(),
				TransactionsPerAccount: transactionsPerAccount,
				Transactions:           map[string]string{},
				Times:                  map[string][]uint{},
			}

			resultBytes, marshalErr := json.Marshal(result)
			if marshalErr != nil {
				return marshalErr
			}

			if outfile != "" {
				writeErr := os.WriteFile(outfile, resultBytes, 0644)
				if writeErr != nil {
					return writeErr
				}
			} else {
				cmd.Println(string(resultBytes))
			}

			return nil
		},
	}

	evaluateCmd.Flags().StringVar(&accountsDir, "accounts-dir", "", "Directory containing accounts to use when profiling the chain")
	evaluateCmd.Flags().StringVar(&calldataRaw, "calldata", "", "Calldata for profiling transactions")
	evaluateCmd.Flags().StringVar(&outfile, "outfile", "", "File to write profile to")
	evaluateCmd.Flags().StringVar(&rpc, "rpc", "", "RPC endpoint for the chain being profiled")
	evaluateCmd.Flags().StringVar(&toRaw, "to", "", "Address to send profiling transactions to")
	evaluateCmd.Flags().StringVar(&valueRaw, "value", "", "Value to send with profiling transactions")
	evaluateCmd.Flags().UintVar(&transactionsPerAccount, "transactions-per-account", 1, "Number of profiling transactions to send per account")

	return evaluateCmd
}

func CreateAccountsCommand() *cobra.Command {
	accountsCmd := &cobra.Command{
		Use:   "accounts",
		Short: "Create, fund, or drain profiling accounts",
		Run: func(cmd *cobra.Command, args []string) {
			cmd.Help()
		},
	}

	createCmd := CreateAccountsCreateCommand()
	fundCmd := CreateAccountsFundCommand()
	drainCmd := CreateAccountsDrainCommand()
	accountsCmd.AddCommand(createCmd, fundCmd, drainCmd)

	return accountsCmd
}

func CreateAccountsCreateCommand() *cobra.Command {
	createCmd := &cobra.Command{
		Use:   "create",
		Short: "Create profiling accounts",
		Run: func(cmd *cobra.Command, args []string) {
			cmd.Help()
		},
	}
	return createCmd
}

func CreateAccountsFundCommand() *cobra.Command {
	fundCmd := &cobra.Command{
		Use:   "fund",
		Short: "Fund profiling accounts",
		Run: func(cmd *cobra.Command, args []string) {
			cmd.Help()
		},
	}
	return fundCmd
}

func CreateAccountsDrainCommand() *cobra.Command {
	drainCmd := &cobra.Command{
		Use:   "drain",
		Short: "Drain profiling accounts",
		Run: func(cmd *cobra.Command, args []string) {
			cmd.Help()
		},
	}
	return drainCmd
}
