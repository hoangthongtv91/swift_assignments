//
//  main.swift
//  SwiftOptional
//
//  Created by Thong Hoang Nguyen on 2019-03-06.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

enum Optional<T>{
    case none
    case some(val:T)
}

var hello: String?
var hello1: Optional<String> = .none

var hi:String? = "hi"
var hi1: Optional<String> = .some(val: "Hi")

print(hello!)
switch hello1{
case .none:
    print("Throw an exception")
case .some(let value):
    print(value)
}


if let hello = hello{
    print(hello)
}else{
    print("It is nil")
}
switch hello1{
case .none: print("It is nil")
case .some(let value):print(value)
}


var hello2: String!
var hello3: Optional<String> = .none

print(hello2)

switch hello3{
case .none: print("crash")
case .some(let val): print(val)
}


//nil_coaslesing (Optional Defaulting)
var x: String? = nil
// x =...

var y = x ?? "Hello"

var xx:Optional<String> = .none

switch xx{
case .none: y = "hello"
case .some(let val): y = val
}


let x
