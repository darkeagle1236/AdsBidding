// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract AdsBidding is Ownable{
    struct BidDetail{
        address currentBidder;
        uint256 currentPrice;
    }
    mapping (uint256=>BidDetail) currentBid;
    event BidUpdated(uint256 adsIndex,uint256 newPrice);
    function setInitialBid(uint256 _adsIndex,uint256 _initialPrice) public onlyOwner{
        currentBid[_adsIndex].currentBidder = msg.sender;
        currentBid[_adsIndex].currentPrice = _initialPrice;
        emit BidUpdated(_adsIndex, _initialPrice);
    }

    function bid(uint256 _adsIndex,uint256 _bid) public payable{
        require(msg.value > currentBid[_adsIndex].currentPrice,"You must bid higher");
        currentBid[_adsIndex].currentPrice = _bid;
        currentBid[_adsIndex].currentBidder = msg.sender;
        emit BidUpdated(_adsIndex, _bid);
    }
    function withdrawAllTo(address payable _to)public onlyOwner{
        _to.transfer(address(this).balance);
    }
    receive() external payable{
        
    }
}