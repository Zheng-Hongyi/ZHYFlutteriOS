//
//  FlutterManager.swift
//  TestFlutter
//
//  Created by 郑洪毅 on 2025/3/26.
//

import UIKit
import Flutter

class FlutterManager {
    static let shared = FlutterManager()
        
    private let engineGroup = FlutterEngineGroup(name: "shared_engines", project: nil)
    private var engines = [String: FlutterEngine]()
    
    func engine(for identifier: String) -> FlutterEngine {
        if let existingEngine = engines[identifier] {
            return existingEngine
        }
        
        let newEngine = engineGroup.makeEngine(with: nil)
        engines[identifier] = newEngine
        return newEngine
    }
    
    func removeEngine(for identifier: String) {
        engines.removeValue(forKey: identifier)
    }
}
