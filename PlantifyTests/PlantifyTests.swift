//
//  PlantifyTests.swift
//  PlantifyTests
//
//  Created by Marina Lunts on 22.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import XCTest
@testable import Plantify

class PlantifyTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchOrders() throws {
        let expectation = XCTestExpectation(description: "ready")
        NetworkManager.shared.listOfOrders(onSuccess: { [weak self] (orders, _) in
            guard let orders = orders else {
                return
            }
            XCTAssertTrue(orders.count == 8)
            expectation.fulfill()
            
            }, onFailure: { [weak self] (error, _) in
                XCTFail("Error not covered by previous asserts.")
        })
        
        XCTAssertTrue(NetworkManager.baseServerPath == Environment.baseServerPath)
    }
    
    func testStringExtension() throws {
        let string = "Test Suite 'Selected tests' passed est Suite 'Selected tests' passed"
        let height = string.height(withConstrainedWidth: 20.0, font: UIFont.systemFont(ofSize: 18.0))
        
        XCTAssertGreaterThan(height, 30)
    }
    
    func testImageExtension() throws {
        let url = "https://miro.medium.com/max/992/1*mmf6CZBeAj2w0BW7xwynLQ.png"
        let imageview = UIImageView()
        let brokenUrl = "https://miro.medium.com/max/992/1*mmf6CZBeAj2w0BW7xwynLQ.ng"
        let brokenImageview = UIImageView()
        
        DispatchQueue.global().async { [weak self] in
            DispatchQueue.main.async {
                imageview.setCustomImage(url)
                brokenImageview.setCustomImage(brokenUrl)
                brokenImageview.setCustomImage("")
            }
        }
    }
    
    func testFlower() throws {
        let flower = Flower()
        
        XCTAssertEqual(L10n.plantInfoPoisoned, flower.poisonedString())
    }
    
    func testFlowerCountInCache() throws {
        let flower = Flower()
        flower.id = 1
        let flower2 = Flower()
        flower2.id = 2
        let flower3 = Flower()
        flower3.id = 3
        let flower4 = Flower()
        flower4.id = 4
        let flower5 = Flower()
        flower5.id = 5
        let flower6 = Flower()
        flower6.id = 6
        
        RecentFlowersManager.shared.addFlower(flower)
        RecentFlowersManager.shared.addFlower(flower2)
        RecentFlowersManager.shared.addFlower(flower3)
        RecentFlowersManager.shared.addFlower(flower4)
        RecentFlowersManager.shared.addFlower(flower5)
        RecentFlowersManager.shared.addFlower(flower)
        RecentFlowersManager.shared.addFlower(flower6)
        
        XCTAssertTrue(RecentFlowersManager.shared.getFlowers()!.count == 5)
        
    }
    
    func testRandomizer() throws {
        XCTAssertNotNil(ColorRandomiser().getColor())
    }
    
    func testFetchFlowerById() throws {
        let expectation = XCTestExpectation(description: "ready")
        NetworkManager.shared.getFlower(by: 1, onSuccess: { [weak self] (flower, _) in
            guard let flower = flower else {
                return
            }
            XCTAssertTrue(flower.name == "Gladiolus")
            expectation.fulfill()
            
            }, onFailure: { [weak self] (error, _) in
                XCTFail("Error not covered by previous asserts.")
        })
        
        XCTAssertTrue(NetworkManager.baseServerPath == Environment.baseServerPath)
    }
    
    func testClassification() throws {
        let expectation = XCTestExpectation(description: "ready")
        let image = Asset.rose.image
        NetworkManager.shared.classifyFlower(from: image, onSuccess: { [weak self] (flower, _) in
            guard let flower = flower else {
                return
            }
            XCTAssertTrue(flower.name == "Rose")
            expectation.fulfill()
            
            }, onFailure: { [weak self] (error, _) in
                XCTFail("Error not covered by previous asserts.")
        })
        
        XCTAssertTrue(NetworkManager.baseServerPath == Environment.baseServerPath)
    }
    
    func testBaseViewController() {
        let vc = BaseViewController()
        vc.alert(message: "Wait")
        vc.alert(message: "W", title: "T")
        vc.showActivityIndicator(true)
        vc.showActivityIndicator(false)
        vc.showWaitingAlert()
        vc.hideWaitingAlert()
    }


}

