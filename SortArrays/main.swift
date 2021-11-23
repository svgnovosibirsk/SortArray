//На входе функция получает параметр n - натуральное число.
//Генерируется n-массивов, они заполняются случайными числами,
//каждый массив имеет случайный размер. Размеры массивов не совпадают.
//Массивы сортируются. Массивы с четным порядковым номером сортируются по возрастанию,
//с нечетным порядковым номером - по убыванию.
//Функция возвращает массив с отсортированными массивами.

import Foundation

// MARK: - Переменные
var arrayOfArrays:[[Int]] = []
var sizeArray: [Int] = []
var n = "0"

// MARK: - Переменные для настройки программы
var possibleSizes = 20
let rangeOfNumbers = 100

// MARK: - Выполнение программы
print("введите число")

n = readLine() ?? "0"
let intN = Int(n) ?? 0

let result = sortArraysInArrayOfArrays(number: intN)
print(result)


// MARK: - Вспомогательные функции
// Заполняем вспомогательный массив размерами создаваемых массивов
private func fillSizeArray(count: Int) {
    if possibleSizes < count {
        possibleSizes *= 2
    }
    var isAddedSize = false
    for _ in 0..<count {
        isAddedSize = false
        while isAddedSize != true {
            let size = Int.random(in: 1...possibleSizes)
            if !sizeArray.contains(size) {
                sizeArray.append(size)
            }
            isAddedSize = true
        }
    }
}

// Заполняем массив массивов значениями
private func fillArrayOfArrays() {
    for i in 0..<sizeArray.count {
        var array:[Int] = []
        for _ in 0...sizeArray[i] {
            let number = Int.random(in: 1...rangeOfNumbers)
            array.append(number)
        }
        arrayOfArrays.append(array)
    }
}

// MARK: - Основная функция
private func sortArraysInArrayOfArrays(number: Int) -> [[Int]] {
    fillSizeArray(count: number)
    fillArrayOfArrays()
    
    var finalArray:[[Int]] = []
    for (index, element) in arrayOfArrays.enumerated() {
        if index % 2 == 0 {
            let temp = element.sorted(by: {first, second in
                first > second
            })
            finalArray.append(temp)
        } else {
            let temp = element.sorted(by: {first, second in
                first < second
            })
            finalArray.append(temp)
        }
    }
    return finalArray
}
        
        
        
