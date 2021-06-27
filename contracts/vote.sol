pragma solidity ^0.6.12;
// SPDX-License-Identifier: Unlicensed
interface IERC20 {

    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);


    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    function name() external view returns (string memory);
    //view the name of the contract

    function setTaxFeePercent(uint256 taxFee) external;

    function setLiquidityFeePercent(uint256 liquidityFee) external;

    function setNumTokensSellToAddToLiquidity(uint256 amount) external;
    //vote contract can automatically set the fees and SwapAndLiquify trigger amount;

    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}



/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


/*
 * @dev Collection of functions related to the address type
 */

contract Ownable is Context {
    address private _owner;
    address private _previousOwner;
    uint256 private _lockTime;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

     /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    function getUnlockTime() public view returns (uint256) {
        return _lockTime;
    }

    //Locks the contract for owner for the amount of time provided
    function lock(uint256 time) public virtual onlyOwner {
        _previousOwner = _owner;
        _owner = address(0);
        _lockTime = now + time;
        emit OwnershipTransferred(_owner, address(0));
    }

    //Unlocks the contract for owner when _lockTime is exceeds
    function unlock() public virtual {
        require(_previousOwner == msg.sender, "You don't have permission to unlock");
        require(now > _lockTime , "Contract is locked until 7 days");
        emit OwnershipTransferred(_owner, _previousOwner);
        _owner = _previousOwner;
    }
}

