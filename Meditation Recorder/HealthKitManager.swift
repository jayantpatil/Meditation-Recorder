//
//  HealthKitManager.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import HealthKit

class HealthKitManager {
    public static let shared = HealthKitManager()
    private let healthStore = HKHealthStore()
    
    private init() {}
    
    // Request authorization to write meditation data
    func requestAuthorization(mindfulType: HKCategoryType? = HKObjectType.categoryType(forIdentifier: .mindfulSession)) {
        guard let mindfulType else { return }
        
        let typesToWrite: Set = [mindfulType]
        let typesToRead: Set = [mindfulType]
        healthStore.requestAuthorization(toShare: typesToWrite, read: typesToRead) { success, error in
            print("Success \(success)")
            print("Error \(error)")
            
            if !success {
                print("Error requesting HealthKit authorization: \(error!)")
            }
        }
    }
    
    
}
