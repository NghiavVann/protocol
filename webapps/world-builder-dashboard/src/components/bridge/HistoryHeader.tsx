import React from 'react';
import styles from "./HistoryHeader.module.css";
import {Icon} from "summon-ui";
import {L2ToL1MessageStatusResult} from "@/hooks/useL2ToL1MessageStatus";
import {L2ToL1MessageStatus} from "@arbitrum/sdk";
import {useNavigate} from "react-router-dom";

interface HistoryHeaderProps {
    messages: (L2ToL1MessageStatusResult | undefined)[] | undefined;
}
const HistoryHeader: React.FC<HistoryHeaderProps> = ({messages}) => {
    const navigate = useNavigate();
  return (
  <div onClick={() => navigate('/bridge/transactions')}>
      {(!messages || !messages.some((m) => m?.status === L2ToL1MessageStatus.UNCONFIRMED || m?.status === L2ToL1MessageStatus.CONFIRMED)) && (
          <div className={styles.container}>
            <Icon className={styles.defaultIcon} name={'File06'} />
            <div className={styles.default}>See transaction history</div>
            <Icon className={styles.defaultIcon} name={"ArrowNarrowRight"} />
          </div>
      )}
      {messages && messages.some((m) => m?.status === L2ToL1MessageStatus.CONFIRMED) && (
          <div className={styles.claimable}>
              <Icon name={'AlertTriangle'} color={'#F79009'}/>
              <div className={styles.claimableCaption}>{`You must claim `}<span style={{fontWeight: 600}}>{`${messages.filter((m) => m?.status === L2ToL1MessageStatus.CONFIRMED).length} transactions`}</span></div>
              <Icon name={"ArrowNarrowRight"} color={'#B54708'}/>
          </div>
      )}
      {messages && messages.some((m) => m?.status === L2ToL1MessageStatus.UNCONFIRMED) && !messages.some((m) => m?.status === L2ToL1MessageStatus.CONFIRMED) && (
          <div className={styles.pending}>
              <Icon name={'SwitchHorizontal01'} color={'#4E5BA6'}/>
              <div className={styles.claimableCaption}>{`You have `}<span style={{fontWeight: 600}}>{`${messages.filter((m) => m?.status === L2ToL1MessageStatus.UNCONFIRMED).length} pending transactions`}</span></div>
              <Icon name={"ArrowNarrowRight"} color={'#363F72'}/>
          </div>
      )}
  </div>
  );
};

export default HistoryHeader;