contract Vote is Ownable {
    using SafeMath for uint256;


    IERC20 private _token; //inteface of token


    mapping (address=>uint256) public voted; //stores the time the user voted
    mapping (uint256=>resultOfRound) private resultsOfVoting;
    mapping (address=>bool) public banned; //store banned from vote addreses

    uint256[9] private taxFeeVoted; //stores the tax fee voting count for each value from 2 to 10
    uint256[9] private liquidityFeeVoted; //stores the liquidity fee voting count for each value from 2 to 10
    uint256[] private swapandliquifynumberVoted;//stores the swapandliquify value voting count for each value
    uint256[] public swapandliquifynumbers; //stores the swapandliquify values
    //stores the results of each Vote round. 1st dimension round. 2nd dimension taxfee->liquidityFee->swapandliquify value. 3rd value and winning score.
    struct resultOfRound{
        uint256 liquidityValue;
        uint256 liquidityMax;
        uint256 taxValue;
        uint256 taxMax;
        uint256 salValue;
        uint256 salMax;
        uint256 startTime;
        uint256 endTime;
    }

    //Vote timings
    uint256 public startTime;
    uint256 public endTime;
    uint256 public timeInterval;

    uint256 private currentRound;

    bool canVote;
    bool isPaused;
    bool isStarted;

    event Started(uint256 startTime, uint256 endtime, bool isStarted);
    event Paused(bool enabled);
    event UnPaused(bool disabled);
    event VoteLocked(bool enabled);
    event Voted(address who, uint256 time, uint256 balanceOf);
    event NextVoteStarted(uint256 startTime, uint256 endtime);
    event ValueAddedToSwapValues(uint256 value);
    event ValueDeletedFromSwapValues(uint256 value);
    event FeesAndSwapValueUpdated(uint256 tax, uint256 liquidity, uint256 SwapAndLiquifyValue);
    event TimeIntervalUpdated(uint256 interval);
    event Banned(address lawbreaker);
    event UnBanned(address lawbreaker);


    constructor (address token) public{
        _token = IERC20(token); //Vote contract should have rights to change the values of the tokencontract
        canVote=true;
        isPaused=false;
        isStarted=false;

        swapandliquifynumberVoted.push(0);
        // this value will not be used because of method in addVote has a check for 0 input

        swapandliquifynumbers.push(0);
        // this value will not be used because of method in addVote has a check for 0 input

        addValuesToSwapAndLiquifyValues(5000000000000000000000);
        addValuesToSwapAndLiquifyValues(1000000000000000000000);
        addValuesToSwapAndLiquifyValues(700000000000000000000);
        addValuesToSwapAndLiquifyValues(500000000000000000000);
        addValuesToSwapAndLiquifyValues(100000000000000000000);

    }

    modifier LockTheVote(){
        canVote=false;
        emit VoteLocked(true);
        _;
        canVote=true;
        emit VoteLocked(false);
    }
    //resets the vote results
    function _resetVote() private{
        for (uint256 i=0; i<taxFeeVoted.length; i++){
           taxFeeVoted[i]=0;
        }
        for (uint256 i=0; i<liquidityFeeVoted.length; i++){
           liquidityFeeVoted[i]=0;
        }
        for (uint256 i=1; i<swapandliquifynumberVoted.length; i++){
           swapandliquifynumberVoted[i]=0;
        }

    }
    //set the duration of the vote round in seconds
    //only will be applied after the round
    function setTimeInteval(uint256 value)public onlyOwner(){
        timeInterval=value;
        emit TimeIntervalUpdated(value);
    }
    function swapAndLiquifyNumbersLength() public view returns(uint256){
        return(swapandliquifynumbers.length);
    }
    //owner can ban users from vote
    function ban(address lawbreaker) public onlyOwner(){
        banned[lawbreaker]=true;
        emit Banned(lawbreaker);
    }
    //owner can unban users from vote
    function unBan(address lawbreaker) public onlyOwner(){
        banned[lawbreaker]=false;
        emit UnBanned(lawbreaker);
    }

    function Start(uint256 _timeinterval) public onlyOwner(){
        require(isStarted==false, "Already Started");
        currentRound=0;
        isStarted=true;
        _resetVote();
        startTime=now;
        setTimeInteval(_timeinterval);
        endTime=startTime+timeInterval;
        emit Started(startTime,endTime,isStarted);
    }

    function Pause() onlyOwner() public onlyOwner(){
        isPaused=true;
        emit Paused(true);
    }
    function Unpause() onlyOwner() public onlyOwner(){
        isPaused=false;
        emit UnPaused(true);
    }

    //adds new value for users to vote for swapandliquify trigger value
    function addValuesToSwapAndLiquifyValues(uint256 value) public LockTheVote() onlyOwner(){
        bool isInArray = false;
        for (uint256 i=1; i <swapandliquifynumbers.length; i++) {
            if (swapandliquifynumbers[i]==value){
                isInArray=true;
                break;
            }
        }
        if (isInArray){
            revert("Already added this value");
        } else {
            swapandliquifynumbers.push(value);
            swapandliquifynumberVoted.push(0);
            emit ValueAddedToSwapValues(value);
        }


    }
    //deletes the value for users to vote for swapandliquify trigger value
    function deleteValuesToSwapAndLiquifyValues(uint256 value) public LockTheVote() onlyOwner(){
        for (uint256 i=1; i <swapandliquifynumbers.length; i++) {
            if (swapandliquifynumbers[i]==value){
                swapandliquifynumbers[i]=swapandliquifynumbers[swapandliquifynumbers.length-1];
                swapandliquifynumberVoted[i]=swapandliquifynumbers[swapandliquifynumbers.length-1];
                swapandliquifynumbers.pop();
                swapandliquifynumberVoted.pop();
                emit ValueDeletedFromSwapValues(value);
                break;

            }
        }
    }

    function getResultsByRound(uint256 round) public view returns(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256){
        require(round<getCurrentRound(),"incorrect value");
        resultOfRound memory result = resultsOfVoting[round-1];
        return(result.taxValue,result.taxMax,result.liquidityValue,result.liquidityMax,result.salValue,result.salMax,result.startTime,result.endTime);
    }

    function getCurrentRound() public  view returns(uint256){
        return(currentRound+1);
    }

    function _addVote(uint256 taxFee, uint256 liquidityFee, uint256 swapandliquifynumber) private{
        voted[msg.sender]=now;
        //the more tokens the user has, the more powerful is his/her vote
        //users pays for gas only, no tokens are deducted from their balance
        //if a user entered a 0 value, it is considered that he skipped the vote on 1 of the sections
        uint256 balance=_token.balanceOf(msg.sender);
        if (taxFee!=0){
            taxFeeVoted[taxFee-2]=taxFeeVoted[taxFee-2].add(balance);
        }
        if (liquidityFee!=0){
            liquidityFeeVoted[liquidityFee-2]=liquidityFeeVoted[liquidityFee-2].add(balance);
        }
        if (swapandliquifynumber!=0){
            swapandliquifynumberVoted[swapandliquifynumber]=swapandliquifynumberVoted[swapandliquifynumber].add(balance);
        }
        emit Voted(msg.sender,now,balance);
    }

    function toVote(uint256 taxFee, uint256 liquidityFee, uint256 swapandliquifynumber) public {
        uint256 swapandliquifyvalue=0;
        bool isInArray=false;
        require(msg.sender!=owner(),"owner is not alowed to vote");
        require(!isPaused,"Vote is Paused");
        require(isStarted,"Vote hasn't started");
        require((taxFee>1 && taxFee<11) || taxFee == 0,"incorrect taxFee value");
        require((liquidityFee>1 && liquidityFee<11) || taxFee == 0,"incorrect liquidityFee value");
        require(!banned[msg.sender],"You have been banned from vote by Admin");
        require(_token.balanceOf(msg.sender)>0,"insufficient balance for voting");
        require(voted[msg.sender]<startTime || now>endTime,"already Voted");
        if (swapandliquifynumber!=0){
            for (uint256 i=1; i<swapandliquifynumbers.length; i++){
                if(swapandliquifynumbers[i]==swapandliquifynumber){
                    swapandliquifyvalue=i;
                    isInArray=true;
                    break;
                }
            }
            if(!isInArray){
                revert("incorrect swapandliquifynumber value");
            }
        }
        //the first user to vote after round finish time will trigger resultAndReset
        //which will finalize the result, make changes to the token contract and then reset the vote for the next round
        if (voted[msg.sender]>startTime){
            if (now>endTime){
                if(canVote){
                    resultAndReset();
                    _addVote(taxFee,liquidityFee,swapandliquifyvalue);
                } else revert("Vote is reseting");
            }

        } else {
            if(canVote){
                _addVote(taxFee,liquidityFee,swapandliquifyvalue);
            } else revert ("Vote is reseting");
        }


    }

    function resultAndReset() private LockTheVote(){
        uint256 swapandliquifynumberResult = 0;
        uint256 taxFeeResult=0;
        uint256 liquidityFeeResult=0;
        uint256 winnerI = 0;
        uint256 max = 0;


        //gets the most voted value of taxFee,liquidityFee and swapandliquifynumber
        //if any of the values is equal to 0 then no changes to the token contract are made
        for(uint256 i=0; i<swapandliquifynumberVoted.length;i++){
            if(swapandliquifynumberVoted[i]>=max && swapandliquifynumberVoted[i]!=0){
                winnerI = i;
                max=swapandliquifynumberVoted[i];
            }
        }
        if (winnerI!=0){
            _token.setNumTokensSellToAddToLiquidity(swapandliquifynumbers[winnerI]);
            swapandliquifynumberResult=swapandliquifynumbers[winnerI];
        }
        resultsOfVoting[currentRound].salValue=swapandliquifynumberResult;
        resultsOfVoting[currentRound].salMax=max;
        max=0;
        winnerI=20;
        for(uint256 i=0; i<liquidityFeeVoted.length;i++){
            if (liquidityFeeVoted[i]>=max&&liquidityFeeVoted[i]!=0){
                winnerI=i;
                max=liquidityFeeVoted[i];
            }
        }
        if (winnerI!=20){
            winnerI+=2;
            _token.setLiquidityFeePercent(winnerI);
            liquidityFeeResult=winnerI;
        }
        resultsOfVoting[currentRound].liquidityValue=liquidityFeeResult;
        resultsOfVoting[currentRound].liquidityMax=max;
        max=0;
        winnerI=20;
        for(uint256 i=0; i<taxFeeVoted.length;i++){
            if (taxFeeVoted[i]>=max&&taxFeeVoted[i]!=0){
                winnerI=i;
                max=taxFeeVoted[i];
            }
        }
        if (winnerI!=20){
            winnerI+=2;
            _token.setTaxFeePercent(winnerI);
            taxFeeResult=winnerI;
        }
        resultsOfVoting[currentRound].taxValue=taxFeeResult;
        resultsOfVoting[currentRound].taxMax=max;
        resultsOfVoting[currentRound].startTime=startTime;
        resultsOfVoting[currentRound].endTime=endTime;
        emit FeesAndSwapValueUpdated(taxFeeResult, liquidityFeeResult, swapandliquifynumberResult);
        //resets the vote for the next round
        currentRound++;
        _resetVote();
        startTime=endTime;
        endTime=startTime+timeInterval;
        emit NextVoteStarted(startTime,endTime);

    }
}
