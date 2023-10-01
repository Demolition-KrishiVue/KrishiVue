// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/shared/access/ConfirmedOwner.sol";


contract FetchFromArray is ChainlinkClient, ConfirmedOwner {

    string[] public weatherArray;
    using Chainlink for Chainlink.Request;

    address public insurer;

    uint premium;

    string public weatherToday;

    bytes32 private jobId;
    uint256 private fee;

     enum WeatherCondition {
        Sunny,
        MostlySunny,
        PartlySunny,
        IntermittentClouds,
        Cloudy,
        Rain,
        T_Storms
    }

    event RequestFirstId(bytes32 indexed requestId, string id);

    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        setChainlinkOracle(0x6090149792dAAeE9D1D568c9f9a6F6B46AA29eFD);
        jobId = "7d80a6386ef543a3abb52817f6707e3b";
        fee = (1 * LINK_DIVISIBILITY) / 10; // 0,1 * 10**18 (Varies by network and job)
        insurer = msg.sender; // The contract creator is the insurer

    }

    function getPremium(uint _premium) public {
        premium=_premium;
    }
 
    function requestFirstId() public returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );

        req.add(
            "get",
            "http://dataservice.accuweather.com/currentconditions/v1/349727?apikey=IXGQ3hsvmwBkqw68GbLJUmD9u9QGPwGP"
        );

        
        req.add("path", "0,WeatherText"); 
        return sendChainlinkRequest(req, fee);
    }
    

    function fulfill(
        bytes32 _requestId,
        string memory _id
    ) public recordChainlinkFulfillment(_requestId) {
        emit RequestFirstId(_requestId, _id);
        weatherToday = _id;
        weatherArray.push(weatherToday);
    }


    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }
     function payPremium() public   {
        require(weatherArray.length == 20, "Array length must be 20");
        
        uint256 count = 0;
        for (uint256 i = 0; i < weatherArray.length; i++) {
            if (keccak256(abi.encodePacked(weatherArray[i])) == keccak256(abi.encodePacked("T-Storms"))) {
                count++;
            }
        }
        
        if (count>15){
           uint256 paymentAmount = premium * 25 / 10; // 2.5 times the received amount
           payable(msg.sender).transfer(paymentAmount);
        }

        else if (count>10 && count<=15){
            uint256 paymentAmount = premium * 15 / 10; // 2.5 times the received amount
           payable(msg.sender).transfer(paymentAmount);
        }

        else if (count <=10 && count >5){
            uint256 paymentAmount = premium * 5 / 10; // 2.5 times the received amount
           payable(msg.sender).transfer(paymentAmount);
        }
        
    }
    
    receive() external payable {}

}