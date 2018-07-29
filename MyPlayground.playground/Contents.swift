import Foundation

func random(_ n: Int) -> Int {
    return Int(arc4random_uniform(UInt32(n)))
}

var arr = [1,2,3,4,5]

for i in 0 ..< arr.count-2 {
    var j = i + random(arr.count-i)
    (arr[i], arr[j]) = (arr[j], arr[i])
}

print(arr)

var a = 1
var b = 2
// swap
(a,b) = (b,a)

print(a)
print(b)
