// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Upload{

    struct Access{
        address user; 
        bool access;
    }

    // image uploaded by a user
    // eg abc - img1,img2,img3....
    mapping(address=>string[]) value;
    // user1 given access to user2 or not
    // ownership[user1][user2] = true
    mapping(address=>mapping(address=>bool)) ownership;
    // AccessList[user1] -> user2,user3,user4
    mapping(address=>Access[]) accessList;

    // maintain previous state
    mapping(address=>mapping(address=>bool)) previousData;

    function add(address _user,string memory url) external {
        value[_user].push(url);
    }

    function allow(address user) external{
        ownership[msg.sender][user] = true;
        if(previousData[msg.sender][user]){
            for(uint i=0;i<accessList[msg.sender].length;i++){
                if(accessList[msg.sender][i].user==user){
                    accessList[msg.sender][i].access = true;
                }
            }
        }
        else{
            accessList[msg.sender].push(Access(user,true));
            previousData[msg.sender][user] = true;
        }
    }

    function disallow(address user) public{
        ownership[msg.sender][user] = false;
        for(uint i=0;i<accessList[msg.sender].length;i++){
            if(accessList[msg.sender][i].user == user){
                accessList[msg.sender][i].access = false;
            }
        }
    }

    function display(address user) external view returns(string[] memory){
        require(user==msg.sender || ownership[msg.sender][user],"You don't have access");
        return value[user];
    }

    function shareAccess() public view returns(Access[] memory){
        return accessList[msg.sender];
    }
}