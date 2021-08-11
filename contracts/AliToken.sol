pragma solidity 0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AliToken is ERC20 {
    uint256 public conversionRate = 15;

    event TokenPurchase(
        address indexed _buyer,
        uint256 tokensBought,
        uint256 Cost
    );

    constructor(uint256 _initialsupply) ERC20("AliCoin", "AIC") {
        _mint(address(this), _initialsupply);
    }

    function getQuote(uint256 cost) public view returns (uint256) {
        return (cost * conversionRate);
    }

    function TopUp() public payable {
        uint256 payment = msg.value;
        require(payment > 0, "You need to send some ether");
        uint256 available = this.balanceOf(address(this));
        uint256 needed = payment * conversionRate;

        require(needed < (available * 10**18), "Not enough tokens available");

        _transfer(address(this), msg.sender, needed / (10**18));

        emit TokenPurchase(msg.sender, needed, payment);
    }
}

// payment 1 /15 =
