import UIKit

func threexplus1(num:Int) {
    if num%3 == 1 {
        defer {
            print("A")
        }
        print("B")
    } else {
        print("C")
    }
    print("D")
}

threexplus1(num: 7)
