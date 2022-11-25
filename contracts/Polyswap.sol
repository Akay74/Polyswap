// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract PolySwap is ERC20 {
    using SafeMath for uint256;

    IERC20 public AiSwap;
    IERC20 public BiSwap;
    IERC20 public Polycoin;

    uint256 public polycoinPrice = 1;

    /**
     * @dev sets values for
     * @param _aiSwapToken address of token to be swapped
     * @param _biSwapToken address of token to be swapped
     * @param _name name of ERC20 Polycoin token to be deployed
     * @param _symbol symbol of ERC20 Polycoin token to be deployed
    */
    constructor(
        IERC20 _aiSwapToken,
        IERC20 _biSwapToken,
        string memory _name,
        string memory _symbol
    ) ERC20(_name, _symbol) {
        AiSwap = _aiSwapToken;
        BiSwap = _biSwapToken;
        Polycoin = IERC20 (address(this));
        _mint(address(this), 1000000 * 10 ** 18);
    }

    function mintPolycoin(address _account, uint256 _amount) public {
        _mint(_account, _amount);
    }

    function burnPolycoin(address _account, uint256 _amount) public {
        _burn(_account, _amount);
    }

    function getPolycoinPrice() public view returns(uint256) {
        return polycoinPrice;
    }

    function setPolycoinPrice(uint256 _newPolycoinPrice) public {
        polycoinPrice = _newPolycoinPrice;
    }

    /**
     * Swap an amount of input _token to an equivalent amount of the output token
     *
     * @param _token address of token to swap
     * @param amount amount of token to swap/receive
     */
    function swap(address _token, uint256 amount) external {
        _swapToken(address(_token), amount);
    }

    /**
     * Swap an amount of the output token to an equivalent amount of input _token
     *
     * @param _token address of token to receive
     * @param amount amount of token to swap
     */
    function unswap(address _token, uint256 amount) external {
        _unswapToken(address(_token), amount);
    }

    /**
     * Convert an amount of AiSwap token to an equivalent amount of the output Polycoin token
     *
     * @param amount amount of token to swap
     */
    function swapAiSwapforPolycoin(uint256 amount) external {
        _swapToken(address(AiSwap), amount);
    }

    /**
     * Convert an amount of BiSwap token to an equivalent amount of the output Polycoin token
     *
     * @param amount amount of token to swap
     */
    function swapBiSwapforPolycoin(uint256 amount) external {
        _swapToken(address(BiSwap), amount);
    }

    /**
     * Convert an amount of Polycoin to an equivalent amount of AiSwap
     *
     * @param amount amount of token to swap
     */
    function unswapPolycoinforAiSwap(uint256 amount) external {
        _unswapToken(address(AiSwap), amount);
    }

    /**
     * Convert an amount of Polycoin to an equivalent amount of BiSwap
     *
     * @param amount amount of token to swap
     */
    function unswapPolycoinforBiSwap(uint256 amount) external {
        _unswapToken(address(BiSwap), amount);
    }

    /**
     * Convert an _amount of input _token to an equivalent amount of the output token
     *
     * @param _token address of token to swap
     * @param _amount amount of token to swap
     */
    function _swapToken(address _token, uint256 _amount) private {
        uint256 amountToSwap = _amount.div(polycoinPrice);
        require(
            (IERC20(_token).allowance(msg.sender, address(this)) >= _amount),
            "transfer amount exceeds allowance"
        );
        require(
            Polycoin.balanceOf(address(this)) >= amountToSwap,
            "transfer amount exceeds balance"
        );
        require(
            IERC20(_token).transferFrom(msg.sender, address(this), _amount),
            "Swap failed"
        );
        require(Polycoin.transfer(msg.sender, amountToSwap), "Transfer failed");
    }

    /**
     * Convert an _amount of the output token to an equivalent amount of input _token
     *
     * @param _token address of token to receive
     * @param _amount amount of token to swap
     */
    function _unswapToken(address _token, uint256 _amount) private {
        uint256 amountToSwap = _amount.mul(polycoinPrice);
        require(
            (Polycoin.allowance(msg.sender, address(this)) >= _amount),
            "transfer amount exceeds allowance"
        );
        require(
            IERC20(_token).balanceOf(address(this)) >= amountToSwap,
            "transfer amount exceeds balance"
        );
        require(
            Polycoin.transferFrom(msg.sender, address(this), _amount),
            "swap failed"
        );
        require(IERC20(_token).transfer(msg.sender, amountToSwap), "transfer failed");
    }
}