# SafeAtom_Vote
 Vote contract v1.0.0 for SafeAtom Token 
Install Guide and Launch
1. Use Remix or Web3.js from Vote contract deployment. You can use files from our Token contract to deploy it
2. Pass your token contract constructor to the Vote Contract.
3. You should specify the interval for the vote in Start method.

# Rules Of The Vote
1. Everyone can vote 1 time per period. see startTime, endTime, timeInterval values, to get the time of the Vote. check on https://www.unixtimestamp.com/ the time.
2. You should specify all 3 values CDSR, CDAL and SwapAndLiquify on Voting. if you send a 0 value in any of the sectors, then this sector is skipped.
3. The first one to vote after endTime will trigger the geting result of the vote and reseting the vote for the next round.
4. All the results of the vote are saved in contract data and can be checked by ResultByRound function.
5. All reported for vote abuse participants will get their account banned and excluded from RFI reward on the token.
6. The more tokens you have at the moment of voting, the more powerful is your vote ability. Your points of voting = current balance of the token.
7. The first round of vote will last 2 weeks. all the next rounds will be 1 month.

#Happy Voting!
The app will be soon ready on safeatom.app
Currently it is in test version
