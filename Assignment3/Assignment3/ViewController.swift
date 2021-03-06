//
//  ViewController.swift
//  Assignment3
//
//  Created by Ivan Vasilevich on 04.03.2020.
//  Copyright © 2020 RockSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //    Задача 1. Создать строку с своим именем, вывести количество символов содержащихся в ней.
    
    func countStringCharacters(name: String) -> Int {
        return name.count
    }
    
    //    Задача 2. Создать строку с своим отчеством проверить его на окончание “ич/на”
    
    func checkPatronomic(name: String) -> Bool {
        if name.hasSuffix("ich") {
            return true
        }
        if name.hasSuffix("vna") {
            return true
        }
        else {
            return false
        }
    }
    
    //    Задача 3. Cоздать строку, где слитно написано Ваши ИмяФамилия “IvanVasilevich"
    
    func divideCredentials(fullName: String) -> String {
      var newStringArray: [String] = []
      for character in fullName {
          if String(character) == String(character).uppercased() {
              newStringArray.append(" ")
          }
          newStringArray.append(String(character))
      }
      let finalResult = newStringArray.joined(separator: "").substring(from: 1)
      return finalResult
    }
    
    //    Задача 4. Вывести строку зеркально Ось → ьсО не используя reverse
    
    func mirrorString(input: String) -> String {
        var str = ""
        for character in input {
            str = "\(character)" + str
        }
        return str
    }
    
    //    Задача 5. Добавить запятые в строку как их расставляет калькулятор
    
    func formatNumber(input: String, separator: String) -> String {
        var newText : String = ""
        for character in input {
            newText.insert(character, at: newText.startIndex)
        }
        var result : String = ""
        for (index , number) in newText.enumerated() {
            if index != 0 && index % 3 == 0 {
                result.append(separator)
            }
            result.append(number)
        }
        var finalResult : String = ""
        for i in result {
            finalResult.insert(i, at: finalResult.startIndex)
        }
        return finalResult
    }
    
    //    Задача 6. Проверить пароль на надежность от 1 до 5
    
    func checkPassword(password: String) -> Int {
        var markNumbers = 0
        var markLetter = 0
        var markUppercased = 0
        var markSymbol = 0
        var totalScore = 0
        for character in password {
            if character.isNumber {
                markNumbers += 1
            }
            if character.isLetter {
                markLetter += 1
            }
            if character.isUppercase {
                markUppercased += 1
            }
            if character.isPunctuation {
                markSymbol += 2
            }
        }
        if markNumbers >= 1 {
            totalScore += 1
        }
        if markLetter >= 1 {
            totalScore += 1
        }
        if markUppercased >= 1 {
            totalScore += 1
        }
        if markSymbol >= 1 {
            totalScore += 2
        }
        return totalScore
    }


    //    Задача 7. Сортировка массива не встроенным методом по возрастанию + удалить дубликаты

    func sortArrayAndRemoveDuplicates(input: [Int]) -> [Int] {
            let noDuplicates = Array(Set(input))
            var sortedArray = noDuplicates
            for x in 1..<sortedArray.count {
                var y = x
                while y > 0 && sortedArray[y] < sortedArray[y - 1] {
                    sortedArray.swapAt(y - 1, y)
                    y -= 1
                }
            }
            return sortedArray
        }

    //    Задача 8. Написать метод, который будет переводить строку в транслит.

    func translite(input: String) -> String {
        var result = ""
        let dictionary = ["Я" : "YA",
                          "З" : "Z",
                          "м": "m",
                          "о" : "o",
                          "р": "r",
                          "Д" : "D",
                          "а" : "a",
                          "П" : "P",
                          "ч": "ch",
                          "е": "e",
                          "с": "s",
                          "т" : "t",
                          "ь" : ""]
        for letter in input {
            for (key, value) in dictionary {
                
                if letter == key.first {
                    result.append(contentsOf: value)
                }
            }
        }
        return result
    }

    //    Задача 9. Сделать выборку из массива строк в которых содержится указанная строка

    func sortArray(input: [String], searchRequest: String) -> [String] {
        var result : [String] = []
        for search in input {
            if search.contains(searchRequest) {
                result.append(search)
            }
        }
        return result
    }

    //    Задача 10. Убрать запрещенные слова из текста

    func filterText(input: String, bannedWords: [String]) -> String {
        let newText = input.replacingOccurrences(of: ",", with: " ,").replacingOccurrences(of: ".", with: " . ").replacingOccurrences(of: "\n", with: " \n ").components(separatedBy: " ")
        var result : [String] = []
        for word in newText {
            if bannedWords.contains(word) {
                var stars = ""
                for star in 0..<(word.count) {
                    stars.append("*")
                }
                result.append(stars)
            }
            else {
                result.append(word)
            }
        }
        print(result)
        let finalResult = result.joined(separator: " ").replacingOccurrences(of: " ,", with: ",").replacingOccurrences(of: " . ", with: ".").replacingOccurrences(of: " \n ", with: "\n")
        return finalResult
    }

}

