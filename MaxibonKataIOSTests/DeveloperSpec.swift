//
//  DeveloperSpec.swift
//  MaxibonKataIOS
//
//  Created by Pedro Cid on 25/3/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import XCTest
import SwiftCheck
@testable import MaxibonKataIOS

class DeveloperSpec: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAll(){
    
        property("number of maxibons to consume not negative") <- forAll {
        
            (developer: Developer) in
            
            print(developer)
            return developer.numberOfMaxibonsToGet >= 0
        }
    }
}
