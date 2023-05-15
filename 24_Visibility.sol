// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Visibility {
    /*
    public -> any contract and any account and any function(can inherit)
    privat -> inside the contract functions ( can not inherit)
    internal->inside contract,can inherit to another contract
    external-> other contrat, accounts can also access(can inherit)
    */

    function privateFunc() private pure returns(string memory){
        return "private function called";
    }

    function changeFunc() public pure returns(string memory) {
        return privateFunc();
    }

    function internalFunc() internal pure returns(string memory){
        return "internal func called";
    }

    function testInternalFunc() public pure returns (string memory){
        return internalFunc();
    }

   // public & external
   // public hem değişkenler hem de fonksiyonlar için kullanılır.
   //external sadece fonksiyonlar için kullanılır

   function publicFunc() public pure returns(string memory){
       return "Public function called";
   }

   function externalFunc()public pure returns(string memory){
       return "external func called";
   }
    // Private,Internal ve public erişim belirleyici ile kullanılabilir

    string private privateVar = "Private variable";
    string internal internalVar = "Internal variable";
    string public publicVar = "Public Variable";
    //Değişkenler external olmazlar
    //string external externalVar = "External variable";

    //External daha az gaz tüketir ->Public fonksiyonlara göre
    //çünkü public fonksiyonlarda default olarak get islevi bulunur.
}


contract Child is Visibility{
    /*
    function privateFunc() private pure returns (string memory){
        return "Child private func";
    }
    */

    function example () public pure returns(string memory,string memory){
        return (internalFunc(),publicFunc());
    }

    
}