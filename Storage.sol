// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract StorageContract {
    // Определение структуры с несколькими полями
    struct MyStruct {
        uint256 integerValue;
        address addressValue;
        string stringValue;
        bool booleanValue;
    }

    // Определение отображения для хранения структур
    mapping(uint256 => MyStruct) public myStructMapping;

    // События для отслеживания добавления и удаления структур
    event StructAdded(uint256 key, uint256 integerValue, address indexed addressValue, string stringValue, bool booleanValue);
    event StructRemoved(uint256 key);

    // Функция для добавления структуры в отображение
    function addStruct(uint256 key, uint256 integerValue, address addressValue, string calldata stringValue, bool booleanValue) public {
        // Создание нового экземпляра структуры
        MyStruct memory newStruct = MyStruct({
            integerValue: integerValue,
            addressValue: addressValue,
            stringValue: stringValue,
            booleanValue: booleanValue
        });

        // Добавление структуры в отображение
        myStructMapping[key] = newStruct;

        // Генерация события
        emit StructAdded(key, integerValue, addressValue, stringValue, booleanValue);
    }

    // Функция для удаления структуры из отображения
    function removeStruct(uint256 key) public {
        // Удаление структуры из отображения
        delete myStructMapping[key];

        // Генерация события
        emit StructRemoved(key);
    }

    // Функция для получения текущего значения структуры по ключу
    function getStruct(uint256 key) public view returns (MyStruct memory) {
        return myStructMapping[key];
    }
}
