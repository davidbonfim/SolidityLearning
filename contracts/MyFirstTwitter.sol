// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Twitter {

    uint256 public MAX_TWEET_LENGHT = 10;
    
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 like;
    }

    mapping(address => Tweet[] ) public tweets;

    function createTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= MAX_TWEET_LENGHT, "limit of characters passed");

        Tweet memory newTweet = Tweet({
            author:msg.sender,
            content:_tweet,
            timestamp:block.timestamp,
            like:0
        });
        
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory ){
        return tweets[_owner];
    }

}