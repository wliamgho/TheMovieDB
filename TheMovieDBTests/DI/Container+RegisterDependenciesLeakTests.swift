//
//  Container+RegisterDependenciesTests.swift
//  TheMovieDBTests
//
//  Created by William on 11/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import XCTest
import Nimble
import Quick
import SpecLeaks

@testable import TheMovieDB

class Container_RegisterDependenciesTests: QuickSpec {
    override func spec() {
        let container = registerDependenciesTest()

        describe("AppCoordinator") {
            describe("constructor") {
                let appCoordinator = LeakTest {
                    return container.resolve(AppCoordinator.self)!
                }
                it("must not leak") {
                    expect(appCoordinator).toNot(leak())
                }
            }
        }
        
        describe("LoginCoordinator") {
            describe("constructor") {
                let loginCoordinator = LeakTest {
                    return container.resolve(LoginCoordinator.self)!
                }
                it("must not leak") {
                    expect(loginCoordinator).toNot(leak())
                }
            }
        }
    
        describe("LoginViewModel") {
            describe("constructor") {
                let vm = LeakTest {
                    return container.resolve(LoginViewModel.self)!
                }
                it("must not leak") {
                    expect(vm).toNot(leak())
                }
            }
        }
    
        describe("LoginViewController") {
            describe("viewDidLoad") {
                let vc = LeakTest {
                    return container.resolve(LoginViewController.self)!
                }
                it("must not leak") {
                    expect(vc).toNot(leak())
                }
            }
        }
    }
}
