//
//  KarumiHQsSpec.swift
//  MaxibonKataIOS
//
//  Created by Pedro Cid on 25/3/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import XCTest
import SwiftCheck
@testable import MaxibonKataIOS


class KarumiHQsSpec: XCTestCase {
    
    override func setUp() {
        super.setUp()
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAll(){
    
        property("number of remaining maxibons is always > 2") <- forAll {
        
            (developer: Developer) in
            
            let karumiHQs = KarumiHQs()
            
            karumiHQs.openFridge(developer)
            
            return karumiHQs.maxibonsLeft > 2
            
        }
        
        property("if some karumies take maxibons, remaining maxibons is always > 2") <- forAll {
            
            (developers: ArrayOf<Developer>) in
            
            let karumiHQs = KarumiHQs()
            
            karumiHQs.openFridge(developers.getArray)
            
            return karumiHQs.maxibonsLeft > 2
            
        }
        
        property("if maxibons left <= 2, message is sent ") <- forAll(Developer.arbitraryHungry) {
            
            (developer: Developer) in
            
            let mockChat = MockChat()
            let karumiHQs = KarumiHQs(chat: mockChat)
            
            karumiHQs.openFridge(developer)
            
            let expectedResult = mockChat.messageSent == "Hi guys, I'm \(developer). We need more maxibons!"
            mockChat.messageSent = nil
            return expectedResult
            
        }
        
        property("if maxibons left > 2, message is not sent ") <- forAll(Developer.arbitraryNotSoHungry) {
            
            (developer: Developer) in
            
            let mockChat = MockChat()
            let karumiHQs = KarumiHQs(chat: mockChat)
            
            karumiHQs.openFridge(developer)
            
            let expectedResult = mockChat.messageSent == nil
            mockChat.messageSent = nil
            return expectedResult
            
        }
    }
}
